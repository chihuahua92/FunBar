package tw.FunBar.service;

import java.util.List;

import tw.FunBar.model.Message;

public interface ChatService {

	void saveMessage(Message message);

	List<Message> getHistoryMessage(String subscribe);

}
