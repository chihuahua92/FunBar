package tw.FunBar.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.ChatDao;
import tw.FunBar.model.Message;

@Repository
public class ChatDaoImpl implements ChatDao {

	@Autowired
	SessionFactory factory;

	@Override
	public void saveMessage(Message message) {
		Session session = factory.getCurrentSession();
		session.save(message);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getHistoryMessage(String subscribe) {
		String hql = "FROM Message WHERE subscribe = :subscribe ORDER BY sendDate asc";
		Session session = factory.getCurrentSession();
		List<Message> list = new ArrayList<>();
		list = session.createQuery(hql).setParameter("subscribe", subscribe).getResultList();
		return list;
	}

}
