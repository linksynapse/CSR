package com.bluzen.csr.ValueObject;

public class Status{
	String EmployeeId;
	String CaseID;
	int Status;
	String RootCause;
	String Solution;
	String Taskclass;
	int ContactType;
	public String getCaseID() {
		return CaseID;
	}
	public void setCaseID(String caseID) {
		CaseID = caseID;
	}
	public int getStatus() {
		return Status;
	}
	public void setStatus(int status) {
		Status = status;
	}
	public String getEmployeeId() {
		return EmployeeId;
	}
	public void setEmployeeId(String employeeId) {
		EmployeeId = employeeId;
	}
	public String getRootCause() {
		return RootCause;
	}
	public void setRootCause(String rootCause) {
		RootCause = rootCause;
	}
	public String getSolution() {
		return Solution;
	}
	public void setSolution(String solution) {
		Solution = solution;
	}
	public String getTaskclass() {
		return Taskclass;
	}
	public void setTaskclass(String taskclass) {
		Taskclass = taskclass;
	}
	public int getContactType() {
		return ContactType;
	}
	public void setContactType(int contactType) {
		ContactType = contactType;
	}
}