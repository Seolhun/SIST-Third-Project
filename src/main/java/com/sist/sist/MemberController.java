package com.sist.sist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.member.MemberDAO;
import com.sist.member.MemberVO;

@Controller
public class MemberController {
   @Autowired
   private MemberDAO mdao;
   
   @RequestMapping("insertMember.do")
   public String InsertMember(@RequestParam("id") String id, @RequestParam("email") String email) throws Exception{
         
      boolean bCheck=mdao.CheckMember(id);
      if(bCheck){
         MemberVO vo=new MemberVO();
         vo.setEmail(email);
         vo.setId(id);
         vo.setMy_artist(null);
         vo.setMy_genre(null);
         mdao.MemberInsert(vo);         
      }
      return "main";
   }
}