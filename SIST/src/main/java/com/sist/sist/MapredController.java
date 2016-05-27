package com.sist.sist;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.chart.genie.genieManager;
import com.sist.chart.genie.genieVO;
import com.sist.mapred.MovieDriver;
import com.sist.mapred.SongManager;
import com.sist.r.*;



@Controller
public class MapredController {
	@Autowired
	private SongManager smg;
	@Autowired 
	private MovieDriver md;
	@Autowired 
	private MovieRGraph mr;
	@Autowired 
	private RecommandDAO rdao;
	@RequestMapping("mapred.do")
	public String movie_detail(){
		File file=new File("/home/sist/bigdataStudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SIST/desc.txt");
		if(file.exists()){
			file.delete();
		}
		genieManager gm=new genieManager();
		List<genieVO> list=gm.genieAllData();
		for(genieVO vo:list){
			//String singer=vo.getArtists();
			/*for(int i=1;i<=3;i++){
				String json=smg.movie_review(singer, i);
				smg.json_parse(json);
			}
			md.movieMapReduce(singer);
			File file2=new File("/home/sist/bigdataStudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SIST/desc.txt");
			if(file2.exists()){
				file2.delete();
			}*/
			
			}
		
	String singer="AOA";
	List<FeelVO> list2=mr.movieFeelData(singer);
	for(FeelVO fvo:list2){
		RecommandVO rvo=new RecommandVO();
		rvo.setTitle(singer);
		rvo.setFeel(fvo.getFeeling());
		rvo.setCount(fvo.getCount());
		rdao.recommandInsert(rvo);
	}	
		//mr.rGraph();
		// 저장 (R)
		
		
		
		return "main";
	}
	@RequestMapping("recommand.do")
	public String movie_recommand(String feel,Model model){
		System.out.println("feel:"+feel);
		if(feel==null){
			feel="걸";
		}
		List<RecommandVO> list=rdao.recommandAllData();
		/*RecommandVO rvo=new RecommandVO();
		for(RecommandVO vo:list){
			if(feel.equals(vo.getFeel())){
				rvo=vo;
				break;
			}*/
		
		
		//List<String> flist=rdao.recommandTitle(feel);
		
		/*List<RecommandVO> rlist=rdao.recommandFellData(feel);
		String data="[";
		for(RecommandVO rv:rlist){
			data+="['"+rv.getTitle()+"',"+rv.getCount()+"],";
		}
		data=data.substring(0,data.lastIndexOf(","));
		data+="]";*/
		//List<String> slist=rdao.recommandRegData();
		//model.addAttribute("flist", flist);
		//model.addAttribute("slist",slist);
		//MovieDTO d=mgr.movieDetail2(rvo.getTitle());
		model.addAttribute("rlist",list);
		model.addAttribute("feel",feel);
		
		//model.addAttribute("title",rvo.getTitle());
		return "mytrain/recommand";
	}
}
