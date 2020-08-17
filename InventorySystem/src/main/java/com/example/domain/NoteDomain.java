package com.example.domain;

import java.util.Date;

/*
 *  //공지사항게시판
create table note
(
 num int not null auto_increment,
 title varchar(30) not null,
 content text not null,
 time date not null default now(),
 primary key(num));
 */

public class NoteDomain {

	private int num; //번호
	private String title; //제목
	private String content; //내용
	private Date time; //작성날짜
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}

}
