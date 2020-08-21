package com.example.domain;


/*
	 *  create table members(
	     email varchar(30) not null primary key,
	     password varchar(20) not null
	     );
*/


public class MembersDomain {
  
	private String  email;
	private String password;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	

	
}
