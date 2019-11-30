package tw.FunBar.dao;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Set;

import org.springframework.web.multipart.MultipartFile;

import tw.FunBar.model.Room;
import tw.FunBar.model.RoomOrder;
import tw.FunBar.model.RoomStatus;

public interface RoomDAO {
	
	ArrayList<Room> allRoom();
	
	
	Set<Room> pullRoom(String date , Integer stay,Integer rooms) throws ParseException;


	void addRoom(Room room);
	
	Room getImage(Integer room_id);
	
	Room getRoomById(Integer room_id);


	void addRoomOrder(RoomOrder room_order)throws ParseException;


	void addOrderInDays(RoomOrder room_order)throws ParseException;


	ArrayList<RoomOrder> allOrder();


	RoomOrder pullOrderSingle(Integer id);


	ArrayList<Room> pullTodayRoomStatus(String date) throws ParseException;


	void cancelRoom(Integer id);


	void updateRoom(Integer room_id, String room_type, Integer room_quantity, Integer room_price, Integer room_people,
			String room_bed, Integer room_pings, String room_description,MultipartFile imageCover)throws IOException;


	ArrayList<RoomOrder> dateSearch(String date)throws ParseException;


	RoomOrder roomNumQuery(Integer number);


	void cancelOrder(Integer id);


	ArrayList<RoomOrder> phoneSearch(String phone);


	ArrayList<RoomOrder> getTodayOrder(String date);


	void createOrderList();


	ArrayList<RoomStatus> getAllRoomStatus();


	void updateRoomStatus(Integer room_number, Integer order_id,String name);


	void checkOut(Integer order_id,Integer room_number);


	void clearAllRoom();


	ArrayList<RoomOrder> personalOrder(String phone);


	ArrayList<RoomOrder> getLatestOrders();


	int getRoomTotalIncome();
}
