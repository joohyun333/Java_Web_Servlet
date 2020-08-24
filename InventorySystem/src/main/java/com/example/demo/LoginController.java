package com.example.demo;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.domain.NoteDomain;
import com.example.members.membersDaoImpl;
import com.example.note.noteDaoImpl;
import com.example.domain.MembersDomain;

@Controller
public class LoginController {

//	@RequestMapping(value = "/callback", method = RequestMethod.GET)
//	public String callback(Model model) {
//		
//		return "callback";
//	}

	@RequestMapping(value = "/callback", method = RequestMethod.GET)
	public ModelAndView callback(ModelAndView mav) throws Exception {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		noteDaoImpl notedao = (noteDaoImpl) ctx.getBean("noteService");

		List<NoteDomain> list = notedao.list();

		mav.addObject("NoteList", list);
		mav.setViewName("/callback");

		ctx.close();

		return mav;
	}

	// 테스트용
	@RequestMapping(value="/mainCallback", method=RequestMethod.GET)	
	public ModelAndView mainCallback(ModelAndView mav) {
		GenericXmlApplicationContext ctx=new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		noteDaoImpl notedao=(noteDaoImpl)ctx.getBean("noteService");
		 List<NoteDomain> list=notedao.list();
		 mav.addObject("NoteList", list);
		 mav.setViewName("/mainCallback");
		 ctx.close();
		 return mav;
	}

	// 테스트용
	@RequestMapping(value = "/loginok", method = RequestMethod.GET)
	public String loginok(Model model) {
		return "/loginok";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model) {
		return "/logout";
	}

	// 회원가입
	@RequestMapping(value = "/Main/main", method = RequestMethod.POST)
	public ModelAndView PostSignUp(MembersDomain domain) throws Exception {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		membersDaoImpl membersdao = (membersDaoImpl) ctx.getBean("membersService");
		membersdao.SignUp(domain);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Main/main");
		ctx.close();
		return mav;
	}

}
