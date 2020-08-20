package com.example.customers;

import java.util.List;

import com.example.domain.CustomersDomain;

public class customersDaoImpl implements customersDao {
	private customersDao cusDao;

	public void setcustomersDao(customersDao cusDao) {
		this.cusDao = cusDao;
	}

	/* 판매 거래처(소매상) */
	// 판매 거래처 리스트 보기
	@Override
	public List<CustomersDomain> selList() {
		return cusDao.selList();
	}

	// 해당 판매 거래처 내역 읽어오기
	@Override
	public CustomersDomain selRead(String cusName) {
		return cusDao.selRead(cusName);
	}

	/* 구매 거래처(도매상) */
	@Override
	public List<CustomersDomain> buyList() {
		return cusDao.buyList();
	}

	// 해당 구매 거래처 내역 읽어오기
	@Override
	public CustomersDomain buyRead(String cusName) {
		return cusDao.buyRead(cusName);
	}

	// 거래처 상세 정보
	@Override
	public CustomersDomain cusInfo(String cusName) {
		return cusDao.cusInfo(cusName);
	}

	// 거래처 추가
	@Override
	public void cusInsert(CustomersDomain cus) {
		cusDao.cusInsert(cus);
	}

	// 거래처 수정
	@Override
	public void cusUpdate(CustomersDomain cus) {
		cusDao.cusUpdate(cus);
	}

	// 거래처 삭제
	@Override
	public void cusDelete(String cusName) {
		cusDao.cusDelete(cusName);
	}

}
