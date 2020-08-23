package com.example.tradeGoods;

import java.util.List;

import com.example.domain.tradeGoodsDomain;

public class tradeGoodsImpl implements tradeGoodsDao {

	private tradeGoodsDao tradeGoodsDao;

	public void setTradeGoodsDao(tradeGoodsDao tradeGoodsDao) {
		this.tradeGoodsDao = tradeGoodsDao;
	}

	
//	@Override // 물류 리스트
//	public List<tradeGoodsDomain> tradelist() {
//		return tradeGoodsDao.tradelist();
//	}

	
	@Override // 입고 처리
	public void input(tradeGoodsDomain domain) {
		
		tradeGoodsDao.input(domain);


	}
	
	@Override // 내역삭제
	public void delete(int dealNumber) {
		
		tradeGoodsDao.delete(dealNumber); 
	}
}