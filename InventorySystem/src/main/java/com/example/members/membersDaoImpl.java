package com.example.members;

import com.example.domain.MembersDomain;

public class membersDaoImpl implements membersDao{
	
	private membersDao membersDao;
	
	public void setmembersDao(membersDao membersDao) {
		this.membersDao=membersDao;
	}
	
	@Override//회원가입
	public void SignUp(MembersDomain domain) {
		
		membersDao.SignUp(domain);
		
		
	}
	

}
