package com.bluzen.csr.ValueObject;

public class FileInfo{
	String OriginalFileName;
	String SaveFileName;
	public String getOriginalFileName() {
		return OriginalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		OriginalFileName = originalFileName;
	}
	public String getSaveFileName() {
		return SaveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		SaveFileName = saveFileName;
	}
}