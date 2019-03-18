package com.my.blog.website.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.util.Random;

import org.jasypt.util.text.BasicTextEncryptor;

/**
 * 工具类 Created by BlueT on 2017/3/9.
 */
public class Tools {
	private static final Random random = new Random();

	@SuppressWarnings("resource")
	public static void copyFileUsingFileChannels(File source, File dest) throws IOException {
		FileChannel inputChannel = null;
		FileChannel outputChannel = null;
		try {
			inputChannel = new FileInputStream(source).getChannel();
			outputChannel = new FileOutputStream(dest).getChannel();
			outputChannel.transferFrom(inputChannel, 0, inputChannel.size());
		} finally {
			assert inputChannel != null;
			inputChannel.close();
			assert outputChannel != null;
			outputChannel.close();
		}
	}

	public static int rand(int min, int max) {
		return random.nextInt(max) % (max - min + 1) + min;
	}

	public static String flowAutoShow(double value) {
		// Math.round 方法接收 float 和 double 类型,如果参数是 int 的话,会强转为 float,这个时候调用该方法无意义
		int kb = 1024;
		int mb = 1048576;
		int gb = 1073741824;
		double abs = Math.abs(value);
		if (abs > gb) {
			return Math.round(value / gb) + "GB";
		} else if (abs > mb) {
			return Math.round(value / mb) + "MB";
		} else if (abs > kb) {
			return Math.round(value / kb) + "KB";
		}
		return Math.round(value) + "";
	}

	public static String enAes(String data, String key) throws Exception {
//		Cipher cipher = Cipher.getInstance("AES");
//		SecretKeySpec secretKeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
//		cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec);
//		byte[] encryptedBytes = cipher.doFinal(data.getBytes());
//		return new BASE64Encoder().encode(encryptedBytes);
		// 加密方式：jasypt
		BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
		textEncryptor.setPassword(WebConst.AES_SALT);
		return textEncryptor.encrypt("data");
	}

	public static String deAes(String data, String key) throws Exception {
//		Cipher cipher = Cipher.getInstance("AES");
//		SecretKeySpec secretKeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
//		cipher.init(Cipher.DECRYPT_MODE, secretKeySpec);
//		byte[] cipherTextBytes = new BASE64Decoder().decodeBuffer(data);
//		byte[] decValue = cipher.doFinal(cipherTextBytes);
//		return new String(decValue);
		// 解密方式：jasypt
		BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
		textEncryptor.setPassword(WebConst.AES_SALT);
		return textEncryptor.decrypt("data");
	}

	/**
	 * 判断字符串是否为数字和有正确的值
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNumber(String str) {
		// Pattern pattern=Pattern.compile("[0-9]*");
		// return pattern.matcher(str).matches();
		if (null != str && 0 != str.trim().length() && str.matches("\\d*")) {
			return true;
		}

		return false;
	}
}
