package com.sist.sist;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sist.emotion.*;
import com.sist.emotion.emotion.DarkVO;
import com.sist.emotion.emotion.DreamyVO;
import com.sist.emotion.emotion.EmotionListManager;
import com.sist.emotion.emotion.EmotionalVO;
import com.sist.emotion.emotion.InLoveVO;
import com.sist.emotion.emotion.LightVO;
import com.sist.emotion.emotion.PeacefulVO;
import com.sist.emotion.emotion.PlayFulVO;
import com.sist.emotion.genre.PoppVO;
import com.sist.emotion.genre.RockVO;
import com.sist.emotion.genre.GenreListManager;
import com.sist.emotion.genre.ElecVO;
import com.sist.emotion.genre.RapHipVO;
import com.sist.emotion.genre.DanceVO;
import com.sist.emotion.genre.RnBVO;
import com.sist.emotion.genre.BaladVO;
import com.sist.emotion.genre.ForkVO;

@Controller
public class EmotionController {
	@Autowired
	private EmotionManager em;
	
	@Autowired
	private EmotionListManager elm;
	
	@Autowired
	private GenreListManager glm;
	
	
	@RequestMapping("emotion_main.do")
	public String emotion_main(Model model)
	{
		List<EmotionVO> elist=em.Emotiontitle();
		List<GenreVO> glist=em.Genretitle();
		
		List<PlayFulVO> playful=elm.EmoPlayful();
		List<LightVO> light=elm.EmoLight();
		List<InLoveVO> love=elm.EmoInlove();
		List<PeacefulVO> peace=elm.EmoPeaceful();
		List<DreamyVO> dreamy=elm.EmoDreamy();
		List<EmotionalVO> emotional=elm.EmoEmotional();
		List<DarkVO> dark=elm.EmoDark();
		
		List<DanceVO>dance=glm.GenDance();
		List<BaladVO> balad=glm.GenBalad();
		List<RapHipVO> raphip=glm.GenRapHip();
		List<RnBVO> rnb=glm.GenRnB();
		List<RockVO> rock=glm.GenRock();
		List<ElecVO> elec=glm.GenElec();
		List<ForkVO> fork=glm.GenFork();
		List<PoppVO> popp=glm.GenPopp();

		
		
		model.addAttribute("elist", elist);
		model.addAttribute("glist", glist);
		
		model.addAttribute("playful", playful);
		model.addAttribute("light", light);
		model.addAttribute("love", love);
		model.addAttribute("peace", peace);
		model.addAttribute("dreamy", dreamy);
		model.addAttribute("emotional", emotional);
		model.addAttribute("dark", dark);
		
		model.addAttribute("dance", dance);
		model.addAttribute("balad", balad);
		model.addAttribute("raphip", raphip);
		model.addAttribute("rnb", rnb);
		model.addAttribute("rock", rock);
		model.addAttribute("elec", elec);
		model.addAttribute("fork", fork);
		model.addAttribute("popp", popp);

		

		return "drugflow/emotion_main";
	}

}
