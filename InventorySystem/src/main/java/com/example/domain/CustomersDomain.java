package com.example.domain;

/*
 * 거래처
CREATE TABLE customers
(

 classification VARCHAR(20) NOT NULL,  //ex) 입고,출고
 cusName VARCHAR(30) NOT NULL , // ex) 회사이름
 phoneNo VARCHAR(15) NOT NULL,      // ex) 회사연락처
 address VARCHAR(30) NOT NULL,          // ex) 회사주소
 PRIMARY KEY(num)		
);

*/

public class CustomersDomain {

	private String classification; // ex)입고,출고
	private String cusName; // 회사 이름
	private String phoneNo; //회사 연락처
	private String address; //회사주소
	
	
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	
	
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	
	
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
