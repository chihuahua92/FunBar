package tw.FunBar.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="ROOMORDERINDAYS")
public class RoomOrderInDays {
			
		
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Integer id;
	
		private Integer room_id;
		
		private String check_in_time;
		
		private Integer rooms;
		
		@Transient
		private Integer order_id;
		
		
		@JsonIgnoreProperties("roomOrderInDays")
		@ManyToOne
		@JoinColumn(name="order_id")
		private RoomOrder roomOrder;
		

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}
		
		
		
		

		public RoomOrder getRoomOrder() {
			return roomOrder;
		}

		public void setRoomOrder(RoomOrder roomOrder) {
			this.roomOrder = roomOrder;
		}

		public Integer getOrder_id() {
			return order_id;
		}

		public void setOrder_id(Integer order_id) {
			this.order_id = order_id;
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

		public Integer getRooms() {
			return rooms;
		}

		public void setRooms(Integer rooms) {
			this.rooms = rooms;
		}
		
		
		
}
