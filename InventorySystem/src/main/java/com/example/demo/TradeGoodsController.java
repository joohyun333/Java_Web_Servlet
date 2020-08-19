package com.example.demo;

import java.util.List;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.domain.GoodsDomain;
import com.example.domain.tradeGoodsDomain;
import com.example.goods.goodsDaoImpl;
import com.example.tradeGoods.tradeGoodsImpl;

@Controller
public class TradeGoodsController {
	// 물품선택된 리스트 구현
	// 입고처리
	@RequestMapping(value = "/TradeGoodsManage/inputlist", method = {RequestMethod.GET})
	public ModelAndView getinputList(ModelAndView mav, tradeGoodsDomain domain) {
		
		return mav;
	}
	
	@RequestMapping(value = "/TradeGoodsManage/inputlist", method = {RequestMethod.POST})
	public ModelAndView postinputList(ModelAndView mav, tradeGoodsDomain domain) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		tradeGoodsImpl tradeGoodsdao = (tradeGoodsImpl) ctx.getBean("tradeGoodsService");
		goodsDaoImpl goodsdao = (goodsDaoImpl) ctx.getBean("goodsService");
		tradeGoodsdao.input(domain);
		goodsdao.inputTotalAmount();
		mav.setViewName("/TradeGoodsManage/inputlist");
		ctx.close();
		return mav;
	}
	// 출고처리

	// 반품처리

//	// goods join tradegoods리스트
//	@RequestMapping(value = "/TradeGoodsManage/tradelist", method = RequestMethod.GET)
//	public ModelAndView getTradegoodsList(ModelAndView mav) {
//		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
//		tradeGoodsImpl tradeGoodsdao = (tradeGoodsImpl) ctx.getBean("tradeGoodsService");
//		List<tradeGoodsDomain> list = tradeGoodsdao.tradelist();
//		mav.addObject("TradeList", list);
//		mav.setViewName("/TradeGoodsManage/tradelist");
//		ctx.close();
//		return mav;
//	}
	// tradegoodslist 삭제
	@RequestMapping(value= "/TradeGoodsManage/tradeGoodsDelete",method = RequestMethod.GET)
	public ModelAndView TradegoodsDelete(tradeGoodsDomain tradegoodsDomain,ModelAndView mav) {
		GenericXmlApplicationContext ctx=new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		tradeGoodsImpl tradeGoodsdao = (tradeGoodsImpl) ctx.getBean("tradeGoodsService");
		tradeGoodsdao.delete(tradegoodsDomain.getDealNumber());
		mav.setViewName("/TradeGoodsManage/tradeGoodsDelete");
		ctx.close();
		return mav;
	}
}
