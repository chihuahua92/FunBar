package tw.FunBar.dao;

import java.util.List;

import tw.FunBar.model.Friendship;
import tw.FunBar.model.LikePost;
import tw.FunBar.model.Member;
import tw.FunBar.model.Post;

public interface DiscussDAO {

	List<Post> getAllPostDetail();

	void createPost(Post post);

	Post findByIdPost(int postId);

	void updatePostContent(Post post);

	void deletePostContent(Post post);

	Post getPostById(Integer postId);

	void reportPostContent(Post post);

	List<LikePost> getLikesById(Integer memberId);

	long getLikeByPostId(Integer postId);

	void addLike(LikePost like);

	void unLike(LikePost like);

	void sendFriendRequest(Friendship friendship);

	void cancelFriendRequest(Friendship friendship);

	Friendship getFriendRequest(Integer sender_memberId, Integer receiver_memberId);

	List<Member> searchMember(String memberName);

	List<Friendship> getAllFriendRequest();

	void confirmFriendRequest(Friendship friendship);

	List<Post> getReportSort(Integer sort);

}
