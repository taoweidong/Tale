package com.my.blog.website.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * zip压缩工具类
 */
public class ZipUtils {

	/**
	 * zip压缩文件夹.
	 * @param srcFolder
	 * @param destZipFile
	 * @throws Exception
	 */
	public static void zipFolder(String srcFolder, String destZipFile) throws Exception {
		ZipOutputStream zip = null;
		FileOutputStream fileWriter = null;

		fileWriter = new FileOutputStream(destZipFile);
		zip = new ZipOutputStream(fileWriter);

		addFolderToZip("", srcFolder, zip);
		zip.flush();
		zip.close();
	}

	/**
	 * ZIP压缩文件.
	 * @param filePath
	 * @param zipPath
	 * @throws Exception
	 */
	public static void zipFile(String filePath, String zipPath) throws Exception {
		byte[] buffer = new byte[1024];
		FileOutputStream fos = new FileOutputStream(zipPath);
		ZipOutputStream zos = new ZipOutputStream(fos);
		ZipEntry ze = new ZipEntry("spy.log");
		zos.putNextEntry(ze);
		FileInputStream in = new FileInputStream(filePath);
		int len;
		while ((len = in.read(buffer)) > 0) {
			zos.write(buffer, 0, len);
		}
		in.close();
		zos.closeEntry();
		// remember close it
		zos.close();
	}

	/**
	 * 添加文件到zip文件中.
	 * @param path
	 * @param srcFile
	 * @param zip
	 * @throws Exception
	 */
	@SuppressWarnings("resource")
	public static void addFileToZip(String path, String srcFile, ZipOutputStream zip)
			throws Exception {

		File folder = new File(srcFile);
		if (folder.isDirectory()) {
			addFolderToZip(path, srcFile, zip);
		} else {
			byte[] buf = new byte[1024];
			int len;
			FileInputStream in = new FileInputStream(srcFile);
			zip.putNextEntry(new ZipEntry(path + "/" + folder.getName()));
			while ((len = in.read(buf)) > 0) {
				zip.write(buf, 0, len);
			}
		}
	}

	/**
	 * 添加文件夹到zip文件中.
	 * @param path
	 * @param srcFolder
	 * @param zip
	 * @throws Exception
	 */
	public static void addFolderToZip(String path, String srcFolder, ZipOutputStream zip)
			throws Exception {
		File folder = new File(srcFolder);
		if (null != path && folder.isDirectory()) {
			String[] fileList = folder.list();
			if (fileList != null) {
				for (String fileName : fileList) {
					if (path.equals("")) {
						addFileToZip(folder.getName(), srcFolder + "/" + fileName, zip);
					} else {
						addFileToZip(path + "/" + folder.getName(), srcFolder + "/" + fileName,
								zip);
					}
				}
			}
		}
	}

}