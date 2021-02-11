package com.bluzen.csr.Controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bluzen.csr.Service.FileUploadService;
import com.bluzen.csr.Service.Service;
import com.bluzen.csr.ValueObject.ApplyCommute;
import com.bluzen.csr.ValueObject.CaseApply;
import com.bluzen.csr.ValueObject.FileSave;
import com.bluzen.csr.ValueObject.Sign;
import com.bluzen.csr.ValueObject.WebAccount;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AjaxController {
	
	private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);
	
	@Autowired
	Service FunctionService;
	@Autowired
	FileUploadService fileUploadService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/Commit", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> Commit(
			@RequestParam("Name")String Name,
			@RequestParam("Tel")String TelePhone,
			@RequestParam("Email")String Email,
			@RequestParam("Environment")int Environment,
			@RequestParam("Country")int Country,
			@RequestParam("Address")String Address,
			@RequestParam("Describe")String Describe,
			@RequestParam("Files")List<MultipartFile> Files,
			@RequestParam("g-recaptcha-response")String Response
			) throws Exception{
		
		Map<String, Object> result = new HashMap<String,Object>();
		
		try {
			if(!FunctionService.ReCaptcha(Response)) {
				throw new Exception("ReCaptcha error please check.");
			}
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("ddMM");
			String date = dateFormat.format(new Date());
			
			CaseApply _Temp = new CaseApply();
			_Temp.setCaseId("BVSC"+ date);
			_Temp.setName(Name);
			_Temp.setTelephone(TelePhone);
			_Temp.setEmail(Email);
			_Temp.setEnvironment(Environment);
			_Temp.setCountry(Country);
			_Temp.setAddress(Address);
			_Temp.setDescription(Describe);
			
			String r = FunctionService.ApplyCase(_Temp);
			
			try {
				if(Integer.parseInt(r) == -1) {
					throw new Exception("Can not create caseid. please retry");
				}
			}catch(NumberFormatException e)
			{
				logger.debug("Created CaseId");
			}
			
			for(MultipartFile x : Files) {
				if(!x.isEmpty()) {
					FileSave Temp = new FileSave();
					Temp.setCaseId(r);
					Temp.setOriginalFileName(x.getOriginalFilename());
					Temp.setSaveFileName(fileUploadService.restore(x));
					
					if(FunctionService.UploadFile(Temp) == 0) {
						FunctionService.ApplyRollback(r);
						throw new Exception("Image upload fail.");
					}
				}
			}
			
			FunctionService.SendToMail(_Temp.getEmail(),"Dear Customer,"
					+ "<br>Thank your for contacting Bluzen Technical Support."
					+ "<br><br>We've escalated your case to our technical department."
					+ "<br>CaseID : \"" + _Temp.getCaseId() + "\""
					+ "<br>Issue Description: \""+_Temp.getDescription()+"\""
					+ "<br><br><br><br>Thank you very much."
					+ "<br>Please do not reply to this email as it is auto-generated."
					+ "<br><br>Best Regards,"
					+ "<br>Bluzen CallCentre Support Team");
			
			result.put("Code", 0);
			result.put("Data", r);
			result.put("Msg", "Successful");
		} catch(Exception es) {
			logger.info(es.toString());
			result.put("Code", -1);
			result.put("Msg", "Apply fail. Please contact to server admin.");
		}
		
		return result;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> adminlogin(
			Sign vo,
			HttpServletRequest req
			) throws Exception{
		
		Map<String, Object> result = new HashMap<String,Object>();
		
		HttpSession Session = req.getSession();
		WebAccount Account = FunctionService.Login(vo);
		
		if(Account != null) {
			Session.setAttribute("User", Account);
			result.put("Code",0);
			result.put("Msg", "Successful.");
		}else {
			Session.setAttribute("User", null);
			result.put("Code",-1);
			result.put("Msg", "fail.");
		}
		
		return result;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
        session.invalidate();
        
        return "redirect:/sign";
	}
	
	@RequestMapping(value = "/unassigned", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> unassignlist(
			HttpServletRequest req
			) throws Exception{
		
		Map<String, Object> result = new HashMap<String,Object>();
		
		result.put("Code",0);
		result.put("Data", FunctionService.GetUnassigned());
		
		return result;
	}
	
	@RequestMapping(value = "/commuteEnter", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> Enter(
			@RequestParam("latitude")float Latitude,
			@RequestParam("longitude")float Longitude,
			@RequestParam("LocationCode")int LocationCode,
			@RequestParam("Files")MultipartFile File,
			HttpServletRequest req
			) throws Exception{
		HttpSession Session = req.getSession();
		WebAccount User = (WebAccount)Session.getAttribute("User");
		Map<String, Object> result = new HashMap<String,Object>();
		
		try {	
			if(!File.isEmpty()) {
				ApplyCommute Temp = new ApplyCommute();
				Temp.setLatitude(Latitude);
				Temp.setLongitude(Longitude);
				Temp.setOriginalFileName(File.getOriginalFilename());
				Temp.setSaveFileName(fileUploadService.restore(File));
				Temp.setType(1);
				Temp.setLocation(LocationCode);
				Temp.setEmployeeNumber(User.getEmployeeNumber());
				
				if(FunctionService.ResultAuthentication(Temp) == 0) {
					result.put("Code", 0);
					result.put("Msg", "Authentication Successful.");
				}else {
					result.put("Code", 1);
					result.put("Msg", "Authentication Fail.");
				}
				
				
			}else {
				result.put("Code", 0);
				result.put("Data", "File Upload Fail");
				result.put("Msg", "Fail");
			}
			
			
		} catch(Exception es) {
			logger.info(es.toString());
			result.put("Code", -1);
			result.put("Msg", "Apply fail. Please contact to server admin.");
		}
		
		return result;
	}
	
	@RequestMapping(value = "/commuteExit", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> Exit(
			@RequestParam("latitude")float Latitude,
			@RequestParam("longitude")float Longitude,
			@RequestParam("LocationCode")int LocationCode,
			@RequestParam("Files")MultipartFile File,
			HttpServletRequest req
			) throws Exception{
		HttpSession Session = req.getSession();
		WebAccount User = (WebAccount)Session.getAttribute("User");
		Map<String, Object> result = new HashMap<String,Object>();
		
		try {	
			if(!File.isEmpty()) {
				ApplyCommute Temp = new ApplyCommute();
				Temp.setLatitude(Latitude);
				Temp.setLongitude(Longitude);
				Temp.setOriginalFileName(File.getOriginalFilename());
				Temp.setSaveFileName(fileUploadService.restore(File));
				Temp.setType(0);
				Temp.setLocation(LocationCode);
				Temp.setEmployeeNumber(User.getEmployeeNumber());
				
				if(FunctionService.ResultAuthentication(Temp) == 0) {
					result.put("Code", 0);
					result.put("Msg", "Authentication Successful.");
				}else {
					result.put("Code", 1);
					result.put("Msg", "Authentication Fail.");
				}
				
				
			}else {
				result.put("Code", 0);
				result.put("Data", "File Upload Fail");
				result.put("Msg", "Fail");
			}
			
			
		} catch(Exception es) {
			logger.info(es.toString());
			result.put("Code", -1);
			result.put("Msg", "Apply fail. Please contact to server admin.");
		}
		
		return result;
	}
}
