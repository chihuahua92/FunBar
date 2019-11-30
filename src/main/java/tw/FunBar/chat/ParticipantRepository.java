package tw.FunBar.chat;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import tw.FunBar.model.Member;


@Service("participantRepository")
public class ParticipantRepository {

	private Map<Integer, Member> activeMember = new ConcurrentHashMap<>();

	public void add(Integer memberId, Member member) {
		activeMember.put(memberId, member);
	}

	public Member getParticipant(Integer memberId) {
		return activeMember.get(memberId);
	}

	public void removeParticipant(Integer memberId) {
		activeMember.remove(memberId);
	}

	public Map<Integer, Member> getActiveMember() {
		return activeMember;
	}

	public void setActiveMember(Map<Integer, Member> activeMember) {
		this.activeMember = activeMember;
	}
}
