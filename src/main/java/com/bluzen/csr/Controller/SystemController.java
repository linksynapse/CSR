package com.bluzen.csr.Controller;

import java.util.List;

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

import com.bluzen.csr.Service.Service;
import com.bluzen.csr.ValueObject.CaseDetail;
import com.bluzen.csr.ValueObject.FileInfo;
import com.bluzen.csr.ValueObject.History;
import com.bluzen.csr.ValueObject.ManageCase;
import com.bluzen.csr.ValueObject.Status;
import com.bluzen.csr.ValueObject.WebAccount;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SystemController {
	
	private static final Logger logger = LoggerFactory.getLogger(SystemController.class);
	
	@Autowired
	Service FunctionService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws Exception{
		
		model.addAttribute("Country", FunctionService.GetCountry());
		model.addAttribute("Environment", FunctionService.GetEnvironment());
		
		return "contact";
	}
	
	@RequestMapping(value = "/sign", method = RequestMethod.GET)
	public String login(Model model) throws Exception{
		return "sign";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String report(@RequestParam("CaseID")String CaseId, HttpServletRequest req, Model model) throws Exception{
		CaseDetail CaseData = FunctionService.GetDetailView(CaseId);
		List<FileInfo> Images = FunctionService.GetImageList(CaseId);
		
		HttpSession Session = req.getSession();
		WebAccount User = (WebAccount)Session.getAttribute("User");
		
		if(User != null) {			
			
			model.addAttribute("Security", User.getSecurity());
		}else {
			return "redirect:/sign";
		}
		
		model.addAttribute("Items", CaseData);
		model.addAttribute("Images", Images);
		
		return "detail";
	}
	
	@RequestMapping(value = "/accept", method = RequestMethod.GET)
	public String detail(@RequestParam("CaseID")String CaseId, HttpServletRequest req, Model model) throws Exception{
		CaseDetail CaseData = FunctionService.GetDetailView(CaseId);
		List<FileInfo> Images = FunctionService.GetImageList(CaseId);
		
		HttpSession Session = req.getSession();
		WebAccount User = (WebAccount)Session.getAttribute("User");
		
		if(User != null) {			
			model.addAttribute("Security", User.getSecurity());
		}else {
			return "redirect:/sign";
		}
		
		model.addAttribute("Items", CaseData);
		model.addAttribute("Images", Images);
		
		return "accept";
	}
	
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
	public String submit(@RequestParam()String CaseID,
			@RequestParam(defaultValue="99")int Status,
			@RequestParam(defaultValue="N/A")String RootCause,
			@RequestParam(defaultValue="N/A")String Solution,
			@RequestParam(defaultValue="N/A")String Taskclass,
			@RequestParam(defaultValue="0")int ContactType,
			HttpServletRequest req,Model model) throws Exception{
		HttpSession Session = req.getSession();
		WebAccount User = (WebAccount)Session.getAttribute("User");
		
		Status vo = new Status();
		vo.setCaseID(CaseID);
		
		if(Status == 5) {
			vo.setStatus(1);
		}else {
			vo.setStatus(Status);
		}
		
		vo.setRootCause(RootCause);
		vo.setSolution(Solution);
		vo.setEmployeeId(User.getEmployeeNumber());
		vo.setContactType(ContactType);
		vo.setTaskclass(Taskclass);
		
		
		if(FunctionService.SetChangeStatus(vo) != 0) {
			if(Status == 1) {
				CaseDetail r = FunctionService.GetDetailView(CaseID);
				
				FunctionService.SendToMail(r.getEmail(), "Dear Customer,"
						+ "<br>Issue Description: \""+r.getDescription()+"\""
						+ "<br>Support agent \"" + r.getEngineer() + "\" has been assign to your case \"" + r.getCaseID() +"\", agent will contact you for support session shortly."
						+ "<br><br><br><br>Thank you very much."
						+ "<br>Please do not reply to this email as it is auto-generated."
						+ "<br><br>Best Regards,"
						+ "<br>Bluzen CallCentre Support Team");
				return "redirect:/5fd9a718e5c073bb745cd970a6f1a5f3";
			}else if(Status == 2) {
				CaseDetail r = FunctionService.GetDetailView(CaseID);
				
				FunctionService.SendToMail(r.getEmail(), "Dear Customer,"
						+ "<br>We are pleased to inform you that your case \"" + r.getCaseID() + "\" is closed."
						+ "<br>Problem persists? Would like to provide feedback? We would like to hear about it."
						+ "<br><a href='https://scentre.bluzenbiz.com/feedback?CaseID=\""+r.getCaseID()+"\"'>Click here to feedback</a>"
						+ "<br><br><br><br>Thank you very much."
						+ "<br>Please do not reply to this email as it is auto-generated."
						+ "<br><br>Best Regards,"
						+ "<br>Bluzen CallCentre Support Team");
				return "redirect:/d9a22d7a8178d5b42a8750123cbfe5b1";
			}else if(Status == 3){
				return "redirect:/219d770572d00a227dc481a3bdb2c51e";
			}else if(Status == 5){
				return "redirect:/5fd9a718e5c073bb745cd970a6f1a5f3";
			}else {
				return "redirect:/99991d972ad820b1d2f398e7a160eb03";
			}
			
		}else {
			return "redirect:/bad097494597a4e092c1524102eeaea7";
		}
		
	}
	
	@RequestMapping(value = "/readonly", method = RequestMethod.GET)
	public String readonly(@RequestParam("CaseID")String CaseId, Model model) throws Exception{
		CaseDetail CaseData = FunctionService.GetDetailView(CaseId);
		List<FileInfo> Images = FunctionService.GetImageList(CaseId);
		
		model.addAttribute("Items", CaseData);
		model.addAttribute("Images", Images);
		
		return "detailonly";
	}
	
	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public String manage(@RequestParam(defaultValue="1993-08-08 00:00:00")String Start,
			@RequestParam(defaultValue="2999-08-08 00:00:00")String End,
			@RequestParam(defaultValue="")String Country,
			HttpServletRequest req,
			Model model) throws Exception{
		
		History Component = new History();
		Component.setEnd(End);
		Component.setStart(Start);
		Component.setKeyword(Country);
		
		List<ManageCase> CaseData = FunctionService.GetManageView(Component);
		
		model.addAttribute("display", CaseData);
		
		
		HttpSession Session = req.getSession();
		WebAccount User = (WebAccount)Session.getAttribute("User");
		
		if(User != null) {			
			if(User.getSecurity() > 5) {
				return "redirect:/bad097494597a4e092c1524102eeaea7";
			}
			
			model.addAttribute("Security", User.getSecurity());
		}else {
			return "redirect:/sign";
		}
		
		return "manager";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("CaseID")String CaseId, HttpServletRequest req, Model model) throws Exception{
		FunctionService.DisabledCase(CaseId);
		
		
		HttpSession Session = req.getSession();
		WebAccount User = (WebAccount)Session.getAttribute("User");
		
		if(User != null) {
			model.addAttribute("Security", User.getSecurity());
		}else {
			return "redirect:/sign";
		}
		
		return "redirect:/manage";
	}
	
	@RequestMapping(value = "/bad097494597a4e092c1524102eeaea7", method = RequestMethod.GET)
	public String unassign(HttpServletRequest req, Model model) throws Exception{
		HttpSession Session = req.getSession();
		WebAccount User = (WebAccount)Session.getAttribute("User");
		
		if(User != null) {
			model.addAttribute("Security", User.getSecurity());
		}else {
			return "redirect:/sign";
		}
		
		return "unassigned";
	}
	
	@RequestMapping(value = "/5fd9a718e5c073bb745cd970a6f1a5f3", method = RequestMethod.GET)
	public String ongoing(HttpServletRequest req, Model model) throws Exception{
		HttpSession Session = req.getSession();
		WebAccount User = (WebAccount)Session.getAttribute("User");
		
		if(User != null) {
			model.addAttribute("Security", User.getSecurity());
			model.addAttribute("display",FunctionService.GetOnGoing(User));
		}else {
			return "redirect:/sign";
		}
		
		return "ongoing";
	}
	
	
	@RequestMapping(value = "/d9a22d7a8178d5b42a8750123cbfe5b1", method = RequestMethod.GET)
	public String complete(HttpServletRequest req, Model model) throws Exception{
		HttpSession Session = req.getSession();
		WebAccount User = (WebAccount)Session.getAttribute("User");
		
		if(User != null) {
			model.addAttribute("Security", User.getSecurity());
			model.addAttribute("display",FunctionService.GetComplete(User));
		}else {
			return "redirect:/sign";
		}
			
		return "complete";
	}
	
	@RequestMapping(value = "/99991d972ad820b1d2f398e7a160eb03", method = RequestMethod.GET)
	public String outofscope(HttpServletRequest req, Model model) throws Exception{
		HttpSession Session = req.getSession();
		WebAccount User = (WebAccount)Session.getAttribute("User");
		
		if(User != null) {
			model.addAttribute("Security", User.getSecurity());
			model.addAttribute("display",FunctionService.GetOutOfScope(User));
		}else {
			return "redirect:/sign";
		}
		
		return "outofscope";
	}
	
	@RequestMapping(value = "/219d770572d00a227dc481a3bdb2c51e", method = RequestMethod.GET)
	public String escalated(HttpServletRequest req, Model model) throws Exception{
		HttpSession Session = req.getSession();
		WebAccount User = (WebAccount)Session.getAttribute("User");
		
		if(User != null) {
			model.addAttribute("Security", User.getSecurity());
			model.addAttribute("display",FunctionService.GetEscalated(User));
		}else {
			return "redirect:/sign";
		}
		
		return "escalated";
	}
	
	@RequestMapping(value = "/enter", method = RequestMethod.GET)
	public String Enter(HttpServletRequest req, Model model) throws Exception{
		
		HttpSession Session = req.getSession();
		WebAccount User = (WebAccount)Session.getAttribute("User");
		
		if(User != null) {			
			
			model.addAttribute("Security", User.getSecurity());
		}else {
			return "redirect:/sign";
		}
		
		model.addAttribute("Locations", FunctionService.GetLocation());
		
		return "commute";
	}
	
	@RequestMapping(value = "/exit", method = RequestMethod.GET)
	public String Exit(HttpServletRequest req, Model model) throws Exception{
		
		HttpSession Session = req.getSession();
		WebAccount User = (WebAccount)Session.getAttribute("User");
		
		if(User != null) {			
			
			model.addAttribute("Security", User.getSecurity());
		}else {
			return "redirect:/sign";
		}
		
		model.addAttribute("Locations", FunctionService.GetLocation());
		
		return "commuteEx";
	}
}
