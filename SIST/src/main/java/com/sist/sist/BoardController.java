package com.sist.sist;
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
			@RequestParam("kind") int kind,
			@RequestParam("email") int email,
			@RequestParam("subject") int subject,
			@RequestParam("content") int content,
			@RequestParam("regdate") int regdate,
			@RequestParam("hit") int hit,
			@RequestParam("depth") int depth){
		
		BoardVO vo=new BoardVO();
		bDao.boardInsert(vo);
		return "board/list";
	}
	
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(BoardVO vo){
		
		return "board/list";
	}
	
	

}
