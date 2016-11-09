package com.sist.r;

import java.util.*;

import org.springframework.stereotype.Repository;

import com.mongodb.*;
@Repository
public class RecommandDAO {
	private MongoClient mc;
	private DB db;
	private DBCollection dbc;
	public RecommandDAO(){
		try{
			mc=new MongoClient("211.238.142.23:27017");
			db=mc.getDB("sist");
			dbc=db.getCollection("recommand");
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	public void recommandInsert(RecommandVO vo){
		try{
			int max=0;
			DBCursor cursor=dbc.find();
			boolean bCheck=false;
			while(cursor.hasNext()){
				BasicDBObject obj=(BasicDBObject)cursor.next();
				int no=obj.getInt("no");
				if(max<no)
					max=no;
			}
			cursor.close();
			cursor=dbc.find();
			while(cursor.hasNext()){
				BasicDBObject obj=(BasicDBObject)cursor.next();
				String title=obj.getString("title");
				String feel=obj.getString("feel");
				if(title.equals(vo.getTitle()) && feel.equals(vo.getFeel())){
					bCheck=true;
					break;
				}
			}
			BasicDBObject in=new BasicDBObject();
			in.put("no",max+1);
			in.put("title", vo.getTitle());
			in.put("feel", vo.getFeel());
			in.put("count", vo.getCount());
			
			BasicDBObject where=new BasicDBObject();
			where.put("title", vo.getTitle());
	
			
			if(bCheck==true){
				BasicDBObject data=(BasicDBObject)dbc.findOne(where);
				BasicDBObject up=new BasicDBObject();
				up.put("no", data.getInt("no"));
				up.put("title", data.getString("title"));
				up.put("feel", vo.getFeel());
				up.put("count", vo.getCount());
				dbc.update(where, new BasicDBObject("$set",up));
			}else{
				dbc.insert(in);
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	public List<String> recommandRegData(){
		List<String> list=new ArrayList<String>();
		try{
			list=dbc.distinct("feel");
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return list;
	}
	public List<RecommandVO> recommandAllData(){
		List<RecommandVO> list=new ArrayList<RecommandVO>();
		try{
			DBCursor cursor=dbc.find();
			while(cursor.hasNext()){
				BasicDBObject obj=(BasicDBObject)cursor.next();
				RecommandVO vo=new RecommandVO();
				vo.setNo(obj.getInt("no"));
				vo.setTitle(obj.getString("title"));
				vo.setFeel(obj.getString("feel"));
				vo.setCount(obj.getInt("count"));
				list.add(vo);
			}
			cursor.close();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return list;
	}
	public List<RecommandVO> recommandData(String feel){
		List<RecommandVO> list=new ArrayList<RecommandVO>();
		try{
			DBCursor cursor=dbc.find();
			while(cursor.hasNext()){
				BasicDBObject obj=(BasicDBObject)cursor.next();
				if(feel.equals(obj.getString("feel"))){
					RecommandVO vo=new RecommandVO();
					vo.setNo(obj.getInt("no"));
					vo.setTitle(obj.getString("title"));
					vo.setFeel(obj.getString("feel"));
					vo.setCount(obj.getInt("count"));
					list.add(vo);
				}
			}
			cursor.close();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return list;
	}
	public List<String> recommandTitle(String feel){
		List<String> list=new ArrayList<String>();
		try{
			BasicDBObject where=new BasicDBObject();
			where.put("feel", feel);
			// where feel=''
			list=dbc.distinct("title",where);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return list;
	}
	public List<RecommandVO> recommandFellData(String feel){
		List<RecommandVO> list=new ArrayList<RecommandVO>();
		try{
			BasicDBObject where=new BasicDBObject();
			where.put("feel", feel);
			DBCursor cursor=dbc.find(where);
			while(cursor.hasNext()){
				BasicDBObject obj=(BasicDBObject)cursor.next();
				RecommandVO vo=new RecommandVO();
				vo.setTitle(obj.getString("title"));
				vo.setCount(obj.getInt("count"));
				list.add(vo);
			}
			cursor.close();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return list;
	}
}
