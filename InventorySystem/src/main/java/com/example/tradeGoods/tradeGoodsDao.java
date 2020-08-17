package com.example.tradeGoods;

import java.util.List;
import com.example.domain.tradeGoodsDomain;

public interface tradeGoodsDao {
	
	public List<tradeGoodsDomain> tradelist();	// 물류 리스트

	public void input(tradeGoodsDomain domain);	// 입고 처리
	
	public void output(tradeGoodsDomain domain); // 출고 처리 
	
	public void backIn(tradeGoodsDomain domain); // 입고했던 물품 반품 처리
	
	public void backOut(tradeGoodsDomain domain); // 출고했던 물품 반품 처리

	public void delete(int dealNumber);		// 내역 삭제
	
	
}