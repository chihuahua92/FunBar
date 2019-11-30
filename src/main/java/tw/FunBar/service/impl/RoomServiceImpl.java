package tw.FunBar.service.impl;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import tw.FunBar.dao.RoomDAO;
import tw.FunBar.model.Room;
import tw.FunBar.model.RoomOrder;
import tw.FunBar.model.RoomStatus;
import tw.FunBar.service.RoomService;


@Service
@Transactional
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	RoomDAO roomDAO;
	
	
	@Override
	public Set<Room> pullRoom(String date, Integer stay,Integer rooms) throws ParseException {
		
		return roomDAO.pullRoom(date, stay,rooms);
	}


	@Override
	public void addRoom(Room room) {
		
		roomDAO.addRoom(room);
	}


	@Override
	public Room getImage(Integer room_id) {
		
		return roomDAO.getImage(room_id);
	}


	@Override
	public ArrayList<Room> allRoom() {
		
		return roomDAO.allRoom();
	}


	@Override
	public Room getRoomById(Integer room_id) {
		
		return roomDAO.getRoomById(room_id);
	}


	@Override
	public void addRoomOrder(RoomOrder room_order)throws ParseException {
			   roomDAO.addRoomOrder(room_order);
		
	}


	@Override
	public void addOrderInDays(RoomOrder room_order)throws ParseException {
			  roomDAO.addOrderInDays(room_order);
		
	}


	@Override
	public ArrayList<RoomOrder> allOrder() {
			return roomDAO.allOrder();
	}


	@Override
	public RoomOrder pullOrderSingle(Integer id) {
			return roomDAO.pullOrderSingle(id);
	}


	@Override
	public ArrayList<Room> pullTodayRoomStatus(String date)  throws ParseException {
		
			return roomDAO.pullTodayRoomStatus(date);
	}


	@Override
	public void cancelRoom(Integer id) {
			roomDAO.cancelRoom(id);
		
	}


	@Override
	public void updateRoom(Integer room_id, String room_type, Integer room_quantity, Integer room_price,
			Integer room_people, String room_bed, Integer room_pings, String room_description,
			MultipartFile imageCover) throws IOException {
		
		   roomDAO.updateRoom(room_id,room_type,room_quantity,room_price,room_people,room_bed,room_pings,room_description,imageCover);
		
	}


	@Override
	public ArrayList<RoomOrder> dateSearch(String date) throws ParseException{
		
		return roomDAO.dateSearch(date);
	}


	@Override
	public RoomOrder roomNumQuery(Integer number) {
		
		return roomDAO.roomNumQuery(number);
	}


	@Override
	public void cancelOrder(Integer id) {
		roomDAO.cancelOrder(id);
		
	}


	@Override
	public ArrayList<RoomOrder> phoneSearch(String phone) {
		
		return roomDAO.phoneSearch(phone);
	}


	@Override
	public ArrayList<RoomOrder> getTodayOrder(String date) {
		
		return roomDAO.getTodayOrder(date);
	}


	@Override
	public void createOrderList() {
		roomDAO.createOrderList();
		
	}


	@Override
	public ArrayList<RoomStatus> getAllRoomStatus() {
		
		return roomDAO.getAllRoomStatus();
	}


	@Override
	public void updateRoomStatus(Integer room_number, Integer order_id,String name) {
			   
		
		roomDAO.updateRoomStatus(room_number,order_id,name);
		
	}


	@Override
	public void checkOut(Integer order_id,Integer room_number) {
		roomDAO.checkOut(order_id,room_number);
		
	}


	@Override
	public void clearAllRoom() {
		roomDAO.clearAllRoom();
		
	}


	@Override
	public ArrayList<RoomOrder> personalOrder(String phone) {
		
		return roomDAO.personalOrder(phone);
	}


	@Override
	public ArrayList<RoomOrder> getLatestOrders() {
	
		return roomDAO.getLatestOrders();
	}


	@Override
	public int getRoomTotalIncome() {
		
		return roomDAO.getRoomTotalIncome();
	}





	
	

}
