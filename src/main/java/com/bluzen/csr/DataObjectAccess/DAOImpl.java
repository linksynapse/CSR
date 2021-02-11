package com.bluzen.csr.DataObjectAccess;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bluzen.csr.ValueObject.ApplyCommute;
import com.bluzen.csr.ValueObject.CaseApply;
import com.bluzen.csr.ValueObject.CaseDetail;
import com.bluzen.csr.ValueObject.Category;
import com.bluzen.csr.ValueObject.FileInfo;
import com.bluzen.csr.ValueObject.FileSave;
import com.bluzen.csr.ValueObject.GeoLocation;
import com.bluzen.csr.ValueObject.History;
import com.bluzen.csr.ValueObject.ManageCase;
import com.bluzen.csr.ValueObject.ShortView;
import com.bluzen.csr.ValueObject.Sign;
import com.bluzen.csr.ValueObject.Status;
import com.bluzen.csr.ValueObject.WebAccount;

@Repository
public class DAOImpl implements DAO { 
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public String ApplyCase(CaseApply vo) throws Exception{
		return sqlSession.selectOne("csr.apply", vo);
	}
	
	@Override
	public int UploadFile(FileSave vo) throws Exception{
		return sqlSession.insert("csr.files", vo);
	}
	
	@Override
	public int ApplyRollback(String CaseId) throws Exception{
		try {
			sqlSession.delete("csr.rollbackUpload", CaseId);
			sqlSession.delete("csr.rollbackCase", CaseId);
			return 0;
		}catch(Exception e) {
			return -1;
		}
	}
	@Override
	public List<Category> GetEnvironment() throws Exception{
		return sqlSession.selectList("csr.getEnvironment");
	}
	
	@Override
	public List<Category> GetCountry() throws Exception{
		return sqlSession.selectList("csr.getCountry");
	}
	
	@Override
	public WebAccount Login(Sign vo) throws Exception{
		return sqlSession.selectOne("admin.login", vo);
	}
	
	@Override
	public List<ShortView> GetUnassigned() throws Exception{
		return sqlSession.selectList("process.Unassigned");
	}
	
	@Override
	public List<ShortView> GetOnGoing(WebAccount vo) throws Exception{
		return sqlSession.selectList("process.OnGoing", vo);
	}
	
	@Override
	public List<ShortView> GetComplete(WebAccount vo) throws Exception{
		return sqlSession.selectList("process.Complete", vo);
	}
	
	@Override
	public List<ShortView> GetEscalated(WebAccount vo) throws Exception{
		return sqlSession.selectList("process.Escalated", vo);
	}
	
	@Override
	public List<ShortView> GetOutOfScope(WebAccount vo) throws Exception{
		return sqlSession.selectList("process.OutOfScope", vo);
	}
	
	@Override
	public CaseDetail GetDetailView(String CaseID) throws Exception{
		return sqlSession.selectOne("process.Detail", CaseID);
	}
	
	@Override
	public List<FileInfo> GetImageList(String CaseID) throws Exception{
		return sqlSession.selectList("process.Imgload", CaseID);
	}
	
	@Override
	public int SetChangeStatus(Status vo) throws Exception{
		if(vo.getStatus() == 1) {
			sqlSession.update("process.AcceptTimeTick", vo);
		}else {
			sqlSession.update("process.ClearTimeTick", vo);
		}
		
		return sqlSession.update("process.ChangeStatus", vo);
	}
	
	@Override
	public List<ManageCase> GetManageView(History h) throws Exception{
		return sqlSession.selectList("process.ManageView", h);
	}
	
	@Override
	public int DisabledCase(String CaseID) throws Exception{
		return sqlSession.update("process.Disable", CaseID);
	}
	
	@Override
	public List<Category> GetLocation() throws Exception{
		return sqlSession.selectList("process.Location");
	}
	
	@Override
	public GeoLocation GetGLocation(ApplyCommute ac) throws Exception{
		return sqlSession.selectOne("process.GeoValue",ac);
	}
	
	@Override
	public int SetHistoryCommute(ApplyCommute ac) throws Exception{
		return sqlSession.insert("process.CommuteHistory",ac);
	}
}