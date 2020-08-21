package com.example.Main;

import javax.xml.parsers.*;
import org.w3c.dom.*;
import java.util.*;

public class Weather {
	
	
	 public ArrayList<String> parsing() {

	   String url="";
	   ArrayList<String> list=new ArrayList<String>();
	   url="http://www.kma.go.kr/wid/queryDFS.jsp?gridx=97&gridy=79";
	   
	   try {
	   DocumentBuilder docBuilder=DocumentBuilderFactory.newInstance().newDocumentBuilder();
	   Document doc=docBuilder.parse(url);
	   doc.setDocumentURI(url);
	   NodeList nodeMomList=doc.getDocumentElement().getChildNodes();
	   ArrayList<String> xmlList=new ArrayList<String>();
	   Node row=nodeMomList.item(3);
	   NodeList childList=row.getChildNodes();
	   Node rows=childList.item(1);
	   NodeList childLists=rows.getChildNodes();
	   
       for(int a=0; a<childLists.getLength(); a++){
		   
		   Node tag_name=childLists.item(a);
		   
		   if(tag_name.getNodeName().equals("temp")){
			   
			   xmlList.add("온도:"+tag_name.getTextContent());
			   
		   }
		   
		  if(tag_name.getNodeName().equals("wfKor")) {
			  
			  xmlList.add("날씨:"+tag_name.getTextContent());
			  
		  }
		   
            if(tag_name.getNodeName().equals("pop")){
			   
			   xmlList.add("강수량:"+tag_name.getTextContent());
		   }
		   
		   if(tag_name.getNodeName().equals("reh")){
			   
			   xmlList.add("습도:"+tag_name.getTextContent());
			   
		   }
		   
		               
	   }
       
       for(int i=0; i<xmlList.size(); i++){

    	   list.add(i, xmlList.get(i));
       }
	  
}catch(Exception e) {
	
      }
	 
	   return list;
}
	 
	 
}
