package tw.FunBar.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.FunBar.dao.ChatDao;
import tw.FunBar.model.Message;
import tw.FunBar.service.ChatService;

@Transactional
@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	ChatDao dao;

	@Override
	public void saveMessage(Message message) {
		dao.saveMessage(message);
	}

	@Override
	public List<Message> getHistoryMessage(String subscribe) {
		return dao.getHistoryMessage(subscribe);
	}

}
