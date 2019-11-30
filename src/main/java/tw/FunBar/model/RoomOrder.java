package tw.FunBar.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.ColumnDefault;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="RoomOrder")
public class RoomOrder {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer order_id;
	
	//private Integer member_id;
	@Transient
	private Integer room_id;
	
	private String check_in_time;
	
	private String check_out_time;
	
	private Integer rooms;
	
	private String order_name;
	
	private String order_email;
	
	private String remark;
	
	private String order_phone;
	
	private Integer total;
	
	private String status;
	
	private Integer check_in;
	
	private Integer room_number;
	
	
	@JsonIgnoreProperties("roomOrder")
	@OneToMany(mappedBy = "roomOrder",cascade = CascadeType.ALL)
	private Set<RoomOrderInDays> roomOrderInDays = new LinkedHashSet<>();
	
	
	@JsonIgnoreProperties("roomOrder")
	@ManyToOne
	@JoinColumn(name="ROOM_ID")
	private Room room;
	
	

	public Set<RoomOrderInDays> getRoomOrderInDays() {
		return roomOrderInDays;
	}


	public void setRoomOrderInDays(Set<RoomOrderInDays> roomOrderInDays) {
		this.roomOrderInDays = roomOrderInDays;
	}


	public Integer getOrder_id() {
		return order_id;
	}


	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	

	public Integer getRoom_number() {
		return room_number;
	}


	public void setRoom_number(Integer room_number) {
		this.room_number = room_number;
	}


	public Integer getCheck_in() {
		return check_in;
	}


	public void setCheck_in(Integer check_in) {
		this.check_in = check_in;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public Integer getTotal() {
		return total;
	}


	public void setTotal(Integer total) {
		this.total = total;
	}


	public Integer getRoom_id() {
		return room_id;
	}


	public void setRoom_id(Integer room_id) {
		this.room_id = room_id;
	}


	public String getCheck_in_time() {
		return check_in_time;
	}


	public void setCheck_in_time(String check_in_time) {
		this.check_in_time = check_in_time;
	}


	public String getCheck_out_time() {
		return check_out_time;
	}


	public void setCheck_out_time(String check_out_time) {
		this.check_out_time = check_out_time;
	}
	
	
	public String getOrder_phone() {
		return order_phone;
	}


	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}


	public Integer getRooms() {
		return rooms;
	}


	public void setRooms(Integer rooms) {
		this.rooms = rooms;
	}


	public String getOrder_name() {
		return order_name;
	}


	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}


	public String getOrder_email() {
		return order_email;
	}


	public void setOrder_email(String order_email) {
		this.order_email = order_email;
	}


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}


	public Room getRoom() {
		return room;
	}


	public void setRoom(Room room) {
		this.room = room;
	}
	
	
	
	
}
