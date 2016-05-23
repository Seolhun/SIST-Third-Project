package com.sist.sist;

import java.io.PrintWriter;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.*;

import javax.servlet.http.HttpServletResponse;
@Controller
public class SearchController {
   @RequestMapping("search.do")
   public String search_main(Model model)
   {
	   return "search/search";
   }
   @RequestMapping(value = "search_music.do", produces = "application/json; charset=utf8")
   public void search_music(String music_Name,Model model,HttpServletResponse res){
	   res.setContentType("text/html;charset=UTF-8"); 
		try{
			String URL = "http://www.melon.com/search/song/index.htm?q=";   //사이트 주소
			String subURL = music_Name; // request로 전달받을 검색어
			subURL =  URLEncoder.encode(subURL, "UTF-8");
			String endURL="&section=song&searchGnbYn=Y&ipath=srch_form";
			URL = URL + subURL + endURL;    //URL UTF 인코딩
			Document doc = Jsoup.connect(URL).get();     //JSOUP을 이용한 사이트 접속 후 DOM접속
			Elements title_elem = doc.select("a.fc_gray");   //셀럭터를 이용해 검색 후 파싱
			Elements artist_elem =doc.select("span.checkEllipsisSongdefaultList a.fc_mgray");
			
			 JSONObject jobj = new JSONObject();
			 JSONArray ja = new JSONArray();
			 int num=0;
			 if(title_elem.size()>=artist_elem.size()){
				 num=artist_elem.size();
			 }else{
				 num =title_elem.size();
			 }
			 for(int i=0;i<num;i++){
				
				 Element title_El=title_elem.get(i);
				 String title = title_El.attr("title");
				 Element artist_El=artist_elem.get(i);
				 String artist = artist_El.text();
/*				 String result = "{\"title\":\""+title+
						 "\",\"artist\":\""+artist+"\"}";*/
				 System.out.println(title+"|"+artist);
				 if(title!=null&&artist!=null){
				 ja.add(title+"|"+artist);
				 }
			 }

			    res.setContentType("application/json; charset=UTF-8");

			    PrintWriter pw = res.getWriter();
			    pw.print(ja.toJSONString());
			    pw.flush();
				
			}catch(Exception e){System.out.println("검색 결과가 없습니다.");}
   }
   
   @RequestMapping(value = "search_artist.do", produces = "application/json; charset=utf8")
   public void search_artist(String artist_Name,Model model,HttpServletResponse res){
	   res.setContentType("text/html;charset=UTF-8"); 
		try{
			String URL = "http://www.melon.com/search/song/index.htm?q=";   //사이트 주소
			String subURL = artist_Name; // request로 전달받을 검색어
			subURL =  URLEncoder.encode(subURL, "UTF-8");
			String endURL="&section=artist&searchGnbYn=Y&ipath=srch_form";
			URL = URL + subURL + endURL;    //URL UTF 인코딩
			Document doc = Jsoup.connect(URL).get();     //JSOUP을 이용한 사이트 접속 후 DOM접속
			Elements title_elem = doc.select("a.fc_gray");   //셀럭터를 이용해 검색 후 파싱
			Elements artist_elem =doc.select("#artistName span a.fc_mgray");
			
			 JSONObject jobj = new JSONObject();
			 JSONArray ja = new JSONArray();
			 int num=0;
			 if(title_elem.size()>=artist_elem.size()){
				 num=artist_elem.size();
			 }else{
				 num =title_elem.size();
			 }
			 for(int i=0;i<num;i++){
				
				 Element title_El=title_elem.get(i);
				 String title = title_El.attr("title");
				 Element artist_El=artist_elem.get(i);
				 String artist = artist_El.text();
/*				 String result = "{\"title\":\""+title+
						 "\",\"artist\":\""+artist+"\"}";*/
				 System.out.println(title+"|"+artist);
				 if(title!=null&&artist!=null){
				 ja.add(title+"|"+artist);
				 }
			 }

			    res.setContentType("application/json; charset=UTF-8");

			    PrintWriter pw = res.getWriter();
			    pw.print(ja.toJSONString());
			    pw.flush();
			}catch(Exception e){System.out.println("검색 결과가 없습니다.");}
   }
   
   @RequestMapping(value = "search_profile.do", produces = "application/json; charset=utf8")
   public void search_profile(String profile_Name,Model model,HttpServletResponse res){
	   res.setContentType("text/html;charset=UTF-8"); 
		try{
			String URL = "http://www.melon.com/search/artist/index.htm?q=";   //사이트 주소
			String subURL = profile_Name; // request로 전달받을 검색어
			subURL =  URLEncoder.encode(subURL, "UTF-8");
			String endURL="&section=&searchGnbYn=Y&ipath=srch_form";
			URL = URL + subURL + endURL;    //URL UTF 인코딩
			Document doc = Jsoup.connect(URL).get();     //JSOUP을 이용한 사이트 접속 후 DOM접속
			Elements poster_elem = doc.select("div.wrap_atist12 a.thumb img");
			Elements artist_elem =doc.select(".atist_info dt a");
			
			 JSONObject jobj = new JSONObject();
			 JSONArray ja = new JSONArray();
			 int num=0;
			 if(poster_elem.size()>=artist_elem.size()){
				 num=artist_elem.size();
			 }else{
				 num =poster_elem.size();
			 }
			 for(int i=0;i<num;i++){
				
				 Element poster_El=poster_elem.get(i);
				 String poster = poster_El.attr("src");
				 Element artist_El=artist_elem.get(i);
				 String artist = artist_El.text();
/*				 String result = "{\"title\":\""+title+
						 "\",\"artist\":\""+artist+"\"}";*/
				 System.out.println(poster+"|"+artist);
				 if(poster!=null&&artist!=null){
				 ja.add(poster+"|"+artist);
				 }
			 }

			    res.setContentType("application/json; charset=UTF-8");

			    PrintWriter pw = res.getWriter();
			    pw.print(ja.toJSONString());
			    pw.flush();
			}catch(Exception e){System.out.println("검색 결과가 없습니다.");}
   }
   
}
