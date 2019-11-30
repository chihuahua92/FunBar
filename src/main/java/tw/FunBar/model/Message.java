package tw.FunBar.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Message {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer message_id;
	private Integer senderMemberId;
	private Integer receiverMemberId;
	private String subscribe;
	private String userName;
	private Date sendDate;
	private String messageType;
	private String messageContent;

	public Integer getMessage_id() {
		return message_id;
	}

	public void setMessage_id(Integer message_id) {
		this.message_id = message_id;
	}

	public Integer getSenderMemberId() {
		return senderMemberId;
	}

	public void setSenderMemberId(Integer senderMemberId) {
		this.senderMemberId = senderMemberId;
	}

	public Integer getReceiverMemberId() {
		return receiverMemberId;
	}

	public void setReceiverMemberId(Integer receiverMemberId) {
		this.receiverMemberId = receiverMemberId;
	}

	public String getSubscribe() {
		return subscribe;
	}

	public void setSubscribe(String subscribe) {
		this.subscribe = subscribe;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	@Override
	public String toString() {
		return "Message [message_id=" + message_id + ", senderMemberId=" + senderMemberId + ", receiverMemberId="
				+ receiverMemberId + ", subscribe=" + subscribe + ", userName=" + userName + ", sendDate=" + sendDate
				+ ", messageType=" + messageType + ", messageContent=" + messageContent + "]";
	}

}
