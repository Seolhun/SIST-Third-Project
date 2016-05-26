package com.sist.sist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.member.MemberDAO;
import com.sist.member.MemberVO;
import com.sist.songlist.SonglistDAO;
import com.sist.songlist.SonglistVO;
import com.sist.train.*;

import java.util.*;
@Controller
public class MytrainController {
	@Autowired
	private TrainDAO dao;
	@Autowired
	private SonglistDAO sdao;
	@Autowired
	private MemberDAO mdao;
	@RequestMapping("mytrain.do")
	public String mytrain(String id,Model model){
		List<MemberVO> list=mdao.MemberAllData(id);
		model.addAttribute("genrelist",list);
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
}
