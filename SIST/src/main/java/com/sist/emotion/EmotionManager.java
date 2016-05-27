package com.sist.emotion;


import java.util.*;
import org.springframework.stereotype.Component;



@Component
public class EmotionManager {
      
      public List<EmotionVO> Emotiontitle()
      {
         List<EmotionVO> list=new ArrayList<EmotionVO>();
         try
         {
            String emoti[]={"신나는", "경쾌한","사랑으로","편안한","몽환적","감성적","어두운"};
            int ecount[]={0,0,0,0,0,0,0};
            for(int i=0;i<emoti.length;i++)
            {
               EmotionVO vo=new EmotionVO();
               vo.setEmotion(emoti[i]);
               vo.setEcount(ecount[i]);
               list.add(vo);
            }
         }catch(Exception ex)
         {
            System.out.println("Emotiontitle(): "+ex.getMessage());
         }
         return list;
      }
      
      
      public List<GenreVO> Genretitle()
      {
         List<GenreVO> list=new ArrayList<GenreVO>();
         try
         {
            String genti[]={"힙합", "발라드", "랩/힙합","알앤비/소울","락","일랙트랙","포크","팝"};
         
            
            for(int i=0;i<genti.length;i++)
            {
               GenreVO vo=new GenreVO();
               vo.setGenre(genti[i]);
               list.add(vo);
            }
         }catch(Exception ex)
         {
            System.out.println("Emotiontitle(): "+ex.getMessage());
         }
         return list;
      }
   
}