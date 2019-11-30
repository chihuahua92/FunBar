package tw.FunBar.dao.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.DiscussDAO;
import tw.FunBar.model.Activity;
import tw.FunBar.model.Applicant;
import tw.FunBar.model.Friendship;
import tw.FunBar.model.LikePost;
import tw.FunBar.model.Member;
import tw.FunBar.model.Post;

@Repository
public class DiscussDAOImpl implements DiscussDAO {

	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Post> getAllPostDetail() {
		String hql = "FROM Post ORDER BY postTime desc";
		List<Post> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public Post findByIdPost(int postId) {
		Session session = factory.getCurrentSession();
		Post post = session.get(Post.class, postId);
		return post;
	}

	@Override
	public void createPost(Post post) {
		Session session = factory.getCurrentSession();
		Date dateTime = new Date();
		SimpleDateFormat formDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = formDate.format(dateTime);
		post.setPostStatus(0);
		post.setPostTime(date);
		session.save(post);
	}

	@Override
	public void updatePostContent(Post post) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE Post post SET post.postContent = :postContent WHERE post.postId = :postId";
		session.createQuery(hql).setParameter("postContent", post.getPostContent())
				.setParameter("postId", post.getPostId()).executeUpdate();

	}

	@Override
	public void reportPostContent(Post post) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE Post post SET postStatus = :postStatus WHERE post.postId = :postId";
		session.createQuery(hql).setParameter("postStatus", 9).setParameter("postId", post.getPostId()).executeUpdate();
	}

	@Override
	public void deletePostContent(Post post) {
		Session session = factory.getCurrentSession();
		session.delete(post);
	}

	@Override
	public Post getPostById(Integer postId) {
		String hql = "FROM Post WHERE postId = :postId";
		Session session = factory.getCurrentSession();
		Post post = (Post) session.createQuery(hql).setParameter("postId", postId).getSingleResult();
		return post;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<LikePost> getLikesById(Integer memberId) {
		String hql = "FROM LikePost WHERE memberId = :memberId";
		List<LikePost> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("memberId", memberId).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public long getLikeByPostId(Integer postId) {
		long count = 0;
		String hql = "SELECT COUNT(DISTINCT memberId) FROM LikePost WHERE postId = :postId";
		Session session = factory.getCurrentSession();
		List<Long> list = session.createQuery(hql).setParameter("postId", postId).getResultList();
		count = list.get(0);
		return count;
	}

	@Override
	public void addLike(LikePost like) {
		Session session = factory.getCurrentSession();
		session.save(like);
	}

	@Override
	public void unLike(LikePost like) {
		String hql = "DELETE FROM LikePost WHERE postId = :postId AND memberId = :memberId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("postId", like.getLikePK().getPostId())
				.setParameter("memberId", like.getLikePK().getMemberId()).executeUpdate();

	}

	@Override
	public void sendFriendRequest(Friendship friendship) {
		Session session = factory.getCurrentSession();
		Date dateTime = new Date();
		SimpleDateFormat formDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = formDate.format(dateTime);
		friendship.setRequestTime(date);
		System.out.println(friendship.getFriendStatus());
		if (friendship.getFriendStatus() == null) {
			friendship.setFriendStatus(1);
		}
		session.save(friendship);
	}

	@Override
	public void confirmFriendRequest(Friendship friendship) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE Friendship friendship SET friendship.friendStatus = :friendStatus "
				+ "WHERE friendship.sender_memberId = :sender_memberId AND friendship.receiver_memberId = :receiver_memberId";
		session.createQuery(hql).setParameter("friendStatus", friendship.getFriendStatus())
				.setParameter("sender_memberId", friendship.getSender_memberId())
				.setParameter("receiver_memberId", friendship.getReceiver_memberId()).executeUpdate();
	}

	@Override
	public Friendship getFriendRequest(Integer sender_memberId, Integer receiver_memberId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Friendship WHERE sender_memberId = :sender_memberId AND "
				+ "receiver_memberId = :receiver_memberId";
		Friendship friendship = (Friendship) session.createQuery(hql).setParameter("sender_memberId", sender_memberId)
				.setParameter("receiver_memberId", receiver_memberId).getSingleResult();
		return friendship;
	}

	@Override
	public void cancelFriendRequest(Friendship friendship) {
		Session session = factory.getCurrentSession();
		session.delete(friendship);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Friendship> getAllFriendRequest() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Friendship";
		List<Friendship> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Member> searchMember(String memberName) {
		String hql = "FROM Member WHERE memberName Like :memberName";
		List<Member> list = new ArrayList<Member>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("memberName", "%" + memberName + "%").getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Post> getReportSort(Integer sort) {
		String hql = null;
		if (sort == 0) {
			hql = "FROM Post WHERE postStatus > 0 ORDER BY postStatus desc";
		} else if (sort == 1) {
			hql = "FROM Post WHERE postStatus > 0 ORDER BY postStatus asc";
		} else if (sort == 2) {
			hql = "FROM Post WHERE postStatus > 0 ORDER BY postTime desc";
		} else if (sort == 3) {
			hql = "FROM Post WHERE postStatus > 0 ORDER BY postTime asc";
		}
		List<Post> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

}
