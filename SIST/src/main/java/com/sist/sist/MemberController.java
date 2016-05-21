package com.sist.sist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;
import com.sist.member.MemberDAO;
import com.sist.member.MemberVO;
import com.sist.songlist.SonglistVO;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO mdao;
	
	@RequestMapping("insertMember")
	public void InsertMember(MemberVO vo){
		mdao.MemberInsert(vo);
	}
	
	
}
