package com.bluzen.csr.ValueObject;

public class CaseApply{
	String CaseId;
	String Name;
	String Email;
	String Telephone;
	Integer Environment;
	Integer Country;
	String Address;
	String Description;
	public String getCaseId() {
		return CaseId;
	}
	public void setCaseId(String caseId) {
		CaseId = caseId;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getTelephone() {
		return Telephone;
	}
	public void setTelephone(String telephone) {
		Telephone = telephone;
	}
	public Integer getEnvironment() {
		return Environment;
	}
	public void setEnvironment(Integer environment) {
		Environment = environment;
	}
	public Integer getCountry() {
		return Country;
	}
	public void setCountry(Integer country) {
		Country = country;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
}