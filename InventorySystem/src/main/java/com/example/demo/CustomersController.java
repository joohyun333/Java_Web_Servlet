package com.example.demo;

import java.util.List;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.customers.customersDaoImpl;
import com.example.domain.CustomersDomain;
import com.example.goods.goodsDaoImpl;

@Controller
public class CustomersController {
	customersDaoImpl cusDaoImpl;
	
	//거래처(판매) 리스트
	@RequestMapping("/CustomersManage/selList")
	public ModelAndView selList(ModelAndView mav) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		customersDaoImpl cusdao = (customersDaoImpl) ctx.getBean("customersService");
		
		List<CustomersDomain> selList = cusdao.selList();
		mav.addObject("selList", selList);
		mav.setViewName("/CustomersManage/selList");
		
		ctx.close();
		
		return mav;
	}
	
	//거래처(구매) 리스트
		@RequestMapping("/CustomersManage/buyList")
		public ModelAndView buyList(ModelAndView mav) {
			GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
			customersDaoImpl cusdao = (customersDaoImpl) ctx.getBean("customersService");
			
			List<CustomersDomain> selList = cusdao.selList();
			mav.addObject("selList", selList);
			mav.setViewName("/CustomersManage/selList");
			
			ctx.close();
			
			return mav;
		}
	
	
	
	
	
	@RequestMapping("/cusInfo/{cusName}")
	public String cusInfo(@PathVariable String cusName, Model model) {
		model.addAttribute("cusInfo", cusDaoImpl.cusInfo(cusName));
		return "cusInfo";
	}
	
	@RequestMapping("/CustomersManage/cusInsert")
	public String getcusInsert() {
		return "/CustomersManage/cusInsert";
	}
	
}
