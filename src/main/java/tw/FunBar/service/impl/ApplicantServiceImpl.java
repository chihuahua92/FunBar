package tw.FunBar.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.FunBar.dao.ApplicantDao;
import tw.FunBar.model.Activity;
import tw.FunBar.model.Applicant;
import tw.FunBar.model.Suggestion;
import tw.FunBar.service.ApplicantService;

@Service
public class ApplicantServiceImpl implements ApplicantService {

	ApplicantDao dao;
	
	@Autowired
	public void setDao(ApplicantDao dao) {
		this.dao = dao;
	}

	@Transactional
	@Override
	public void addApplicant(String applicantName,String gender, String applicantPhone,
			String applicantEmail, int activityId,String memberId) {
		dao.addApplicant(applicantName, gender, applicantPhone, applicantEmail, activityId,memberId);
	}

	@Transactional
	@Override
	public Set<Applicant> QuerySignupApplicant(int activityId) {
		return dao.QuerySignupApplicant(activityId);
	}

	@Transactional
	@Override
	public List<Activity> QuerySignActivity(String memberId) {
		return dao.QuerySignActivity(memberId);
	}
	
	@Transactional
	@Override
	public Applicant deleteApplicantById(int applicantId) {
		return dao.deleteApplicantById(applicantId);
	}
	
	@Transactional
	@Override
	public void deleteMap(String memberId,int activityId){
		dao.deleteMap(memberId, activityId);
	}
	
	@Transactional
	@Override
	public List<Applicant> getApplicants(){
		return dao.getApplicants();
	}

	//-----------------------------------------------------------
	
	@Transactional
	@Override
	public void addSuggestion(Suggestion suggestion) {
		dao.addSuggestion(suggestion);
	}

	@Transactional
	@Override
	public List<Suggestion> getAllSuggestion() {
		return dao.getAllSuggestion();
	}

	@Transactional
	@Override
	public List<Suggestion> getSuggestionEventName() {
		return dao.getSuggestionEventName();
	}

	@Override
	public List<Suggestion> getSuggestionByEventName(String eventName) {
		return dao.getSuggestionByEventName(eventName);
	}
	

	
}
