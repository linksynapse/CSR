package com.bluzen.csr.ValueObject;

public class FileSave{
	String CaseId;
	String OriginalFileName;
	String SaveFileName;
	public String getCaseId() {
		return CaseId;
	}
	public void setCaseId(String caseId) {
		CaseId = caseId;
	}
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