package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	@RequestMapping(value = "/callback", method = RequestMethod.GET)
	public String callback(Model model) {
		
		return "callback";
	}

//	@RequestMapping(value = "/callback", method = RequestMethod.GET)
//	public ModelAndView callback(ModelAndView model) throws Exception{
//		model.setViewName("/callback");
//		model.addObject("message", "로그인성공");
//		return model;
//	}

	// 테스트용
	@RequestMapping(value = "/Login/login", method = RequestMethod.GET)
	public String login(Model model) {

		return "Login/login";
	}
}
