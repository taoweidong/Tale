package com.ajr.webapp.utils;

import java.io.InputStream;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;

/**
 * 七牛云文件上传工具.
 * @author Taowd
 * @version 2019年3月13日
 * @see QiniuUpload
 */
@Service
public class QiniuUpload {

	/**
	 * 日志工具类.
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(QiniuUpload.class);

	@Value("${qiniu.ak}")
	private String ak;
	@Value("${qiniu.sk}")
	private String sk;
	@Value("${qiniu.bucket}")
	private String bucket;
	@Value("${qiniu.domain}")
	private String domain;
	private static UploadManager uploadManager;
	private static String upToken;

	/**
	 * 指定路径上传文件.
	 * @param localFilePath 文件路径
	 * @return 七牛云外链地址
	 */
	public String postFileByStream(String localFilePath, InputStream stream) {
		StringBuffer sbStr = new StringBuffer();
		// 构造一个带指定Zone对象的配置类
		Configuration cfg = new Configuration(Zone.zone0());
		// ...其他参数参考类注释
		UploadManager uploadManager = new UploadManager(cfg);

		// 如果是Windows情况下，格式是 D:\\qiniu\\test.png
		// 默认不指定key的情况下，以文件内容的hash值作为文件名
		String key = FilenameUtils.getName(localFilePath);
		Auth auth = Auth.create(ak, sk);
		String upToken = auth.uploadToken(bucket);

		try {
			Response response = uploadManager.put(stream, key, upToken, null, null);
			// 解析上传成功的结果
			DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
			if (!StringUtils.equals(putRet.key, putRet.hash)) {
				sbStr.append(domain + putRet.key + "?" + putRet.hash);
			} else {
				sbStr.append(domain + putRet.key);
			}
		} catch (QiniuException ex) {
			Response r = ex.response;
			System.err.println(r.toString());
			try {
				System.err.println(r.bodyString());
			} catch (QiniuException ex2) {
				// ignore
			}
		}
		return sbStr.toString();
	}

	/**
	 * 指定路径上传文件.
	 * @param localFilePath 文件路径
	 * @return 七牛云外链地址
	 */
	public String postFile(String localFilePath) {
		StringBuffer sbStr = new StringBuffer();
		// 构造一个带指定Zone对象的配置类
		Configuration cfg = new Configuration(Zone.zone0());
		// ...其他参数参考类注释
		UploadManager uploadManager = new UploadManager(cfg);

		// 如果是Windows情况下，格式是 D:\\qiniu\\test.png
		// 默认不指定key的情况下，以文件内容的hash值作为文件名
		String key = FilenameUtils.getName(localFilePath);
		Auth auth = Auth.create(ak, sk);
		String upToken = auth.uploadToken(bucket);

		try {
			Response response = uploadManager.put(localFilePath, key, upToken);
			// 解析上传成功的结果
			DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
			if (!StringUtils.equals(putRet.key, putRet.hash)) {
				sbStr.append(domain + putRet.key + "?" + putRet.hash);
			} else {
				sbStr.append(domain + putRet.key);
			}
		} catch (QiniuException ex) {
			Response r = ex.response;
			System.err.println(r.toString());
			try {
				System.err.println(r.bodyString());
			} catch (QiniuException ex2) {
				// ignore
			}
		}
		return sbStr.toString();
	}

	/**
	 * 上传文件字节码.
	 * @param file
	 * @param key
	 * @return
	 */
	public String postFile(byte[] file, String key) {
		StringBuffer sbStr = new StringBuffer();
		// 构造一个带指定Zone对象的配置类
		Configuration cfg = new Configuration(Zone.zone0());
		// ...其他参数参考类注释
		uploadManager = new UploadManager(cfg);
		// ...生成上传凭证，然后准备上传 //默认不指定key的情况下，以文件内容的hash值作为文件名
		Auth auth = Auth.create(ak, sk);
		upToken = auth.uploadToken(bucket);
		try {
			Response response = uploadManager.put(file, key, upToken);
			// 解析上传成功的结果
			DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
			if (!StringUtils.equals(putRet.key, putRet.hash)) {
				sbStr.append(domain + putRet.key + "?" + putRet.hash);
			} else {
				sbStr.append(domain + putRet.key);
			}
		} catch (QiniuException ex) {
			LOGGER.error("七牛云上传文件失败", ex);
		}
		return sbStr.toString();
	}

}
