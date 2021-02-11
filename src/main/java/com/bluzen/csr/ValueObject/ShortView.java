package com.bluzen.csr.ValueObject;

public class ShortView{
	String CaseID;
	String Environment;
	String Description;
	public String getCaseID() {
		return CaseID;
	}
	public void setCaseID(String caseID) {
		CaseID = caseID;
	}
	public String getEnvironment() {
		return Environment;
	}
	public void setEnvironment(String environment) {
		Environment = environment;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
}