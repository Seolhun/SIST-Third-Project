package com.sist.sist;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.artist.ArtistDAO;
import com.sist.artist.ArtistVO;
import com.sist.member.MemberDAO;
import com.sist.member.MemberVO;
import com.sist.songlist.SonglistDAO;
import com.sist.songlist.SonglistVO;
import com.sist.train.*;
import com.sist.search.*;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.*;

import javax.servlet.http.HttpServletResponse;
@Controller
public class MytrainController {
	@Autowired
	private TrainDAO dao;
	@Autowired
	private SonglistDAO sdao;
	@Autowired
	private MemberDAO mdao;
	@Autowired
	private ArtistDAO adao;
	@RequestMapping("mytrain.do")
	public String mytrain(String id,Model model){
		List<MemberVO> list=mdao.MemberAllData(id);
		List<ArtistVO> alist=adao.ArtistAllData(id);
		model.addAttribute("alist",alist);
		model.addAttribute("genrelist",list);
		MemberVO vo=list.get(0);
		String nick=vo.getNick();
		model.addAttribute("nick",nick);
		return "mytrain/mytrain";
	}
	@RequestMapping("mytrainlist.do")
	public String mytrainlist(String id,Model model){
		List<TrainVO> list=dao.trainAllData(id);
		model.addAttribute("list",list);
		return "mytrain/maketrain";
	}
	@RequestMapping("maketrain.do")
	public String maketrain(String id,String name,String nick,Model model){
		int train_no=dao.trainInsert(id, name,nick.trim());
		System.out.println("id:"+id+"  train_name"+name+"train_no:"+train_no);
		List<TrainVO> list=dao.trainAllData(id);
		sdao.createSongList(train_no, id);
		model.addAttribute("list",list);
		return "mytrain/maketrain";
	}
	@RequestMapping("deletetrain.do")
	public String deletetrain(String train_no,String id,Model model){
		int no=Integer.parseInt(train_no);
		System.out.println("train_no:"+no+"  id:"+id);
		dao.trainDelete(no,id.trim());
		sdao.songlistDelete(no, id.trim());
		List<TrainVO> list=dao.trainAllData(id.trim());
		model.addAttribute("list",list);
		return "mytrain/maketrain";
	}
	@RequestMapping("songlist.do")
	public String songlist(String id,String no,Model model){
		int train_no=Integer.parseInt(no);
		List<SonglistVO> list=sdao.songListAllData(train_no, id);
		model.addAttribute("list",list);
		return "mytrain/songlist";
	}
	@RequestMapping("addtrain.do")
	   public String addtrain(String id,Model model){
	   List<TrainVO> list=dao.trainAllData(id.trim());		model.addAttribute("list",list);		return "mytrain/footeraddtrain";	
   }
	@RequestMapping("genreadd.do")
	public String genreadd(String id,String my_genre,Model model){
		mdao.GenreInsert(id, my_genre);
		List<MemberVO> list=mdao.MemberAllData(id.trim());
		model.addAttribute("genrelist",list);
		return "mytrain/addgenre";
	}
	@RequestMapping("songdelete.do")
	public String songlistDelete(String train_no,String song_no,String id,Model model){
		int no_train=Integer.parseInt(train_no);
		int no_song=Integer.parseInt(song_no);
		sdao.songDelete(no_train, id.trim(), no_song);
		List<SonglistVO> list=sdao.songListAllData(no_train, id.trim());
		model.addAttribute("list", list);
		return "mytrain/songlist";
	}
	@RequestMapping("nickchange.do")
	public String nickChange(String id,String nick,Model model){
		mdao.nickChange(id, nick);
		dao.trainNickChange(id, nick);
		List<TrainVO> list=dao.trainAllData(id.trim());
		model.addAttribute("list",list);
		return "mytrain/maketrain";		
	}
	
	@RequestMapping("songlist_load.do")
	public void songlist_load(String id,String no,Model model,HttpServletResponse res){
		int train_no=Integer.parseInt(no);
		List<SonglistVO> list=sdao.songList_Load(train_no,id);
		
		 res.setContentType("text/html;charset=UTF-8"); 
			try{
				 JSONObject jobj = new JSONObject();
				 JSONArray ja = new JSONArray();
				 for(int i=0;i<list.size();i++){
					 ja.add(list.get(i).getSong_title());
				 }
				    res.setContentType("application/json; charset=UTF-8");

				    PrintWriter pw = res.getWriter();
				    pw.print(ja.toJSONString());
				    pw.flush();
					
				}catch(Exception e){System.out.println("검색 결과가 없습니다.");}

	
	}
	@RequestMapping("myartistadd.do")
    public String myartistadd(String id,String song_artist){
       adao.ArtistInsert(id, song_artist);
       return "mytrain/songlist";
    }
	@RequestMapping("artistdelete.do")
    public String artistDelete(String id,String my_artist,Model model){
       adao.ArtistDelete(id, my_artist);
       List<ArtistVO> alist=adao.ArtistAllData(id.trim());
       model.addAttribute("alist",alist);
       return "mytrain/myartist";
    }
	

	@RequestMapping("recommand_Songlist.do")
	public void recommand_Songlist(String id,Model model,HttpServletResponse res){
		try{
			 JSONObject jobj = new JSONObject();
			 JSONArray ja = new JSONArray();
				
			
		List<ArtistVO> list=adao.ArtistAllData(id);
		if(list.size()<5){
			System.out.println("5미만");
			 for(int i=0;i<list.size();i++){
				 for(int j=0;j<3;j++){
					String songtitle=artistSearch(list.get(j).getMy_artist());
//					 ja.add(list.get(i).getMy_artist());
				
					ja.add(songtitle);
				 }

			 }
		}else{
			System.out.println("5개이상");
			
		}
		
		
		 res.setContentType("text/html;charset=UTF-8"); 
		
				    res.setContentType("application/json; charset=UTF-8");

				    PrintWriter pw = res.getWriter();
				    pw.print(ja.toJSONString());
				    pw.flush();
					
				}catch(Exception e){System.out.println("검색 결과가 없습니다.");}

    }
	
	public String artistSearch(String artist_id){
		try{
			String URL = "http://www.melon.com/search/song/index.htm?q=";   //사이트 주소
			String subURL = artist_id; // request로 전달받을 검색어
			subURL =  URLEncoder.encode(subURL, "UTF-8");
			String endURL="&section=artist&searchGnbYn=Y&ipath=srch_form";
			URL = URL + subURL + endURL;    //URL UTF 인코딩
			Document doc = Jsoup.connect(URL).get();     //JSOUP을 이용한 사이트 접속 후 DOM접속
			Elements title_elem = doc.select("a.fc_gray");   //셀럭터를 이용해 검색 후 파싱
			
			if(title_elem.size()>0){
				int f =0;
					 Random random = new Random();
				     while(true){
				    	 f = random.nextInt(title_elem.size());	 
				    	 if(f!=0)break;
				     }
					 				     
				        System.out.println(f);
					 Element title_El=title_elem.get(f);
					 String title = title_El.attr("title");
	/*				 String result = "{\"title\":\""+title+
							 "\",\"artist\":\""+artist+"\"}";*/
					 System.out.println(artist_id+" "+title);
					 if(title!=null){
						 
					 }
					 return artist_id+" "+title;
				 
			}else{

			}
			

			}catch(Exception e){System.out.println("검색 결과가 없습니다.");}
		return artist_id;
		
	}

}
