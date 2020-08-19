package com.example.goods;

import java.util.List;
import com.example.domain.GoodsDomain;

public class goodsDaoImpl implements goodsDao{
	
  private goodsDao goodsDao;
  
  public void setgoodsDao(goodsDao goodsDao) {
		this.goodsDao=goodsDao;
	}
  
  
  @Override //물품 등록
  public List<GoodsDomain> goodsList(GoodsDomain goods){
	  List<GoodsDomain> goodList = null;
	  try {
		 goodList = goodsDao.goodsList(goods);
		  
	  }catch(Exception e){
		  e.printStackTrace();
		  System.out.println(e.getMessage());
	  }
	  return goodList;
  }
  
  @Override //물품 등록
  public void goodsRegister(GoodsDomain domain) {
	  
	  goodsDao.goodsRegister(domain);
  }
  
  @Override //물품 수정
  public void goodsModify(GoodsDomain domain) {
	  
	  goodsDao.goodsModify(domain);
  }
  
  @Override //물품 삭제
  public void goodsDelete(String goodsNo) {
	  
	  goodsDao.goodsDelete(goodsNo);
  }
  
  @Override //입고처리 totalAmount값 수정 + 출고반품
  public void inputTotalAmount() {
	  
	  goodsDao.inputTotalAmount();
  }
	 
  @Override // 출고처리 totalAmount값 수정   - 입고반품
	 public void outputTotalAmount() {
	  
	  goodsDao.outputTotalAmount();
  }
  
  @Override
  public GoodsDomain goodsInfoIdx(String goodsNo){
	  
	 return goodsDao.goodsInfoIdx(goodsNo);
  }

  @Override
  public List<GoodsDomain>goodsNoImfo(String goodsNo){
	  
	 return goodsDao.goodsNoImfo(goodsNo);
  }
  
  @Override	// tradegoods join goods
	public List<GoodsDomain> tradeList(){

		return goodsDao.tradeList();

	}
	
}
