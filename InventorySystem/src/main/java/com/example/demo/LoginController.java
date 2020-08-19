package com.example.demo;

import java.util.List;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.domain.NoteDomain;
import com.example.note.noteDaoImpl;

@Controller
public class LoginController {

//	@RequestMapping(value = "/callback", method = RequestMethod.GET)
//	public String callback(Model model) {
//		
//		return "callback";
//	}

	@RequestMapping(value = "/callback", method = RequestMethod.GET)
	public ModelAndView callback(ModelAndView mav) throws Exception{
		GenericXmlApplicationContext ctx=new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		noteDaoImpl notedao=(noteDaoImpl)ctx.getBean("noteService");
		
		 List<NoteDomain> list=notedao.list();
		 
		 mav.addObject("NoteList", list);
		 mav.setViewName("/callback");
		 
		 ctx.close();
		 
		 return mav;
	}

	// 테스트용
	@RequestMapping(value = "/Login/login", method = RequestMethod.GET)
	public String login(Model model) {

		return "Login/login";
	}
}
