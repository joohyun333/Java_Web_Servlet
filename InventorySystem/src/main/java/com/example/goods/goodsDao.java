package com.example.goods;

import java.util.List;
import com.example.domain.GoodsDomain;

public interface goodsDao {
 
	 public List<GoodsDomain> goodsList(); //물품 목록 	
	
	 public void goodsRegister(GoodsDomain domain); //물품 등록
	 
	 public void goodsModify(GoodsDomain domain); //물품 수정
		
	 public void goodsDelete(String goodsNo); //물품 삭제
	 
	 public void inputTotalAmount();//입고처리 totalAmount값 수정 + 출고반품
	 
	 public void outputTotalAmount();    // 출고처리 totalAmount값 수정   - 입고반품
	 
	 public GoodsDomain goodsInfoIdx(String goodsNo);//해당물품번호의  물품명,색상,사이즈구하기해당물품번호의  물품명,색상,사이즈구하기
	 
	 public List<GoodsDomain> goodsNoImfo(String goodsNo);
}

