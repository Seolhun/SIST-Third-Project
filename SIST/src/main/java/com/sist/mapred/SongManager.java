package com.sist.mapred;

import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Component;
@Component
public class SongManager {
	public String movie_review(String title,int page){
		StringBuffer sb=new StringBuffer();
		try{
			String key="41cb729c29ba4d6d3f797aa183cae694";
			// aa3c541d0ad473d0aee39e6a1888e60b
			// cb496d1538d83e93f5feed8b783a683e
			// 38082e1d6f37eb9864d2c90241bb3128
			//ddcf4460013008172d4b85dea4263c64
            //41cb729c29ba4d6d3f797aa183cae694
            //80411406ba4ab7fc579820a0960441fc
            //8123d2ef182943b3955ba0e0567824b6
            //a68708ccdf2933fd8dc33c16d2339cd5 			
			String query="https://apis.daum.net/search/blog?"
					+"apikey="+key
					+ "&result=20&output=json&pageno="+page
					+"&q="+URLEncoder.encode(title,"UTF-8");
			URL url=new URL(query);
			
			HttpURLConnection conn=(HttpURLConnection)url.openConnection();
			conn.connect();
			if(conn!=null){
				BufferedReader in=new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
				String data="";
				while(true){
					data=in.readLine();
					if(data==null) break;
					sb.append(data+"\n");
				}
			}
			conn.disconnect();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return sb.toString();
	}
	
	

	public void json_parse(String json){
		try{
			JSONParser jc=new JSONParser();
			JSONObject jo=(JSONObject)jc.parse(json);
			JSONObject channel=(JSONObject)jo.get("channel");
			JSONArray item=(JSONArray)channel.get("item");
			String desc="";
			for(int i=0;i<item.size();i++){
				JSONObject obj=(JSONObject)item.get(i);
				String review=(String)obj.get("description");
				//System.out.println(review);
				desc+=review+"\n";
			}
			desc=desc.replaceAll("[A-Za-z0-9]", "");
			desc=desc.replace("&", "");
			desc=desc.replace(".", "");
			desc=desc.replace("#", "");
			desc=desc.replace("?", "");
			desc=desc.replace("/", "");
			desc=desc.replace(";", "");
			desc=desc.replace("(", "");
			desc=desc.replace(")", "");
			desc=desc.replace("[", "");
			desc=desc.replace("]", "");
			//desc=desc.replace("+", "");
			desc=desc.replace("*", "");
			desc=desc.replace(",", "");
			desc=desc.replace("'", "");
			desc=desc.replace("~", "");
			desc=desc.replace(":", "");
			desc=desc.replace("!", "");
			desc=desc.replace("`", "");
			//System.out.println(desc);
			FileWriter fw=new FileWriter("/home/sist/bigdataStudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SIST/desc.txt",true);
			fw.write(desc);
			fw.close();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
}
