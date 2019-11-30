package tw.FunBar.dao.impl;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.ActivityDao;
import tw.FunBar.model.Activity;
import tw.FunBar.model.ActivityMap;
import tw.FunBar.model.Applicant;


@Repository
@SuppressWarnings("unchecked")
public class ActivityDaoImpl implements ActivityDao {
	
	SessionFactory factory;
	
	@Autowired
	public void factory(SessionFactory sessionFactory) {
		this.factory = sessionFactory;
	}
	
	//分頁
	@Override
	public List<Activity> getPageActivities(int index) {
		String hql = "FROM Activity order by eventCreateTime desc";
		Session session = factory.getCurrentSession();
		List<Activity> list = (List<Activity>) session.createQuery(hql)
				.setFirstResult((index-1)*6).setMaxResults(6).getResultList();
		return list;
	}
	
	
	public int getIndex() {
		String hql = "FROM Activity";
		Session session = factory.getCurrentSession();
		List<Activity> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		
		int listCount = list.size()/6;
		if(list.size()%6==0) {
			return listCount;
		}else {
			return listCount+1;
		}
	}
	
	
	//取得全部活動
	@Override
	public List<Activity> getAllActivities() {
		String hql = "FROM Activity";
		List<Activity> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	//取單筆活動
	@Override
	public Activity getActivity(int activityId) {
		Session session = factory.getCurrentSession();
		Activity ac = session.get(Activity.class, activityId);
		
		return ac;
	}
	
	//新增活動
	@Override
	public void addActivity(Activity activity) {
		Session session = factory.getCurrentSession();
		session.save(activity);
	}
	
	//取得所有分類
	@Override
	public List<String> getAllActivityCategories() {
		String hql = "SELECT DISTINCT a.category FROM Activity a";
		List<String> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	
	//從分類中取得所有活動
	@Override
	public List<Activity> getActivityByCategory(String category) {
		String hql = "FROM Activity ac WHERE ac.category = :category";
		List<Activity> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("category", category).getResultList();
		return list;
	}

	//更新
	@Override
	public void updateActivity(int activityId, String eventName, String eventDate, String address, String introduction,
			String activities, String information, String category, Blob blob ) {
		String hql = "UPDATE Activity SET eventName =:eventName, eventDate =:eventDate, address =:address,"
				+ " introduction =:introduction, activities =:activities, information =:information,"
				+ " category=:category, picture=:activityImage WHERE activityId = :activityId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("activityId", activityId)
		.setParameter("eventName", eventName).setParameter("eventDate", eventDate)
		.setParameter("address", address).setParameter("introduction", introduction)
		.setParameter("activities", activities).setParameter("information", information)
		.setParameter("category", category).setParameter("activityImage", blob)
		.executeUpdate();
	}
	
	//刪除活動
	@Override
	public Activity deleteActivityById(int activityId) {
		Session session = factory.getCurrentSession();	
		Activity ac = session.get(Activity.class,activityId);
		Set<Applicant> al = new HashSet<>();
		al = null;
		ac.setApplicants(al);
		
		session.delete(ac);
		return ac;
		
	}

	//取得報名的使用者 (活動前一天)

	@Override
	public List<Applicant> getTime() {
		String hql = "From Activity where DATEDIFF(day,GETDATE(),eventDate) = 1";
		Session session = factory.getCurrentSession();
		List<Activity> acs = session.createQuery(hql).getResultList();
		
		ArrayList<ActivityMap> ams = new ArrayList<>();
		for (Activity a :acs ) {
			String hql2 = "From ActivityMap where activityId = :activityId";
			

			ams = (ArrayList<ActivityMap>) session.createQuery(hql2)
					.setParameter("activityId", a.getActivityId())
					.getResultList();
		}
		
		List<Applicant> als = new ArrayList<>();
		for(ActivityMap aa: ams) {
			String hql3 = "FROM Applicant where applicantId = :applicantId";
			Applicant al = (Applicant) session.createQuery(hql3)
					.setParameter("applicantId",aa.getApplicantId()).getSingleResult();
			als.add(al);
			
		}
		return als;
	}
	
	//取得一天後到期的活動
	@Override
	public Activity getTimeActivity(){
//		Activity ac = new Activity();
//		String hql = "From Activity where DATEDIFF(day,GETDATE(),eventDate) = 1";
//		Session session = factory.getCurrentSession();
//		ac = (Activity) session.createQuery(hql).uniqueResult();
//
//		return ac;
		
		List<Activity> ac = new ArrayList<>();
		String hql = "From Activity where DATEDIFF(day,GETDATE(),eventDate) = 1";
		Session session = factory.getCurrentSession();
		ac = (List<Activity>) session.createQuery(hql).getResultList();
		if(ac.size() > 0) {
			return ac.get(0);
		}else
			return null;
	}
	
	//取得活動ID和已報名的活動ID是否重複
	@Override
	public List<ActivityMap> repeatActivityId(String memberId) {
		String hql = "From Applicant where memberId = :memberId";
		Session session = factory.getCurrentSession();
		List<Applicant> al = (List<Applicant>) session.createQuery(hql).setParameter("memberId", memberId)
				.getResultList();
		
		List<ActivityMap> ams = new ArrayList<>();
		for (Applicant a : al) {
			String hql2 = "From ActivityMap where applicantId=:applicantId";

			ActivityMap am = new ActivityMap();

			am = (ActivityMap) session.createQuery(hql2).setParameter("applicantId", a.getApplicantId())
					.getSingleResult();
			ams.add(am);
			
			
		}
		return ams;
	}

}
