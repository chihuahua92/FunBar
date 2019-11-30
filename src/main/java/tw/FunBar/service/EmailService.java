package tw.FunBar.service;

import java.util.List;

import tw.FunBar.model.Activity;
import tw.FunBar.model.Applicant;
import tw.FunBar.model.BookingData;
import tw.FunBar.model.Member;
import tw.FunBar.model.Room;
import tw.FunBar.model.RoomOrder;

public interface EmailService {
  
  public void sendEmail(RoomOrder room_order,Room room);

		public void sendBookingEmail(BookingData data);
		
		void sendActivityEmail(List<Applicant> email,Activity activity);

  void sendmembercheck(Member mail);
	
  void sendpassword(Member pass);
}