package com.bluzen.csr.Service;

import java.util.List;

import com.bluzen.csr.ValueObject.ApplyCommute;
import com.bluzen.csr.ValueObject.CaseApply;
import com.bluzen.csr.ValueObject.CaseDetail;
import com.bluzen.csr.ValueObject.Category;
import com.bluzen.csr.ValueObject.FileInfo;
import com.bluzen.csr.ValueObject.FileSave;
import com.bluzen.csr.ValueObject.History;
import com.bluzen.csr.ValueObject.ManageCase;
import com.bluzen.csr.ValueObject.ShortView;
import com.bluzen.csr.ValueObject.Sign;
import com.bluzen.csr.ValueObject.Status;
import com.bluzen.csr.ValueObject.WebAccount;

public interface Service{
	public String ApplyCase(CaseApply vo) throws Exception;
	public int UploadFile(FileSave vo) throws Exception;
	public int ApplyRollback(String CaseId) throws Exception;
	public boolean ReCaptcha(String response) throws Exception;
	public void SendToMail(final String To, final String Context) throws Exception;
	public List<Category> GetEnvironment() throws Exception;
	public List<Category> GetCountry() throws Exception;
	public WebAccount Login(Sign vo) throws Exception;
	public List<ShortView> GetUnassigned() throws Exception;
	public List<ShortView> GetOnGoing(WebAccount vo) throws Exception;
	public List<ShortView> GetComplete(WebAccount vo) throws Exception;
	public List<ShortView> GetEscalated(WebAccount vo) throws Exception;
	public List<ShortView> GetOutOfScope(WebAccount vo) throws Exception;
	public CaseDetail GetDetailView(String CaseID) throws Exception;
	public List<FileInfo> GetImageList(String CaseID) throws Exception;
	public int SetChangeStatus(Status vo) throws Exception;
	public List<ManageCase> GetManageView(History h) throws Exception;
	public int DisabledCase(String CaseID) throws Exception;
	public List<Category> GetLocation() throws Exception;
	public int ResultAuthentication(ApplyCommute ac) throws Exception;
}