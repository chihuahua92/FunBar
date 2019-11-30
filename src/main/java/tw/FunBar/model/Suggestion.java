package tw.FunBar.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "Suggestion")
public class Suggestion {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int suggestionId;
	private String suggestion;
	private String memberId;
	private String memberName;
	private String memberEmail;
	private String eventName;
	@Transient
	private String suggestionCreateTime;
	

	public int getSuggestionId() {
		return suggestionId;
	}
	public void setSuggestionId(int suggestionId) {
		this.suggestionId = suggestionId;
	}
	public String getSuggestion() {
		return suggestion;
	}
	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getSuggestionCreateTime() {
		return suggestionCreateTime;
	}
	public void setSuggestionCreateTime(String suggestionCreateTime) {
		this.suggestionCreateTime = suggestionCreateTime;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	
	
}
