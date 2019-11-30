package tw.FunBar.model;

import java.sql.Blob;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="ROOM")
public class Room {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer room_id;
	
	private String room_image_filename;
	
	@JsonIgnore
	private Blob room_image;
	
	private String room_type;
	
	private Integer room_quantity;
	
	private Integer room_price;
	
	private String room_description;
	
	private Integer room_people;
	
	private Integer room_pings;
	
	private String room_bed;
	
	
	@Transient
	private MultipartFile imageCover;
	
	@JsonIgnoreProperties("room")
	@OneToMany(mappedBy = "room",cascade = CascadeType.ALL)
	private Set<RoomOrder> roomOrder = new LinkedHashSet<>();


	public Integer getRoom_id() {
		return room_id;
	}


	public void setRoom_id(Integer room_id) {
		this.room_id = room_id;
	}


	public String getRoom_image_filename() {
		return room_image_filename;
	}


	public void setRoom_image_filename(String room_image_filename) {
		this.room_image_filename = room_image_filename;
	}


	public Blob getRoom_image() {
		return room_image;
	}


	public void setRoom_image(Blob room_image) {
		this.room_image = room_image;
	}


	public String getRoom_type() {
		return room_type;
	}


	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}


	public Integer getRoom_quantity() {
		return room_quantity;
	}


	public void setRoom_quantity(Integer room_quantity) {
		this.room_quantity = room_quantity;
	}




	public Integer getRoom_price() {
		return room_price;
	}


	public void setRoom_price(Integer room_price) {
		this.room_price = room_price;
	}


	public String getRoom_description() {
		return room_description;
	}


	public void setRoom_description(String room_description) {
		this.room_description = room_description;
	}


	public MultipartFile getImageCover() {
		return imageCover;
	}


	public void setImageCover(MultipartFile imageCover) {
		this.imageCover = imageCover;
	}


	public Set<RoomOrder> getRoomOrder() {
		return roomOrder;
	}


	public void setRoomOrder(Set<RoomOrder> roomOrder) {
		this.roomOrder = roomOrder;
	}


	public Integer getRoom_people() {
		return room_people;
	}


	public void setRoom_people(Integer room_people) {
		this.room_people = room_people;
	}


	public Integer getRoom_pings() {
		return room_pings;
	}


	public void setRoom_pings(Integer room_pings) {
		this.room_pings = room_pings;
	}


	public String getRoom_bed() {
		return room_bed;
	}


	public void setRoom_bed(String room_bed) {
		this.room_bed = room_bed;
	}
	
	
	
	
	


	
	
	
	
	
}
