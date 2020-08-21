package com.example.note;

import java.util.List;
import com.example.domain.NoteDomain;


public interface noteDao {

	public List<NoteDomain>list();   // 게시물 list 	  
		  	
	public String view(int num);  // 게시물 조회
	   
	public void write(NoteDomain domain);  // 게시물쓰기
	
	public void modify(NoteDomain domain); // 게시물 수정

	public void delete(int num);   //  게시물 삭제
    
}
