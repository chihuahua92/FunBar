package tw.FunBar.dao;

import java.util.List;

import tw.FunBar.model.Message;

public interface ChatDao {

	void saveMessage(Message message);
	
	List<Message> getHistoryMessage(String subscribe);
}
