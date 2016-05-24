package com.sist.sist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.train.TrainDAO;
import com.sist.train.TrainVO;
import com.sist.genie.manager.*;

@Controller
public class MainController {
	@Autowired
	private TrainDAO dao;
	@Autowired
   private genieManager gm;
	
   @RequestMapping("main.do")
   public String main_list(String id,Model model)
   {
	   	id="admin"; 
		List<TrainVO> list=dao.trainAllData(id);
		model.addAttribute("list",list);
	   return "main";
   }
   //로그인 페이지 이동
   @RequestMapping("login.do")
   public String login(String id,Model model)
   {
	   return "login";
   }
   
   //게시판 페이지 이동
   @RequestMapping("list.do")
   public String boardlist(){
	   return "board/list";
   }
   
   @RequestMapping("insert.do")
   public String obardinsert(){
	   return "board/insert";
   }
   
   @RequestMapping("songChange.do")
   public String songChange()
   {
	   return "tiles/footer";
   }
   
   @RequestMapping("drug_flow.do")
   public String genieAllData(Model model) {
      List<genieVO> list = gm.genieAllData();
      model.addAttribute("list", list);
      System.out.println("����?");
      return "drugflow/drug_flow";
   }
   
   @RequestMapping("drive.do")
   public String drive()
   {
	   return "tiles/body";
   }
}
