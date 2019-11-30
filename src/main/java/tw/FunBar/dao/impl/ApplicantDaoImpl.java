package tw.FunBar.dao.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.ApplicantDao;
import tw.FunBar.model.Activity;
import tw.FunBar.model.ActivityMap;
import tw.FunBar.model.Applicant;
import tw.FunBar.model.Suggestion;

@Repository
@SuppressWarnings("unchecked")
public class ApplicantDaoImpl implements ApplicantDao {

	SessionFactory factory;

	@Autowired
	public void factory(SessionFactory sessionFactory) {
		this.factory = sessionFactory;
	}

	// 使用者報名活動
	@Override
	public void addApplicant(String applicantName, String gender, String applicantPhone, String applicantEmail,
			int activityId, String memberId) {

		Applicant al = new Applicant();
		al.setApplicantName(applicantName);
		al.setGender(gender);
		al.setApplicantPhone(applicantPhone);
		al.setApplicantEmail(applicantEmail);
		al.setMemberId(memberId);

		Session session = factory.getCurrentSession();
		Activity ac = session.get(Activity.class, activityId);

		al.getActivities().add(ac);

		session.save(al);

	}

	// 查詢此活動報名者
	@Override
	public Set<Applicant> QuerySignupApplicant(int activityId) {

		Session session = factory.getCurrentSession();
		Activity at = session.get(Activity.class, activityId);
		Set<Applicant> list = at.getApplicants();
		
		return list;
	}

	// 查詢已報名活動
	@Override
	public List<Activity> QuerySignActivity(String memberId) {
		String hql = "From Applicant where memberId = :memberId";
		Session session = factory.getCurrentSession();
		List<Applicant> al = (List<Applicant>) session.createQuery(hql).setParameter("memberId", memberId)
				.getResultList();

		ArrayList<ActivityMap> ams = new ArrayList<>();
		for (Applicant a : al) {
			String hql2 = "From ActivityMap where applicantId=:applicantId";

			ActivityMap am = new ActivityMap();

			am = (ActivityMap) session.createQuery(hql2).setParameter("applicantId", a.getApplicantId())
					.getSingleResult();
			ams.add(am);
		}

		List<Activity> acs = new ArrayList<>();
		for (ActivityMap ap : ams) {
			String hql3 = "From Activity where activityId=:activityId order by eventDate desc";

			Activity ac = (Activity) session.createQuery(hql3).setParameter("activityId", ap.getActivityId())
					.getSingleResult();
			acs.add(ac);
		}

		return acs;
	}

	// 查詢所有報名者
	@Override
	public List<Applicant> getApplicants() {
		String hql = "FROM Applicant";
		List<Applicant> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public Applicant deleteApplicantById(int applicantId) {
		Session session = factory.getCurrentSession();
		Applicant al = session.get(Applicant.class, applicantId);

		Set<Activity> ac = new HashSet<>();
		ac = null;
		al.setActivities(ac);

		session.delete(al);
		return al;
	}

	// 取消報名 刪除中介資料表
	@Override
	public void deleteMap(String memberId, int activityId) {

		String hql = "From Applicant where memberId = :memberId";
		Session session = factory.getCurrentSession();
		List<Applicant> al = (List<Applicant>) session.createQuery(hql).setParameter("memberId", memberId)
				.getResultList();

		for (Applicant a : al) {
			System.out.println("applicantId= " + a.getApplicantId());
			String hql2 = "delete from ActivityMap where " + "applicantId = :applicantId and activityId = :activityId";
			int asas = session.createQuery(hql2).setParameter("applicantId", a.getApplicantId())
					.setParameter("activityId", activityId).executeUpdate();

			int t;

			if (asas == 1) {
				t = a.getApplicantId();
				String hql3 = "delete from Applicant where applicantId=:applicantId";
				session.createQuery(hql3).setParameter("applicantId", t).executeUpdate();
			}

		}

	}

//--------------------------------------------------------------------------	

	@Override
	public void addSuggestion(Suggestion suggestion) {
		Session session = factory.getCurrentSession();
		session.save(suggestion);
	}

	@Override
	public List<Suggestion> getAllSuggestion() {
		String hql = "From Suggestion";
		List<Suggestion> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();

		return list;

	}
	
	@Override
	public List<Suggestion> getSuggestionEventName(){
		String hql = "SELECT DISTINCT eventName FROM Suggestion";
		List<Suggestion> su = new ArrayList<>();
		Session session = factory.getCurrentSession();
		su = session.createQuery(hql).getResultList();
		return su;
	}
	
	@Override
	public List<Suggestion> getSuggestionByEventName(String eventName){
		String hql = "FROM Suggestion WHERE eventName = :eventName order by suggestionCreateTime desc";
		List<Suggestion> su = new ArrayList<>();
		Session session = factory.getCurrentSession();
		su = session.createQuery(hql).setParameter("eventName", eventName).getResultList();
		return su;
	}

}
