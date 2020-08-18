package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

	@RequestMapping(value = "/callback", method = RequestMethod.GET)
	public String callback(Model model) {

		return "callback";
	}

//	@RequestMapping(value = "/callback", method = RequestMethod.GET)
//	public String callback(Model model, @RequestParam String access_token) throws Exception{
//		System.out.println(access_token);
//		return "callback";
//	}

	// 테스트용
	@RequestMapping(value = "/Login/login", method = RequestMethod.GET)
	public String login(Model model) {

		return "Login/login";
	}
}
