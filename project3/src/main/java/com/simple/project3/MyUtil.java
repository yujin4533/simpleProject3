package com.simple.project3;

import javax.servlet.http.HttpServletRequest;

public class MyUtil {

	public static String searchPageBar(HttpServletRequest request, HomeVO vo) {
		String pageBar = "";
		String searchVO = "";
		if(vo.getFileTag()!=null && vo.getFileTag()!="")
			searchVO += "&fileTag="+vo.getFileTag().substring(1);
		int loop = 1;
		int pageNo = ((vo.getCurrentShowPage()-1)/vo.getBlockSize())*vo.getBlockSize()+1;
		if(pageNo!=1)
			pageBar+= "<li><a href='/project3/"+vo.getFileType()+".p3?currentShowPage="+(pageNo-1)+searchVO+"'>이전페이지</a></li>";
		
		while( !(loop>vo.getBlockSize() || pageNo>vo.getTotalPage()) ) {
			// 1>5 || 1>5
			if(pageNo == vo.getCurrentShowPage()) 
				pageBar += "<li class='active'><span>"+pageNo+"</span></li>";
			
			else 
				pageBar += "<li><a href='/project3/"+vo.getFileType()+".p3?currentShowPage="+pageNo+searchVO+"'>"+pageNo+"</a><li/>"; 
			
			loop++;
			pageNo++;
		}
		
		if( !(pageNo>vo.getTotalPage()) ) 
			pageBar += "<li><a href='/project3/"+vo.getFileType()+".p3?currentShowPage="+pageNo+searchVO+"'>다음페이지</a></li>"; 
		
		return pageBar;
	}

	public static String getCurrentURL(HttpServletRequest request) {
		String currentURL = request.getRequestURL().toString(); // url주소
		String ctxPath = request.getContextPath(); // /project3
		
		int beginIndex = currentURL.indexOf(ctxPath) + ctxPath.length();
		currentURL = currentURL.substring(beginIndex+1); // ctxPath앞 자르기
		
		return currentURL;
	}
	
	public static String getCurrentURLQuery(HttpServletRequest request) {
		String currentURL = request.getRequestURL().toString(); // url주소
		String queryString = request.getQueryString(); // ?뒤
		currentURL += "?"+queryString;
		String ctxPath = request.getContextPath(); // /project3
		
		int beginIndex = currentURL.indexOf(ctxPath) + ctxPath.length();
		currentURL = currentURL.substring(beginIndex+1); // ctxPath앞 자르기
		
		return currentURL;
	}
}
