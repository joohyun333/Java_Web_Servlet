package com.example.domain;

import java.util.Date;

import org.springframework.stereotype.Component;

/*
 *  //거래물품
CREATE TABLE tradeGoods
(
 dealNumber int(11) NOT NULL auto_increment, 
 goodsNo VARCHAR(20) NOT NULL,
 classification VARCHAR(10) NOT NULL, 
 amount INT(11) NOT NULL, 	
 Date date default current_timestamp, 	
 totalprice int(15) NOT NULL, 
 cusName VARCHAR(30) NOT NULL, 
 PRIMARY KEY(dealNumber),	
 FOREIGN KEY(goodsNo) REFERENCES goods(goodsNo)
 FOREIGN KEY(cusName) REFERENCES customers(cusName)
);     
 
 */

@Component
public class tradeGoodsDomain extends GoodsDomain{
	private int dealNumber; //거래번호
	private String goodsNo; //물품코드
	private String classification; // ex) 입고 , 출고
	private int amount; // 수량
	private Date date; //거래날짜
	private int totalprice; // 거래금액
	private String cusName; //거래처 이름
	private GoodsDomain goodsDomain; // goods join 가져올것
	
	public tradeGoodsDomain() {
		this.goodsDomain = new GoodsDomain();
	}		
	
	public int getDealNumber() {
		return dealNumber;
	}
	public void setDealNumber(int dealNumber) {
		this.dealNumber = dealNumber;
	}
	
	
	public String getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}
	
		
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	
	
	public int getAmount() {
		return amount;
	}
	
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	

	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	
	
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}

	
	
}
