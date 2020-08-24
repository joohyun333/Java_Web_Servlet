package com.example.demo;

import java.util.List;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.customers.customersDaoImpl;
import com.example.domain.CustomersDomain;
import com.example.domain.tradeGoodsDomain;

@Controller
public class CustomersController {
	
	// 거래처 관리 메인
	@RequestMapping(value = "/CustomersManage/cusMain", method = RequestMethod.GET)
	public String getcusMain(Model model) {
		return "/CustomersManage/cusMain";
	}	

	// 거래처(판매) 리스트
	@RequestMapping(value = "/CustomersManage/selList", method = RequestMethod.GET)
	public ModelAndView selList(ModelAndView mav) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		customersDaoImpl cusdao = (customersDaoImpl) ctx.getBean("customersService");

		List<CustomersDomain> selList = cusdao.selList();
		mav.addObject("selList", selList);

		ctx.close();
		return mav;
	}

	// 거래처(구매) 리스트
	@RequestMapping(value = "/CustomersManage/buyList", method = RequestMethod.GET)
	public ModelAndView buyList(ModelAndView mav) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		customersDaoImpl cusdao = (customersDaoImpl) ctx.getBean("customersService");

		List<CustomersDomain> buyList = cusdao.buyList();
		mav.addObject("buyList", buyList);

		ctx.close();
		return mav;
	}

	// 거래처 상세 정보
	@RequestMapping(value = "/CustomersManage/cusInfo", method = RequestMethod.GET)
	public ModelAndView cusInfo(@RequestParam(value = "num", required = false) String cusName, ModelAndView mav) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		customersDaoImpl cusdao = (customersDaoImpl) ctx.getBean("customersService");

		mav.addObject("cusInfo", cusdao.cusInfo(cusName));
		
		ctx.close();
		return mav;
	}

	// 거래처 추가
	@RequestMapping(value = "/CustomersManage/cusInsert", method = RequestMethod.GET)
	public ModelAndView getcusInsert(ModelAndView mav) {
		return mav;
	}
	
	@RequestMapping(value = "/CustomersManage/cusInsert", method = RequestMethod.POST)
	public ModelAndView setcusInsert(CustomersDomain cus, ModelAndView mav) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		customersDaoImpl cusdao = (customersDaoImpl) ctx.getBean("customersService");

		cusdao.cusInsert(cus);
		mav.setViewName("redirect:/CustomersManage/cusMain");
		
		ctx.close();
		return mav;
	}

	// 거래처 정보 수정
	@RequestMapping(value = "/CustomersManage/cusUpdate", method = RequestMethod.GET)
	public ModelAndView getcusUpdate(CustomersDomain cus, ModelAndView mav) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		customersDaoImpl cusdao = (customersDaoImpl) ctx.getBean("customersService");

		mav.addObject("cusInfo", cusdao.cusInfo(cus.getCusName()));

		ctx.close();
		return mav;
	}
	@RequestMapping(value = "/CustomersManage/cusUpdate", method = RequestMethod.POST)
	public ModelAndView setcusUpdate(CustomersDomain cus, ModelAndView mav) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		customersDaoImpl cusdao = (customersDaoImpl) ctx.getBean("customersService");
		
		cusdao.cusUpdate(cus);

		mav.setViewName("redirect:/CustomersManage/cusMain");

		ctx.close();
		return mav;
	}
	
	//거래처 삭제
	@RequestMapping(value = "/CustomersManage/cusDelete", method = RequestMethod.GET)
	public ModelAndView cusDelete(CustomersDomain cus, ModelAndView mav) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		customersDaoImpl cusdao = (customersDaoImpl) ctx.getBean("customersService");

		cusdao.cusDelete(cus.getCusName());
		
		ctx.close();
		return mav;		
	}
	
	
	// 판매 거래처 거래 내역
	@RequestMapping(value = "/CustomersManage/selRead", method = RequestMethod.GET)
	public ModelAndView selRead(CustomersDomain cus, ModelAndView mav) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		customersDaoImpl cusdao = (customersDaoImpl) ctx.getBean("customersService");
		
		List<tradeGoodsDomain> selRead = cusdao.selRead(cus.getCusName());
		mav.addObject("selRead", selRead);
		
		ctx.close();
		return mav;
	}
	
	// 구매 거래처 거래 내역
	@RequestMapping(value = "/CustomersManage/buyRead", method = RequestMethod.GET)
	public ModelAndView buyRead(CustomersDomain cus, ModelAndView mav) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		customersDaoImpl cusdao = (customersDaoImpl) ctx.getBean("customersService");
		
		List<tradeGoodsDomain> buyRead = cusdao.buyRead(cus.getCusName());
		mav.addObject("buyRead", buyRead);
		ctx.close();
		return mav;
	}
}
