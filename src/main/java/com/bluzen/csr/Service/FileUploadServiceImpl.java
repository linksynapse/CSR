package com.bluzen.csr.Service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class FileUploadServiceImpl implements FileUploadService{
	private static final Logger logger = LoggerFactory.getLogger(FileUploadService.class);
	private static final String SAVE_PATH = "/opt/tomcat/webapps/CSR/resources/uploads/";//"/Users/ktlee/Documents/workspace-sts-3.9.13.RELEASE/CSRV2/src/main/webapp/resources/uploads";
	private static final String PREFIX_URL = "/uploads/";
	
	@Override
	public String restore(MultipartFile multipartFile) {
		String url = null;
		
		try {
			// 파일 정보
			String originFilename = multipartFile.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			Long size = multipartFile.getSize();
			if(size > 1024*1024*100) {
				// 30MB Over
				throw new RuntimeException("File size over.");
			}
			if(extName.toUpperCase().indexOf("PNG") != -1 || extName.toUpperCase().indexOf("JPG") != -1 || extName.toUpperCase().indexOf("JPEG") != -1 || extName.toUpperCase().indexOf("GIF") != -1) {
				String saveFileName = genSaveFileName(extName);
				
				writeFile(multipartFile, saveFileName);
				url = PREFIX_URL + saveFileName;
			}else {
				logger.info(extName.toUpperCase());
				logger.info(Integer.toString(extName.toUpperCase().length()));
				throw new RuntimeException("Only Img file can upload.");
			}
		}
		catch (IOException e) {
			throw new RuntimeException(e);
		}
		return url;
	}
	
	private String genSaveFileName(String extName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;
		
		return fileName;
	}
	
	private boolean writeFile(MultipartFile multipartFile, String saveFileName) throws IOException{
		boolean result = false;

		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
		fos.write(data);
		fos.close();
		
		return result;
	}
}