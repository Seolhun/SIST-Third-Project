package com.sist.sist;
import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.board.dao.BoardDAO;
import com.sist.board.dao.BoardVO;
@Controller
public class BoardController {
	@Autowired
	private BoardDAO bDao;
	
	//no,kind,email,subject,content,regdate,hit,depth
	//rNo, rEmail,rContent, rRegdate, rLike
	@RequestMapping("insertBoard.do")
	public String insertBoard(@RequestParam("no") int no,
			@RequestParam("kind") String kind,
			@RequestParam("email") String email,
			@RequestParam("subject") String subject,
			@RequestParam("content") String content
			){
		BoardVO vo=new BoardVO();
		vo.setNo(no);
		vo.setKind(kind);
		vo.setEmail(email);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setRegdate(new SimpleDateFormat("yyyy-MM-dd, hh:mm:ss a").format(new Date()));
		vo.setHit(0);
		vo.setDepth(0);
		bDao.boardInsert(vo);
		return "board/list";
	}
	
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(BoardVO vo){
		
		return "board/list";
	}
	
	

}
