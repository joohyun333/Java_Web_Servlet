package com.example.demo;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.example.domain.GoodsDomain;
import com.example.domain.tradeGoodsDomain;
import com.example.goods.goodsDaoImpl;
import com.example.tradeGoods.tradeGoodsImpl;


@Controller
public class ImformationController {

	// 물품조회 GET
		@RequestMapping(value="/Imformation/goods", method=RequestMethod.GET)	
		public ModelAndView getGoodsList(ModelAndView mav) {
			
			GenericXmlApplicationContext ctx=new GenericXmlApplicationContext("classpath*:applicationContext.xml");
			goodsDaoImpl goodsdao=(goodsDaoImpl)ctx.getBean("goodsService");
			
			 List<GoodsDomain> list=goodsdao.goodsList();
			 
			 
			 mav.addObject("GoodsList", list);
			 mav.setViewName("/Imformation/goods");
			 
			 ctx.close();
			 
			 return mav;
			
		}
		
		// 거래내역조회 GET
		@RequestMapping(value="/Imformation/deal", method=RequestMethod.GET)	
		public ModelAndView getdeal(ModelAndView mav,HttpServletRequest request) {
					
		  GenericXmlApplicationContext ctx=new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		  tradeGoodsImpl tradegoods=(tradeGoodsImpl)ctx.getBean("tradeGoodsService");
					
		  List<tradeGoodsDomain> list=tradegoods.tradelist();
		 		 
		 mav.addObject("tradeList", list);
		 mav.setViewName("/Imformation/deal");
					 
		ctx.close();
					 
		return mav;
					
				}

}
