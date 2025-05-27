package day0512;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class MemberService {

	public List<Member> searchAllMember(){
		List<Member> list=new ArrayList<Member>();
		
		if(new Random().nextBoolean()) {
			list.add(new Member(1,"일장훈","lee@test.com","010-1111-1111"));
			list.add(new Member(2,"이장훈","lee@test.com","010-2222-2222"));
			list.add(new Member(3,"삼장훈","lee@test.com","010-3333-3333"));
			list.add(new Member(4,"사장훈","lee@test.com","010-4444-4444"));
			list.add(new Member(5,"오장훈","lee@test.com","010-5555-5555"));
			list.add(new Member(6,"육장훈","lee@test.com","010-6666-6666"));
		}//end if
		
		return list;
	}//searchAllMember
	
}//class
