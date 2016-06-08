package com.sist.r;

import org.rosuda.REngine.REXP;
import java.util.*;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Component;
@Component
public class MovieRGraph {
	public void rGraph(){
		try{
			RConnection rc=new RConnection();
			rc.voidEval("data<-read.table(\"/home/sist/bigdataStudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/MapReduceWebProject/output/part-r-00000\")");
			rc.voidEval("png(\"/home/sist/bigdataStudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/MapReduceWebProject/movie/feel.png\",width=900,height=400)");
			rc.voidEval("barplot(data$V2,names.arg=data$V1,col=rainbow(15))");
			rc.voidEval("dev.off()");
			rc.close();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	public List<FeelVO> movieFeelData(String singer){
		List<FeelVO> list=new ArrayList<FeelVO>();
		try{
			RConnection rc=new RConnection();
			rc.voidEval("data<-read.table(\"/home/sist/bigdataStudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SIST/output/"+singer+"/part-r-00000\")");
			REXP p=rc.eval("data$V1");
			String[] feel=p.asStrings();
			p=rc.eval("data$V2");
			int[] count=p.asIntegers();
			rc.close();
			/*int max=0;
			for(int i=0;i<count.length;i++){
				if(max<count[i])
					max=count[i];
			}*/
			for(int i=0;i<count.length;i++){
				
					FeelVO vo=new FeelVO();
					vo.setFeeling(feel[i]);
					vo.setCount(count[i]);
					list.add(vo);
				
			}
		}catch(Exception ex){
			System.out.println("R++++ "+ex.getMessage());
		}
		return list;
	}
}
