package com.bluzen.csr.Service;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService{
	public String restore(MultipartFile multipartFile);
}