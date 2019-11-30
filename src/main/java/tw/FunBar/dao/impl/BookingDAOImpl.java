package tw.FunBar.dao.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;



import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import tw.FunBar.dao.BookingDAO;
import tw.FunBar.model.Alltime;
import tw.FunBar.model.BookingData;


@Repository
public class BookingDAOImpl implements BookingDAO {

	@Autowired
	SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Alltime> pullTime() {

		ArrayList<Alltime> Alltime = new ArrayList<Alltime>();

		Session session = sessionFactory.getCurrentSession();
		String hql = "From Alltime order by time asc";
		List<Alltime> query =session.createQuery(hql).getResultList();

		for (Alltime time : query) {
			Alltime.add(time);
		}

		return Alltime;

	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Alltime> okTime(String date, Integer people) {
		ArrayList<Alltime> alltime = pullTime();

		ArrayList<Alltime> oktime = new ArrayList<>();
		Calendar now = Calendar.getInstance();
		now.setTime(new Date());
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		int day = now.get(Calendar.DAY_OF_MONTH);

		String today = year + "-" + month + "-" + day;

		int H = now.get(Calendar.HOUR_OF_DAY);

		for (Alltime all : alltime) {
			String BH = all.getTime().substring(0, 2);
			int bh = Integer.parseInt(BH);
			String hql = "from BookingData where date=:date and time=:time";
			Session session = sessionFactory.getCurrentSession();
			ArrayList<BookingData> query = (ArrayList<BookingData>) session.createQuery(hql).setParameter("date", date)
					.setParameter("time", all.getTime()).getResultList();
			int sum = 0;
			for (BookingData data : query) {
				sum += data.getPeople();
			}

			if (sum + people <= all.getPeople() && date.equals(today) && bh > H) {
				oktime.add(all);
			} else if (sum + people <= all.getPeople() && !date.equals(today)) {
				oktime.add(all);
			}
		}

		return oktime;
	}

	@Override
	public void addReservations(String date, Integer people, String time, String name, String phone,
			String email, String remark) {
		
		
		
		BookingData d = new BookingData();
		d.setDate(date);
		d.setTime(time);
		d.setPeople(people);
		d.setEmail(email);
		d.setName(name);
		d.setPhone(phone);
		d.setRemark(remark);
		
		

		Session session = sessionFactory.getCurrentSession();
		session.save(d);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BookingData> queryAllBooking() {

		String hql = "From BookingData where date>= :date order by Booking_id DESC";
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");



		String date = fm.format(new Date());
		ArrayList<BookingData> bookings = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		bookings = (ArrayList<BookingData>) session.createQuery(hql).setParameter("date",date).getResultList();
		return bookings;

	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Alltime> pullTodayStatus(String date) {
		Integer peo = 0;
		String hql = "From BookingData where date = :date and time = :time";
		Session session = sessionFactory.getCurrentSession();
		ArrayList<Alltime> alltime = pullTime();

		ArrayList<Alltime> todayStatus = new ArrayList<>();

		for (Alltime all : alltime) {
			ArrayList<BookingData> query = (ArrayList<BookingData>) session.createQuery(hql).setParameter("date", date)
					.setParameter("time", all.getTime()).getResultList();
			for (BookingData data : query) {
				peo += data.getPeople();
			}
			int lastPeo = all.getPeople() - peo;
			peo = 0;

			Alltime onetime = new Alltime();
			onetime.setTime(all.getTime());
			onetime.setPeople(lastPeo);
			todayStatus.add(onetime);
		}

		return todayStatus;
	}

	@Override
	public void resetTimePeople(String time0, String time1, String time2, String time3, String time4, String time5,
			String time6, String time7, String time8, Integer people0, Integer people1, Integer people2,
			Integer people3, Integer people4, Integer people5, Integer people6, Integer people7, Integer people8) {

		String sql = "truncate table AllTime";
		Session session1 = sessionFactory.getCurrentSession();
		session1.createSQLQuery(sql).executeUpdate();

		
		Session session = sessionFactory.getCurrentSession();
		
		Alltime newTp = new Alltime();
		newTp.setTime(time0);
		newTp.setPeople(people0);
		session.save(newTp);
		Alltime newTp1 = new Alltime();
		newTp1.setTime(time1);
		newTp1.setPeople(people1);
		session.save(newTp1);

		Alltime newTp2 = new Alltime();
		newTp2.setTime(time2);
		newTp2.setPeople(people2);
		session.save(newTp2);

		Alltime newTp3 = new Alltime();
		newTp3.setTime(time3);
		newTp3.setPeople(people3);
		session.save(newTp3);

		Alltime newTp4 = new Alltime();
		newTp4.setTime(time4);
		newTp4.setPeople(people4);
		session.save(newTp4);

		Alltime newTp5 = new Alltime();
		newTp5.setTime(time5);
		newTp5.setPeople(people5);
		session.save(newTp5);

		Alltime newTp6 = new Alltime();
		newTp6.setTime(time6);
		newTp6.setPeople(people6);
		session.save(newTp6);

		Alltime newTp7 = new Alltime();
		newTp7.setTime(time7);
		newTp7.setPeople(people7);
		session.save(newTp7);

		Alltime newTp8 = new Alltime();
		newTp8.setTime(time8);
		newTp8.setPeople(people8);
		session.save(newTp8);

	}

	@Override
	public void cancelBooking(Integer id) {
		String hql = "From BookingData where booking_id = :id";
		Session session = sessionFactory.getCurrentSession();
	 BookingData one = (BookingData) session.createQuery(hql).setParameter("id", id).getSingleResult();		
		session.delete(one);
	}

	@Override
	public BookingData pullSingle(Integer id) {
		String hql ="From BookingData where booking_id = :id";
		Session session = sessionFactory.getCurrentSession();
		BookingData one = (BookingData) session.createQuery(hql).setParameter("id", id).getSingleResult();
		return one ;
	}

	@Override
	public void modifyBooking(Integer id, String name, String phone, String date, String time, Integer people,
			String remark) {
		
		String hql = "Update BookingData set name = :name,phone = :phone,date = :date,time = :time,people = :people,remark = :remark where booking_id = :id";
		Session session = sessionFactory.getCurrentSession();
		session.createQuery(hql).setParameter("name",name).setParameter("phone",phone)
		.setParameter("date",date).setParameter("people",people).setParameter("time",time)
		.setParameter("remark",remark).setParameter("id",id).executeUpdate();
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Alltime> dateQuery(String date) {
		
		String hql = "From BookingData where date = :date";
		Session session = sessionFactory.getCurrentSession();
		ArrayList<Alltime> dq = (ArrayList<Alltime>)session.createQuery(hql).setParameter("date",date).getResultList();
		
		return dq;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Alltime> phoneQuery(String phone) {
		String hql = "From BookingData where phone = :phone";
		Session session = sessionFactory.getCurrentSession();
		ArrayList<Alltime> pq = (ArrayList<Alltime>)session.createQuery(hql).setParameter("phone",phone).getResultList();
		
		return pq;
	}

	@SuppressWarnings("unchecked")
	@Override
	public BookingData getBookingByphone(String phone) {
		
		String hql = "From BookingData where phone = :phone order by create_time DESC";
		
		Session session = sessionFactory.getCurrentSession();
		
		ArrayList<BookingData> data = (ArrayList<BookingData>)session.createQuery(hql).setParameter("phone",phone).getResultList();
		
		BookingData dataF = data.get(0);
		
		return dataF;
	}

	@Override
	public BookingData bookingNumQuery(Integer number) {
		
		String hql = "From BookingData where booking_id = :booking_id";
		
		Session session = sessionFactory.getCurrentSession();
		
		BookingData data = (BookingData) session.createQuery(hql).setParameter("booking_id",number).getSingleResult();
		return data;
	}

	@Override
	public void arrival(Integer booking_id) {
		
				Session session = sessionFactory.getCurrentSession();
				
				BookingData booking = session.get(BookingData.class,booking_id);
				
				booking.setStatus(1);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BookingData> todayBooking() {
		
		String hql = "From BookingData where date = :date order by booking_id DESC";
		
		Session session = sessionFactory.getCurrentSession();
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");

		String date = fm.format(new Date());
		
		ArrayList<BookingData> all = (ArrayList<BookingData>)session.createQuery(hql).setParameter("date",date).getResultList();
		
		
		
		return all;
	}

	@SuppressWarnings("unchecked")
	@Override
	public int todayArrival() {
		
		
		String hql = "From BookingData where date = :date and status = 1";
		
		Session session = sessionFactory.getCurrentSession();
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");

		String date = fm.format(new Date());
		
		ArrayList<BookingData> all = (ArrayList<BookingData>)session.createQuery(hql).setParameter("date",date).getResultList();
		
		
		
		int count = 0;
		
		for(BookingData b : all) {
			count += b.getPeople();
		}
		
		return count;
	}

}
