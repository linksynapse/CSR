package com.bluzen.csr.ValueObject;

public class WebAccount{
	String EmployeeNumber;
	String Name;
	String Position;
	String Address;
	String Telephone;
	String National;
	String Office;
	Integer Security;
	public String getEmployeeNumber() {
		return EmployeeNumber;
	}
	public void setEmployeeNumber(String employeeNumber) {
		EmployeeNumber = employeeNumber;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getPosition() {
		return Position;
	}
	public void setPosition(String position) {
		Position = position;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getTelephone() {
		return Telephone;
	}
	public void setTelephone(String telephone) {
		Telephone = telephone;
	}
	public String getNational() {
		return National;
	}
	public void setNational(String national) {
		National = national;
	}
	public String getOffice() {
		return Office;
	}
	public void setOffice(String office) {
		Office = office;
	}
	public Integer getSecurity() {
		return Security;
	}
	public void setSecurity(Integer security) {
		Security = security;
	}
}