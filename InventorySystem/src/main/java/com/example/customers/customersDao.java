package com.example.customers;

import java.util.List;

import com.example.domain.CustomersDomain;

public interface customersDao {
	//판매 거래처(소매상)은 sel로 표기 classification은 output(출고)
	public List<CustomersDomain> selList();				//판매 거래처 리스트
	public CustomersDomain selRead(String cusName);		//판매 거래처 내역 읽어오기
	
	//구매 거래처(도매상)은 buy로 표기 classification은 input(입고)
	public List<CustomersDomain> buyList();				//구매 거래처 리스트
	public CustomersDomain buyRead(String cusName);		//구매 거래처 내역 읽어오기
	
	public void cusInsert(CustomersDomain cus);		//거래처 추가
	public void cusUpdate(CustomersDomain cus);		//거래처 수정
	public void cusDelete(CustomersDomain cus);		//거래처 삭제
	public CustomersDomain cusInfo(String cusName);		//거래처 상세정보
}