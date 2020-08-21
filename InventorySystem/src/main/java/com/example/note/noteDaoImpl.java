package com.example.note;

import java.util.List;
import com.example.domain.NoteDomain;


public class noteDaoImpl implements noteDao{
	
	private noteDao noteDao;

	public void setnoteDao(noteDao noteDao) {
		
		this.noteDao=noteDao;
	}
	
	@Override //게시물 목록
	public List<NoteDomain> list(){
		
		return noteDao.list();
	}

	
	@Override // 게시물 조회
	public String view(int num){
		
		return noteDao.view(num);
		
	}
	
	
	@Override // 게시물 쓰기
	public void write(NoteDomain domain){
		
		noteDao.write(domain);
		
	}
	
	
	@Override //게시물 수정
	public void modify(NoteDomain domain) {
		
		noteDao.modify(domain);
		
	}

	
	@Override //  게시물 삭제
	public void delete(int num) {
		
		noteDao.delete(num);
		
	}
	
}
