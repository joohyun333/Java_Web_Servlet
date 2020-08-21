package com.example.domain;

import org.springframework.stereotype.Component;

/*
 *    물품
CREATE TABLE goods
(
 goodsNo VARCHAR(20) NOT NULL,
 goodsName VARCHAR(50) NOT NULL,
 goodsColor VARCHAR(20) NOT NULL,
 manufacturer VARCHAR(30) NOT NULL,
 brandName VARCHAR(30) NOT NULL,
 goodsPrice INT NOT NULL, 
 size VARCHAR(20) NOT NULL,
 totalAmount int(15) NOT NULL default 0,
 PRIMARY KEY(goodsNo)
);

*/
@Component
public class GoodsDomain extends tradeGoodsDomain{

	private String goodsNo; // 물품코드
	private String goodsName; // 물품명
	private String goodsColor; // 물품색깔
	private String manufacturer; // 제조사
	private String brandName; // 브랜드
	private int goodsPrice; // 물품가격
	private String size; // 물품 사이즈
	private int totalAmount; // 물품 총수량
	private String searchType;
	private String searchWord;

	private tradeGoodsDomain tradeGoodsDomain; // tradegoods join 가져올 것

	public GoodsDomain() {
		this.tradeGoodsDomain = new tradeGoodsDomain();
	}

	public tradeGoodsDomain getGoodsDomain() {
		return tradeGoodsDomain;
	}
	public void setGoodsDomain(tradeGoodsDomain tradeGoodsDomain) {
		this.tradeGoodsDomain = tradeGoodsDomain;
	}

	public String getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getGoodsColor() {
		return goodsColor;
	}

	public void setGoodsColor(String goodsColor) {
		this.goodsColor = goodsColor;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public int getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

}
