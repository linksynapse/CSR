package com.bluzen.csr.Service;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Repository;

import com.bluzen.csr.DataObjectAccess.DAO;
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
public class ServiceImpl implements Service {
	@Inject
	private DAO DataObjAccess;
	
	@Autowired 
	private JavaMailSenderImpl mailSender;
	
	@Override
	public String ApplyCase(CaseApply vo) throws Exception{
		return DataObjAccess.ApplyCase(vo);
	}
	
	@Override
	public int UploadFile(FileSave vo) throws Exception{
		return DataObjAccess.UploadFile(vo);
	}
	
	@Override
	public int ApplyRollback(String CaseId) throws Exception{
		return DataObjAccess.ApplyRollback(CaseId);
	}
	
	@Override
	public List<Category> GetEnvironment() throws Exception{
		return DataObjAccess.GetEnvironment();
	}
	
	@Override
	public List<Category> GetCountry() throws Exception{
		return DataObjAccess.GetCountry();
	}
	
	@Override
	public boolean ReCaptcha(String response) throws Exception{
		HttpURLConnection conn = (HttpURLConnection) new URL("https://www.google.com/recaptcha/api/siteverify").openConnection();
	    String params = "secret=6LfoL9EZAAAAAF5KEXZ3RIZYGjWyUCk-F2AsEyBf" + "&response=" + response;
	    conn.setRequestMethod("POST");
	    conn.setDoOutput(true);
	    DataOutputStream wr = new DataOutputStream(conn.getOutputStream());
	    wr.writeBytes(params);
	    wr.flush();
	    wr.close();
	    
	    int responseCode = conn.getResponseCode();
	    StringBuffer responseBody = new StringBuffer();
	    if (responseCode == 200) {
	        
	        BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
	        BufferedReader reader = new BufferedReader(new InputStreamReader(bis));
	        String line;
	        while ((line = reader.readLine()) != null) {
	            responseBody.append(line);
	        }
	        bis.close();
	        
	        if(responseBody.toString().indexOf("\"success\": true") > -1)
	        {
	        	return true;
	        }else {
	        	return false;
	        }
	    }else {
	    	return false;
	    }
	}
	
	@Override
	public void SendToMail(final String To, final String Context) throws Exception {
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override 
			public void prepare(MimeMessage mimeMessage) throws Exception { 
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("callcentre@bluzen.com");
				helper.setTo(To);
				helper.setSubject("Contact Mail");
				helper.setText(Context, true);
				}
			};
		mailSender.send(preparator);
	}
	
	@Override
	public WebAccount Login(Sign vo) throws Exception{
		return DataObjAccess.Login(vo);
	}
	
	@Override
	public List<ShortView> GetUnassigned() throws Exception{
		return DataObjAccess.GetUnassigned();
	}
	
	@Override
	public List<ShortView> GetOnGoing(WebAccount vo) throws Exception{
		return DataObjAccess.GetOnGoing(vo);
	}
	
	@Override
	public List<ShortView> GetComplete(WebAccount vo) throws Exception{
		return DataObjAccess.GetComplete(vo);
	}
	
	@Override
	public List<ShortView> GetEscalated(WebAccount vo) throws Exception{
		return DataObjAccess.GetEscalated(vo);
	}
	
	@Override
	public List<ShortView> GetOutOfScope(WebAccount vo) throws Exception{
		return DataObjAccess.GetOutOfScope(vo);
	}
	
	@Override
	public CaseDetail GetDetailView(String CaseID) throws Exception{
		return DataObjAccess.GetDetailView(CaseID);
	}
	
	@Override
	public List<FileInfo> GetImageList(String CaseID) throws Exception{
		return DataObjAccess.GetImageList(CaseID);
	}
	
	@Override
	public int SetChangeStatus(Status vo) throws Exception{
		return DataObjAccess.SetChangeStatus(vo);
	}
	
	@Override
	public List<ManageCase> GetManageView(History h) throws Exception{
		return DataObjAccess.GetManageView(h);
	}
	
	@Override
	public int DisabledCase(String CaseID) throws Exception{
		return DataObjAccess.DisabledCase(CaseID);
	}
	
	@Override
	public List<Category> GetLocation() throws Exception{
		return DataObjAccess.GetLocation();
	}
	
	@Override
	public int ResultAuthentication(ApplyCommute ac) throws Exception{
		GeoLocation GL = DataObjAccess.GetGLocation(ac);
		double DistanceFromTarget = distance(ac.getLatitude(),ac.getLongitude(),GL.getLatitude(),GL.getLongitude(),"kilometer");
		
		if(DistanceFromTarget < GL.getAccuracy()) {
			ac.setResult(1);
			DataObjAccess.SetHistoryCommute(ac);
			return 0;
		}else {
			ac.setResult(0);
			DataObjAccess.SetHistoryCommute(ac);
			return -1;
		}
	}
	
	private static double distance(double lat1, double lon1, double lat2, double lon2, String unit) {
        
        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
         
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
         
        if (unit == "kilometer") {
            dist = dist * 1.609344;
        } else if(unit == "meter"){
            dist = dist * 1609.344;
        }
 
        return (dist);
    }
     
 
    // This function converts decimal degrees to radians
    private static double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }
     
    // This function converts radians to decimal degrees
    private static double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }
}