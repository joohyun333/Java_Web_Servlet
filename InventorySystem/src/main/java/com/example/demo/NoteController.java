package com.example.demo;

import java.util.List;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.example.domain.NoteDomain;
import com.example.note.noteDaoImpl;



@Controller
public class NoteController {

    // 메모장게시물 listGET
	@RequestMapping(value="/Main/main", method=RequestMethod.GET)	
	public ModelAndView getNoteList(ModelAndView mav) {
		
		GenericXmlApplicationContext ctx=new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		noteDaoImpl notedao=(noteDaoImpl)ctx.getBean("noteService");
		
		 List<NoteDomain> list=notedao.list();
		 
		 mav.addObject("NoteList", list);
		 mav.setViewName("/Main/main");
		 
		 ctx.close();
		 
		 return mav;
		
	}
	
	
	   // 메모장작성 GET
		@RequestMapping(value="/Main/write", method=RequestMethod.GET)	
		public void getWrite() {
			
			
		}
		
		
		// 메모장작성 POST
	    @RequestMapping(value="/Main/write", method=RequestMethod.POST)	
		public void postWrite(NoteDomain domain,ModelAndView mav) {
	    	GenericXmlApplicationContext ctx=new GenericXmlApplicationContext("classpath*:applicationContext.xml");
			noteDaoImpl notedao=(noteDaoImpl)ctx.getBean("noteService");
			
			notedao.write(domain);
			mav.setViewName("redirect:/Main/main");
			
			ctx.close();
			
			
					
				}
	    
	  // 게시물 읽기GET 
	  @RequestMapping(value="/Main/view" ,method=RequestMethod.GET)
	  public ModelAndView getview(@RequestParam(value="num",required=false) int num, ModelAndView mav){
	    	  
		  GenericXmlApplicationContext ctx=new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		  noteDaoImpl notedao=(noteDaoImpl)ctx.getBean("noteService");

		   String content=notedao.view(num);
	          
	    	
	     mav.addObject("Content",content);
	     mav.addObject("num",num);

	    		  

	    	   ctx.close();
	    	   return mav;
	    }
	  
		
	// 글수정GET
	  @RequestMapping(value="/Main/modify", method=RequestMethod.GET)
	  public ModelAndView getModify(@RequestParam("num") int num,ModelAndView mav) {
		  
		  GenericXmlApplicationContext ctx=new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		  noteDaoImpl notedao=(noteDaoImpl)ctx.getBean("noteService");
			
		   
			 
		   mav.addObject("Content", notedao.view(num));
		  
		  ctx.close();
		  
		  return mav;
	  	
	  }


	  //글수정Post
	  @RequestMapping(value="/Main/modify", method=RequestMethod.POST)
	  public ModelAndView postmodify(NoteDomain domain,ModelAndView mav) {
		  
		  GenericXmlApplicationContext ctx=new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		  noteDaoImpl notedao=(noteDaoImpl)ctx.getBean("noteService");
	      notedao.modify(domain);
	      
	      ctx.close();
	       
	       mav.setViewName("redirect:/Main/main");
	       return mav;
	  }
	  
	  
	//글삭제GET
	  @RequestMapping(value="/Main/delete", method=RequestMethod.GET)
	  public ModelAndView getdelete(@RequestParam("num") int num, ModelAndView mav) {
		  
		  GenericXmlApplicationContext ctx=new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		  noteDaoImpl notedao=(noteDaoImpl)ctx.getBean("noteService");
	      notedao.delete(num);
	       
	       ctx.close();
	       
	       mav.setViewName("redirect:/Main/main");     
	       return mav;
	  	
	  }
}

