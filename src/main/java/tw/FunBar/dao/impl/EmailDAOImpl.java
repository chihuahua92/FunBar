package tw.FunBar.dao.impl;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.sound.sampled.AudioFormat.Encoding;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.EmailDAO;
import tw.FunBar.model.Activity;
import tw.FunBar.model.Applicant;
import tw.FunBar.model.BookingData;
import tw.FunBar.model.Member;
import tw.FunBar.model.Room;
import tw.FunBar.model.RoomOrder;

@Repository
public class EmailDAOImpl implements EmailDAO {

	@Override
	public void sendEmail(RoomOrder room_order, Room room) {
		String host = "smtp.gmail.com";
		int port = 587;
		final String username = "funbar109@gmail.com";
		final String password = "ftnnxuqoxaywfrtt";

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("funbar109@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(room_order.getOrder_email()));
			message.setSubject("FunBar. 訂房通知");

			String htmlCode = "";

			message.setContent(htmlCode, "text/html;charset=UTF-8");

			htmlCode += "<div style='height:100px;background-color:black'>";
			htmlCode += " <h2 style='margin-bottom:0px; font-size: 4em;color :white;font-family:Copperplate;"
					+ "font-weight:bold;font-style:italic;text-decoration:underline;text-align: center'>FunBar</h2>";

			htmlCode += "<h6 style='margin-top: 0px;text-align: center;color :white;font-family:Papyrus;font-size: 1em; '>CHILL&CHEER</h6></div>";
			htmlCode += "<div style='margin:20px auto;width:100px;height:35px ;border: 1px gray solid;border-radius:25px; '>";
			htmlCode += "<p style='color:gray ;margin-top: 6px ;font-family: 微軟正黑體;font-size:1em; text-align: center'>訂位通知</p></div>";
			htmlCode += "<div style='margin:0 auto;border:2px solid black;width:500px;text-align:center;font-size:20px;font-family:DFKai-sb;'>";
			htmlCode += "<table style='border:none;text-align:ceneter;margin:0 auto'>";
			htmlCode += "<tr><td>訂房編號:</td><td>" + room_order.getOrder_id() + "</td></tr>";
			htmlCode += "<tr><td>訂房人姓名:</td><td>" + room_order.getOrder_name() + "</td></tr>";
			htmlCode += "<tr><td>您的房型:</td><td>" + room.getRoom_type() + "</td></tr>";
			htmlCode += "<tr><td>入住日期:</td><td>" + room_order.getCheck_in_time() + "</td></tr>";
			htmlCode += "<tr><td>退房日期:</td><td>" + room_order.getCheck_out_time() + "</td></tr>";
			htmlCode += "</table><h2 style='color:blue'>FunBar 感謝您的預訂</h2></div>";

			message.setContent(htmlCode, "text/html;charset=UTF-8");
			
			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);

			Transport.send(message);

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}

	}

	@Override
	public void sendBookingEmail(BookingData data) {
		String host = "smtp.gmail.com";
		int port = 587;
		final String username = "funbar109@gmail.com";
		final String password = "ftnnxuqoxaywfrtt";

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("funbar109@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(data.getEmail()));
			message.setSubject("FunBar. 訂位通知");

			String htmlCode = "";

			htmlCode += "<div style='height:100px;background-color:black'>";
			htmlCode += " <h2 style='margin-bottom:0px; font-size: 4em;color :white;font-family:Copperplate;"
					+ "font-weight:bold;font-style:italic;text-decoration:underline;text-align: center'>FunBar</h2>";

			htmlCode += "<h6 style='margin-top: 0px;text-align: center;color :white;font-family:Papyrus;font-size: 1em; '>CHILL&CHEER</h6></div>";
			htmlCode += "<div style='margin:20px auto;width:100px;height:35px ;border: 1px gray solid;border-radius:25px; '>";
			htmlCode += "<p style='color:gray ;margin-top: 6px ;font-family: 微軟正黑體;font-size:1em; text-align: center'>訂位通知</p></div>";
			htmlCode += "<div style='margin:0 auto;border:2px solid black;width:400px;text-align:center;font-size:20px;font-family:DFKai-sb;'>";
			htmlCode += "<table style='border:none;text-align:ceneter;margin:0 auto'>";
			htmlCode += "<tr><td>訂位編號:</td><td>" + data.getBooking_id() + "</td></tr>";
			htmlCode += "<tr><td>訂位人姓名:</td><td>" + data.getName() + "</td></tr>";
			htmlCode += "<tr><td>訂位日期:</td><td>" + data.getDate() + "</td></tr>";
			htmlCode += "<tr><td>訂位時段:</td><td>" + data.getTime() + "</td></tr>";
			htmlCode += "<tr><td>訂位人數:</td><td>" + data.getPeople() + "人</td></tr>";
			htmlCode += "</table><h2 style='color:blue'>FunBar 感謝您的預訂</h2></div>";

			message.setContent(htmlCode, "text/html;charset=UTF-8");

			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);

			Transport.send(message);

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}

	}

	// 會員驗證
	@Override
	public void sendmembercheck(Member mail) {
		String host = "smtp.gmail.com";
		int port = 587;
		final String username = "funbar109@gmail.com";
		final String password = "ftnnxuqoxaywfrtt";

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("funbar109@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mail.getMemberEmail()));
			message.setSubject("FunBar.會員通知");

			String htmlCode = "";
			htmlCode += "<div style='margin:0 auto;border:2px solid #02DF82;width:500px;text-align:center;font-size:22px;border-radius:10px'>";
			htmlCode += "<h1>您的會員資料 :</h1>";
			htmlCode += "<table style='border:none;text-align:ceneter;margin:0 auto'>";
			htmlCode += "<tr><td>會員編號:</td><td>." + mail.getId() + "</td></tr>";
			htmlCode += "<tr><td>姓名:</td><td>" + mail.getMemberName() + "</td></tr>";
			htmlCode += "<tr><td>信箱:</td><td>" + mail.getMemberEmail() + "</td></tr>";
			htmlCode += "<tr><td>電話:</td><td>" + mail.getMemberPhone() + "</td></tr>";
			htmlCode += "<tr><td>日期:</td><td>" + mail.getMemberBirth() + "</td></tr>";
			htmlCode += "<tr><td>帳號:</td><td>" + mail.getMemberId() + "</td></tr>";
			htmlCode += "<tr><td>大頭貼:</td><td>" + mail.getMemberfileName() + "</td></tr>";
			htmlCode += "<tr><td>認證:</td><td>" + "<a href =http://localhost:8080/FunBar/check?id=" + mail.getId()
					+ ">點擊認證</a>" + "</td></tr>";

			message.setContent(htmlCode, "text/html;charset=UTF-8");

			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);

			Transport.send(message);

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}

	}

	@Override
	 public void sendActivityEmail(List<Applicant> email, Activity activity) {
		 String host = "smtp.gmail.com";
			int port = 587;
			final String username = "funbar109@gmail.com";
			final String password = "ftnnxuqoxaywfrtt";

			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.port", port);
			Session session = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});

			try {

				for (Applicant a : email) {
					System.out.println("email=>" + a.getApplicantEmail());
					
						Message message = new MimeMessage(session);
						message.setFrom(new InternetAddress("funbar109@gmail.com"));
						message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(a.getApplicantEmail()));
						message.setSubject("FunBar. 活動倒數通知");

						String htmlCode = "";
						
						htmlCode += "<div style='height:100px;background-color:black'>";
						htmlCode += " <h2 style='margin-bottom:0px; font-size: 4em;color :white;font-family:Copperplate;"
								+ "font-weight:bold;font-style:italic;text-decoration:underline;text-align: center'>FunBar</h2>";
								
						htmlCode += "<h6 style='margin-top: 0px;text-align: center;color :white;font-family:Papyrus;font-size: 1em; '>CHILL&CHEER</h6></div>";
						htmlCode += "<div style='margin:50px auto;width:100px;height:35px ;border: 1px gray solid;border-radius:25px; '>";
						htmlCode += "<p style='color:gray ;margin-top: 6px ;font-family: 微軟正黑體;font-size:1em; text-align: center'>活動通知</p></div>";
						htmlCode += "<div style='margin:auto ;width: 500px;height: 350px;border: 1px gray solid'>";
		
						htmlCode += "<p style='text-align: center;font-size: 1.8em;color: rgb(22, 15, 1)'>"+"親愛的 "+a.getApplicantName()+" 您好</p>";

						htmlCode += "<p style='text-align: center;font-size: 1.5em;color: gray'>您報名的活動：</p>";
						htmlCode += "<p style='text-align: center;'><a style='font-size: 2em;color:rgb(228, 121, 21);text-decoration:none;' href =http://localhost:8080/FunBar/activity?id="+activity.getActivityId()+">"+activity.getEventName()+"</a></p>";
						htmlCode += "<p style='text-align: center;font-size: 1.5em;color: gray'>將於明天舉行</p>";
						htmlCode += "<p style='text-align: center;font-size: 1.5em;color: gray'>期待您蒞臨參加。</div>";
						
						message.setContent(htmlCode, "text/html;charset=UTF-8");

						Transport transport = session.getTransport("smtp");
						transport.connect(host, port, username, password);

						Transport.send(message);

					}
				
			} catch (MessagingException e) {
				throw new RuntimeException(e);
			}
		}
	  


	//忘記密碼
	@Override
	public void sendpassword(Member pass) {
	 String host = "smtp.gmail.com";
	   int port = 587;
	   final String username = "funbar109@gmail.com";
	   final String password = "ftnnxuqoxaywfrtt";

	   Properties props = new Properties();
	   props.put("mail.smtp.host", host);
	   props.put("mail.smtp.auth", "true");
	   props.put("mail.smtp.starttls.enable", "true");
	   props.put("mail.smtp.port", port);
	   Session session = Session.getInstance(props, new javax.mail.Authenticator() {
	    protected PasswordAuthentication getPasswordAuthentication() {
	     return new PasswordAuthentication(username, password);
	    }
	   });

	   try {
	    Message message = new MimeMessage(session);
	    message.setFrom(new InternetAddress("funbar109@gmail.com"));
	    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(pass.getMemberEmail()));
	    message.setSubject("FunBar.忘記密碼");
	    
	    System.out.println("email:"+pass.getMemberEmail());
	    
	    String htmlCode = "";
	    htmlCode += "<div style='margin:0 auto;border:2px solid #02DF82;width:500px;text-align:center;font-size:22px;border-radius:10px'>";
	    htmlCode += "<h1>您的會員資料 :</h1>";
	    htmlCode += "<table style='border:none;text-align:ceneter;margin:0 auto'>";
	    htmlCode += "<tr><td>會員編號:</td><td>."+pass.getId()+"</td></tr>";
	    htmlCode += "<tr><td>姓名:</td><td>"+pass.getMemberName()+"</td></tr>";
	    htmlCode += "<tr><td>信箱:</td><td>"+pass.getMemberEmail()+"</td></tr>";
	    htmlCode += "<tr><td>電話:</td><td>"+pass.getMemberPhone()+"</td></tr>";
	    htmlCode += "<tr><td>生日</td><td>"+pass.getMemberBirth()+"</td></tr>";
	    htmlCode += "<tr><td>帳號:</td><td>"+pass.getMemberId()+"</td></tr>";
	    htmlCode += "<tr><td>認證:</td><td>"+ "<a href =http://localhost:8080/FunBar/find?memberId="+pass.getMemberId() +">更換新密碼</a>"+ "</td></tr>";
	    message.setContent(htmlCode,"text/html;charset=UTF-8");
	 
	    
	    


	    Transport transport = session.getTransport("smtp");
	    transport.connect(host, port, username, password);

	    Transport.send(message);

	    

	   } catch (MessagingException e) {
	    throw new RuntimeException(e);
	   }
	 
	}
}
