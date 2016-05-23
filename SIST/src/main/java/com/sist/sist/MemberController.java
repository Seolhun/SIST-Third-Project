package com.sist.sist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

import com.mongodb.util.JSON;
import com.sist.member.MemberDAO;
import com.sist.member.MemberVO;
import com.sist.songlist.SonglistVO;
import com.sun.research.ws.wadl.Request;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO mdao;
	
	@RequestMapping("insertMember.do")
	public void InsertMember(@RequestParam("id") String id){
		System.out.println("매핑");
		System.out.println(id);
		boolean bCheck=mdao.CheckMember(id);
		if(bCheck){
			mdao.MemberInsert(id);			
		}
	}
}
