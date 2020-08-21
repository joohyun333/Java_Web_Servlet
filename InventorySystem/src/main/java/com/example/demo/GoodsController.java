package com.example.demo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.domain.GoodsDomain;
import com.example.goods.goodsDaoImpl;
import com.example.note.noteDaoImpl;

@Controller
public class GoodsController {
	
	//물품리스트
	@RequestMapping(value= "GoodsManage/goodslist",method = RequestMethod.GET)
	public ModelAndView goodsList(GoodsDomain goods,ModelAndView mav) {
		GenericXmlApplicationContext ctx=new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		goodsDaoImpl goodsDao =(goodsDaoImpl)ctx.getBean("goodsService");
		//goodsDaoImpl =(noteDaoImpl)ctx.getBean("tradeGoodsService");
 		List<GoodsDomain> goodsList = goodsDao.goodsList(goods);
 		
		mav.addObject("goodsList", goodsList);
		mav.addObject("searchType",goods.getSearchType());
		mav.addObject("searchWord",goods.getSearchWord());
		mav.setViewName("GoodsManage/goodslist");
		
		ctx.close();
		return mav;
	}
	

	//물품 등록
	@RequestMapping(value= "GoodsManage/GoodsRegisterForm",method = RequestMethod.GET)
	public ModelAndView goodsWriteForm(ModelAndView mav) {
		mav.setViewName("GoodsManage/GoodsRegisterForm");
		return mav;
	}
	
	@RequestMapping(value= "GoodsManage/GoodsRegister",method = RequestMethod.POST)
	public ModelAndView goodsWrite(GoodsDomain goods,ModelAndView mav) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		goodsDaoImpl goodsDao =(goodsDaoImpl)ctx.getBean("goodsService");
		goodsDao.goodsRegister(goods);
		mav.setViewName("GoodsManage/GoodsRegister");
		ctx.close();
		return mav;
	}
	

	//물품 수정
	@RequestMapping(value= "GoodsManage/GoodsModifyForm" ,method = RequestMethod.GET)
	public ModelAndView goodsModifyForm(GoodsDomain goods,ModelAndView mav) {
		GenericXmlApplicationContext ctx=new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		goodsDaoImpl goodsDao =(goodsDaoImpl)ctx.getBean("goodsService");
		GoodsDomain goodsDomain = goodsDao.goodsInfoIdx(goods.getGoodsNo());
		
		mav.setViewName("GoodsManage/GoodsModifyForm");
		mav.addObject("goods", goodsDomain);
		ctx.close();
		return mav;
	}
	
	@RequestMapping(value= "GoodsManage/goodsModify",method = RequestMethod.POST)
	public ModelAndView goodsModify(GoodsDomain goods,ModelAndView mav) {
		GenericXmlApplicationContext ctx=new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		goodsDaoImpl goodsDao =(goodsDaoImpl)ctx.getBean("goodsService");
		goodsDao.goodsModify(goods);
		mav.setViewName("GoodsManage/goodsModify");
		ctx.close();
		return mav;
	}	
	
	//물품삭제
	@RequestMapping(value= "GoodsManage/goodsDelete",method = RequestMethod.GET)
	public ModelAndView goodsDelete(GoodsDomain goods,ModelAndView mav) {
		GenericXmlApplicationContext ctx=new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		goodsDaoImpl goodsDao =(goodsDaoImpl)ctx.getBean("goodsService");
		goodsDao.goodsDelete(goods.getGoodsNo());
		mav.setViewName("GoodsManage/goodsDelete");
		ctx.close();
		return mav;
	}
	// tradegoods join goods
	@RequestMapping(value = "TradeGoodsManage/tradelist", method = RequestMethod.GET)
	public ModelAndView getTradeList(ModelAndView mav) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		goodsDaoImpl goodsdao = (goodsDaoImpl) ctx.getBean("goodsService");
		List<GoodsDomain> list = goodsdao.tradeList();
		mav.addObject("TradeList", list);
		mav.setViewName("TradeGoodsManage/tradelist");
		ctx.close();
		return mav;
	}
}
