package tw.FunBar.service;

import java.util.ArrayList;



import tw.FunBar.model.Alltime;
import tw.FunBar.model.BookingData;

public interface BookingService {
	
	ArrayList<Alltime> pullTime();
	
	ArrayList<Alltime> okTime(String date,Integer people);

	void addReservations(String date, Integer people, String time,String name, String phone, String email,String remark);
	
	ArrayList<BookingData> queryAllBooking();
	
	ArrayList<Alltime> pullTodayStatus(String date);

	void resetTimePeople(String time0, String time1, String time2, String time3, String time4, String time5,
			String time6, String time7, String time8, Integer people0, Integer people1, Integer people2,
			Integer people3, Integer people4, Integer people5, Integer people6, Integer people7, Integer people8);

	void cancelBooking(Integer id);
	
	BookingData pullSingle(Integer id);

	void modifyBooking(Integer id, String name, String phone, String date, String time, Integer people, String remark);

	ArrayList<Alltime> dateQuery(String date);

	ArrayList<Alltime> phoneQuery(String phone);

	BookingData getBookingByphone(String phone);

	BookingData bookingNumQuery(Integer number);

	void arrival(Integer booking_id);

	ArrayList<BookingData> todayBooking();

	int todayArrival();
}
