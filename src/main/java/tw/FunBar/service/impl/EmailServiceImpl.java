package tw.FunBar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.FunBar.dao.EmailDAO;
import tw.FunBar.model.Activity;
import tw.FunBar.model.Applicant;
import tw.FunBar.model.BookingData;
import tw.FunBar.model.Member;
import tw.FunBar.model.Room;
import tw.FunBar.model.RoomOrder;
import tw.FunBar.service.EmailService;

@Service
@Transactional
public class EmailServiceImpl implements EmailService {

 @Autowired
 EmailDAO emailDAO;

 @Override
 public void sendEmail(RoomOrder room_order, Room room) {

  emailDAO.sendEmail(room_order, room);

 }

 @Override
 public void sendBookingEmail(BookingData data) {

  emailDAO.sendBookingEmail(data);

 }

 @Override



 public void sendmembercheck(Member mail) {
  emailDAO.sendmembercheck(mail);

	}
	@Override
	public void sendActivityEmail(List<Applicant> email,Activity activity) {
		emailDAO.sendActivityEmail(email,activity);

  

 }
 @Override
	public void sendpassword(Member pass) {
		emailDAO.sendpassword(pass);
		
	}
}