package tw.FunBar.controller;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.FunBar.model.Activity;
import tw.FunBar.model.Applicant;
import tw.FunBar.model.Suggestion;
import tw.FunBar.service.ActivityService;
import tw.FunBar.service.ApplicantService;

@Controller
public class ApplicantController {
	
	ApplicantService service;
	
	ActivityService activityservice;

	@Autowired
	public void setActivityservice(ActivityService activityservice) {
		this.activityservice = activityservice;
	}

	@Autowired
	public void setService(ApplicantService service) {
		this.service = service;
	}
	
	//使用者報名活動
	@RequestMapping("/applicantSignup")
	public String addApplicant(
			@RequestParam(name="applicantName") String applicantName,
			@RequestParam(name="gender") String gender,
			@RequestParam(name="applicantPhone") String applicantPhone,
			@RequestParam(name="applicantEmail") String applicantEmail,
			@RequestParam(name="activityId") Integer activityId,
			@RequestParam(name="memberId") String memberId,
			Model model) {
		
		service.addApplicant(applicantName, gender, applicantPhone, applicantEmail, activityId,memberId);
		model.addAttribute(activityId);
	
			return "signupSuccess";
	}

	//查詢活動報名者
	@RequestMapping(value="/getActivities" ,method=RequestMethod.GET)
	public String getActivities(
			@RequestParam(name="activityId") Integer activityId,
			Model model) {
		Activity ac = activityservice.getActivity(activityId);
		model.addAttribute("ac", ac);
		Set<Applicant> al = service.QuerySignupApplicant(activityId);
		model.addAttribute("al",al);
		
		return "allApplicants";
	}
	
	//查詢已報名活動
	@RequestMapping(value="/getsiqnupActivity/{memberId}" ,method=RequestMethod.GET)
	public String getsiqnupActivity(@PathVariable String memberId,Model model) {
		List<Activity> activity = service.QuerySignActivity(memberId);
		model.addAttribute("activity", activity);
		
		return "applicantSignup";
	}

	//取消報名
	@RequestMapping("/cancelSignup")
	public String cancelSignup(@RequestParam(value = "activityId") Integer activityId,
							   @RequestParam(value = "memberId") String memberId) {
		service.deleteMap(memberId, activityId);
		return "cancelSignupSuccess";
	}
	
	//----------------------------------------------------------------
	
	@RequestMapping(value = "/addSuggestion", method = RequestMethod.GET)
	public String input(Model model
			,@RequestParam(value = "activityId") Integer activityId) {
		model.addAttribute("activity", activityservice.getActivity(activityId));
		model.addAttribute("suggestion", new Suggestion());
		return "addSuggestion";
	}

	@RequestMapping(value = "/addSuggestion", method = RequestMethod.POST)
	public String addSuggestion(Suggestion suggestion) {
		service.addSuggestion(suggestion);
		return "SuggestionOk";
	}
		
	@RequestMapping(value="/allSuggestion",method = RequestMethod.GET)
	public String showAllSuggestion(Model model) {
		List<Suggestion> sus = service.getSuggestionEventName();
		model.addAttribute("sus", sus);
		
		return "allSuggestion";
	}
	
	@RequestMapping("/Suggestions/{eventName}")
	public String getActivityByCategory(@PathVariable("eventName") String eventName, Model model) {
		List<Suggestion> su = service.getSuggestionByEventName(eventName);
		model.addAttribute("su", su);
		return "Suggestions";
	}
	
	
}
