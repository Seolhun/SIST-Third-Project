package com.sist.sist;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sist.board.dao.BoardDAO;
import com.sist.board.dao.BoardVO;
@Controller
public class BoardController {
	@Autowired
	private BoardDAO bDao;
	

	}
}
