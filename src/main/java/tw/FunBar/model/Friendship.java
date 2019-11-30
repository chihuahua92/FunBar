package tw.FunBar.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Friendship implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer friendshipId;
	private Integer sender_memberId;
	private Integer receiver_memberId;
	private String requestTime;
	private Integer friendStatus;

	public Integer getFriendshipId() {
		return friendshipId;
	}

	public void setFriendshipId(Integer friendshipId) {
		this.friendshipId = friendshipId;
	}

	public Integer getSender_memberId() {
		return sender_memberId;
	}

	public void setSender_memberId(Integer sender_memberId) {
		this.sender_memberId = sender_memberId;
	}

	public Integer getReceiver_memberId() {
		return receiver_memberId;
	}

	public void setReceiver_memberId(Integer receiver_memberId) {
		this.receiver_memberId = receiver_memberId;
	}

	public String getRequestTime() {
		return requestTime;
	}

	public void setRequestTime(String requestTime) {
		this.requestTime = requestTime;
	}

	public Integer getFriendStatus() {
		return friendStatus;
	}

	public void setFriendStatus(Integer friendStatus) {
		this.friendStatus = friendStatus;
	}

}
