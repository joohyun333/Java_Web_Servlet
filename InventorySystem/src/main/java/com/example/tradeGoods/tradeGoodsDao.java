package com.example.tradeGoods;

import java.util.List;

import com.example.domain.tradeGoodsDomain;

public interface tradeGoodsDao {

//	public List<tradeGoodsDomain> tradelist();	// 물류 리스트

	public void input(tradeGoodsDomain domain);	// 입고 처리

	public void delete(int dealNumber);		// 내역 삭제

}