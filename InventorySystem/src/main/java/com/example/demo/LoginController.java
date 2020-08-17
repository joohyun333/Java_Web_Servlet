package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class LoginController {
	
	@RequestMapping(value = "/callback", method = RequestMethod.GET)
	public String callback(Model model) {

		return "callback";
	}
	
	@RequestMapping(value = "/Login/login", method = RequestMethod.GET)
	public String login(Model model) {

		return "Login/login";
	}
}
