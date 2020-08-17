package com.example.demo;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.stereotype.Controller;


@Controller//String이나 ModelAndView객체반환
public class HelloController {
	
		
	//home.jsp
	 @RequestMapping(value = "/", method=RequestMethod.GET)
	public String hello(Model model) {
		
	        return "home";
	}	
}

