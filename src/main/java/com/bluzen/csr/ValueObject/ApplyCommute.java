package com.bluzen.csr.ValueObject;

public class ApplyCommute{
	String EmployeeNumber;
	String OriginalFileName;
	String SaveFileName;
	int Type;
	int Location;
	float latitude;
	float longitude;
	int Result;
	public String getEmployeeNumber() {
		return EmployeeNumber;
	}
	public void setEmployeeNumber(String employeeNumber) {
		EmployeeNumber = employeeNumber;
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
	public float getLatitude() {
		return latitude;
	}
	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}
	public float getLongitude() {
		return longitude;
	}
	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}
	public int getType() {
		return Type;
	}
	public void setType(int type) {
		Type = type;
	}
	public int getResult() {
		return Result;
	}
	public void setResult(int result) {
		Result = result;
	}
	public int getLocation() {
		return Location;
	}
	public void setLocation(int location) {
		Location = location;
	}
	
}