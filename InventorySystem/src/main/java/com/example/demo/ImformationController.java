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


@Controller
public class ImformationController {

	// 물품조회 GET
	@RequestMapping(value="/Imformation/goods", method=RequestMethod.GET)	
	public ModelAndView getGoodsList(ModelAndView mav) {
		
		GenericXmlApplicationContext ctx=new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		goodsDaoImpl goodsdao=(goodsDaoImpl)ctx.getBean("goodsService");
		GoodsDomain goodsDomain = new GoodsDomain();
		 List<GoodsDomain> list=goodsdao.goodsList(goodsDomain);
		 
		 
		 mav.addObject("GoodsList", list);
		 mav.setViewName("/Imformation/goods");
		 
		 ctx.close();
		 
		 return mav;
		
	}

	@RequestMapping(value = "Imformation/deal", method = RequestMethod.GET)
	public ModelAndView getTradeList(ModelAndView mav) {
		
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		goodsDaoImpl goodsdao = (goodsDaoImpl) ctx.getBean("goodsService");
		
		List<GoodsDomain> list = goodsdao.tradeList();
		
		mav.addObject("TradeList", list);
		mav.setViewName("Imformation/deal");
		
		ctx.close();
		return mav;
	}
	
}
