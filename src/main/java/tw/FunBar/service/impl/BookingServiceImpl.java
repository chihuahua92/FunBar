package tw.FunBar.service.impl;

import java.util.ArrayList;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import tw.FunBar.dao.BookingDAO;
import tw.FunBar.model.Alltime;
import tw.FunBar.model.BookingData;
import tw.FunBar.service.BookingService;


@Service
@Transactional
public class BookingServiceImpl implements BookingService {
	
	@Autowired
	BookingDAO bookingDAO;
	
	
	@Override
	public ArrayList<Alltime> pullTime() {
		return bookingDAO.pullTime();
	}


	@Override
	public ArrayList<Alltime> okTime(String date, Integer people) {
		return bookingDAO.okTime(date, people);
	}


	@Override
	public void addReservations(String date, Integer people, String time, String name, String phone, String email,
			String remark) {
		bookingDAO.addReservations(date,people,time,name,phone,email,remark);
		
	}


	@Override
	public ArrayList<BookingData> queryAllBooking() {
		return bookingDAO.queryAllBooking();
	}


	@Override
	public ArrayList<Alltime> pullTodayStatus(String date) {
		return bookingDAO.pullTodayStatus(date);
	}


	@Override
	public void resetTimePeople(String time0, String time1, String time2, String time3, String time4, String time5,
			String time6, String time7, String time8, Integer people0, Integer people1, Integer people2,
			Integer people3, Integer people4, Integer people5, Integer people6, Integer people7, Integer people8) {
			
		bookingDAO.resetTimePeople(time0,time1,time2,time3,time4,time5,
			time6,time7,time8,people0,people1,people2,people3,people4,people5,people6,people7,people8);
	}


	@Override
	public void cancelBooking(Integer id) {
		bookingDAO.cancelBooking(id);
	}


	@Override
	public BookingData pullSingle(Integer id) {
		
		return bookingDAO.pullSingle(id);
	}


	@Override
	public void modifyBooking(Integer id, String name, String phone, String date, String time, Integer people,
			String remark) {
		bookingDAO.modifyBooking(id,name,phone,date,time,people,remark);
		
	}


	@Override
	public ArrayList<Alltime> dateQuery(String date) {
		return bookingDAO.dateQuery(date);
		
	}


	@Override
	public ArrayList<Alltime> phoneQuery(String phone) {
		return bookingDAO.phoneQuery(phone);
	}


	@Override
	public BookingData getBookingByphone(String phone) {
		
		return bookingDAO.getBookingByphone(phone);
	}


	@Override
	public BookingData bookingNumQuery(Integer number) {
		
		return bookingDAO.bookingNumQuery(number);
	}


	@Override
	public void arrival(Integer booking_id) {
		
		bookingDAO.arrival(booking_id);
	}


	@Override
	public ArrayList<BookingData> todayBooking() {
		
		return bookingDAO.todayBooking();
	}


	@Override
	public int todayArrival() {
		
		return bookingDAO.todayArrival();
	}






}
