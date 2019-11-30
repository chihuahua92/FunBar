package tw.FunBar.dao;

import java.sql.Blob;
import java.util.List;

import tw.FunBar.model.Activity;
import tw.FunBar.model.ActivityMap;
import tw.FunBar.model.Applicant;

public interface ActivityDao {
	
	List<Activity> getPageActivities(int index);
	
	public int getIndex();
	
	public List<Activity> getAllActivities();
	
	public Activity getActivity(int activityId);

	public void addActivity(Activity activity);
	
	List<String> getAllActivityCategories();
	
	List<Activity> getActivityByCategory(String category);
	
	public void updateActivity(int activityId, String eventName, String eventDate, String address, String introduction,
			String activities, String information, String category, Blob blob);
	
	public Activity deleteActivityById(int activityId);
	
	public List<Applicant> getTime();
	
	public Activity getTimeActivity();
	
	public List<ActivityMap> repeatActivityId(String memberId);
	

	
}
