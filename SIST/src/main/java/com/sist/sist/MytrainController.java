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
	public String mytrain(String id, Model model) {
		List<MemberVO> list = mdao.MemberAllData(id);
		model.addAttribute("genrelist", list);
		return "mytrain/mytrain";
	}

	@RequestMapping("mytrainlist.do")
	public String mytrainlist(String id, Model model) {
		List<TrainVO> list = dao.trainAllData(id);
		model.addAttribute("list", list);
		return "mytrain/maketrain";
	}

	@RequestMapping("maketrain.do")
	public String maketrain(String id, String name, Model model) {
		dao.trainInsert(id, name);
		System.out.println("id:" + id + "  train_name" + name);
		List<TrainVO> list = dao.trainAllData(id);
		model.addAttribute("list", list);
		return "mytrain/maketrain";
	}

	@RequestMapping("deletetrain.do")
	public String deletetrain(String train_no, String id, Model model) {
		int no = Integer.parseInt(train_no);
		System.out.println("train_no:" + no + "  id:" + id);
		dao.trainDelete(no, id.trim());
		List<TrainVO> list = dao.trainAllData(id.trim());
		model.addAttribute("list", list);
		return "mytrain/maketrain";
	}

	@RequestMapping("songlist.do")
	public String songlist(String id, int no, Model model) {
		List<SonglistVO> list = sdao.songListAllData(no, id);
		model.addAttribute("list", list);
		return "mytrain/songlist";
	}

	@RequestMapping("addtrain.do")
	public String addtrain(String id, Model model) {
		List<TrainVO> list = dao.trainAllData(id.trim());
		model.addAttribute("list", list);
		return "mytrain/footeraddtrain";

	}

	@RequestMapping("genreadd.do")
	public String genreadd(String id, String my_genre, Model model) {
		mdao.GenreInsert(id, my_genre);
		List<MemberVO> list = mdao.MemberAllData(id.trim());
		model.addAttribute("genrelist", list);
		return "mytrain/addgenre";
	}
}
