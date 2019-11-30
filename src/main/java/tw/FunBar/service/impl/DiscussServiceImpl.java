package tw.FunBar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.FunBar.dao.DiscussDAO;
import tw.FunBar.model.Friendship;
import tw.FunBar.model.LikePost;
import tw.FunBar.model.Member;
import tw.FunBar.model.Post;
import tw.FunBar.service.DiscussService;

@Transactional
@Service
public class DiscussServiceImpl implements DiscussService {

	@Autowired
	DiscussDAO dao;

	@Override
	public List<Post> getAllPostDetail() {
		return dao.getAllPostDetail();
	}

	@Override
	public Post findByIdPost(int postId) {
		return dao.findByIdPost(postId);

	}

	@Override
	public void createPost(Post post) {
		dao.createPost(post);

	}

	@Override
	public void updatePostContent(Post post) {
		dao.updatePostContent(post);

	}

	@Override
	public void deletePostContent(Post post) {
		dao.deletePostContent(post);

	}

	@Override
	public Post getPostById(Integer postId) {
		return dao.getPostById(postId);
	}

	@Override
	public long getLikeByPostId(Integer postId) {
		return dao.getLikeByPostId(postId);
	}

	@Override
	public void addLike(LikePost like) {
		dao.addLike(like);
	}

	@Override
	public void unLike(LikePost like) {
		dao.unLike(like);

	}

	@Override
	public void sendFriendRequest(Friendship friendship) {
		dao.sendFriendRequest(friendship);
	}

	@Override
	public List<Member> searchMember(String memberName) {
		return dao.searchMember(memberName);
	}

	@Override
	public List<LikePost> getLikesById(Integer memberId) {
		return dao.getLikesById(memberId);
	}

	@Override
	public List<Friendship> getAllFriendRequest() {
		return dao.getAllFriendRequest();
	}

	@Override
	public void confirmFriendRequest(Friendship friendship) {
		dao.confirmFriendRequest(friendship);

	}

	@Override
	public void cancelFriendRequest(Friendship friendship) {
		dao.cancelFriendRequest(friendship);
	}

	@Override
	public Friendship getFriendRequest(Integer sender_memberId, Integer receiver_memberId) {
		return dao.getFriendRequest(sender_memberId, receiver_memberId);
	}

	@Override
	public void reportPostContent(Post post) {
		dao.reportPostContent(post);
	}

	@Override
	public List<Post> getReportSort(Integer sort) {
		return dao.getReportSort(sort);
	}

}
