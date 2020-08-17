package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	
		 @RequestMapping(value = "/Main/main/main", method=RequestMethod.GET)
		 public String GetMain(Model model) {
			
		        return "/Main/main";
		}		
}
