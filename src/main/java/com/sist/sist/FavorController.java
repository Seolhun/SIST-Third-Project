package com.sist.sist;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sist.emotion.EmotionDAO;
import com.sist.emotion.EmotionVO;
import com.sist.emotion.GenreDAO;
import com.sist.emotion.GenreVO;
import com.sist.r.RecommandDAO;



@Controller
public class FavorController {

	@Autowired
	private EmotionDAO dao;
	@Autowired
	private GenreDAO gdao;
	@Autowired
	private RecommandDAO rdao;
	@RequestMapping("favor_chart.do")
	public String click_update(String emotion,String genre,Model model)
	{
		
		List<EmotionVO> elist=dao.EmotionAllData();
		List<GenreVO> glist=gdao.GenreAllData();

		String evalue="[";
		String gvalue="[";

					for(EmotionVO evo:elist)
					{
					
					   evalue+="{"
		                   +"name: '"+evo.getEmotion()+"',"
		                   +"y: "+evo.getEcount()+","
		                   +"sliced: true,"
		                   +"selected: true"
		                        +"},";
					}
						
					for(GenreVO gvo:glist)
					{
						gvalue+="{"
				                   +"name: '"+gvo.getGenre()+"',"
				                   +"y: "+gvo.getGcount()+","
				                   +"sliced: true,"
				                   +"selected: true"
				                        +"},";
					}
					
			 evalue=evalue.substring(0,evalue.lastIndexOf(','));
			 evalue+="]";
			gvalue=gvalue.substring(0,gvalue.lastIndexOf(','));
			 gvalue+="]";
			 model.addAttribute("evalue", evalue);
			 model.addAttribute("elist", elist);
			 model.addAttribute("gvalue", gvalue);
			 model.addAttribute("glist", glist);
			 
			 
			 // recommand add
			String feel="걸";
			List<String> slist=rdao.recommandRegData();
			model.addAttribute("slist",slist);
			model.addAttribute("feel",feel);
		
		return   "favor/favor_chart";
	}
		 

	
}
