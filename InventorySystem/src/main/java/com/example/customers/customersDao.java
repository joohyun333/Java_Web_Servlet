package com.example.customers;

import java.util.List;

import com.example.domain.CustomersDomain;
import com.example.domain.tradeGoodsDomain;

public interface customersDao {
	//판매 거래처(소매상)은 sel로 표기 classification은 출고
	public List<CustomersDomain> selList();				//판매 거래처 리스트
	public List<tradeGoodsDomain> selRead(String cusName);	//판매 거래처 내역 읽어오기
	
	//구매 거래처(도매상)은 buy로 표기 classification은 입고
	public List<CustomersDomain> buyList();				//구매 거래처 리스트
	public List<tradeGoodsDomain> buyRead(String cusName);		//구매 거래처 내역 읽어오기
	
	public CustomersDomain cusInfo(String cusName);		//거래처 상세정보
	public void cusInsert(CustomersDomain cus);		//거래처 추가
	public void cusUpdate(CustomersDomain cus);		//거래처 수정
	public void cusDelete(String cusName);		//거래처 삭제
}