package com.sist.member;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import com.sist.train.TrainVO;
import com.sist.member.MemberVO;
import java.util.*;
@Repository
public class MemberDAO {
	private MongoClient mc;
	private DB db;
	private DBCollection dbc;
	public MemberDAO(){
		try{
			mc=new MongoClient("211.238.142.23:27017");
			db=mc.getDB("sist"); // use mydb
			dbc=db.getCollection("sist_member");
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	public List<MemberVO> MemberAllData(String id){
		List<MemberVO> list=new ArrayList<MemberVO>();
		try{
			BasicDBObject where=new BasicDBObject();
			where.put("id", id);
			DBCursor cursor=dbc.find(where);
			while(cursor.hasNext()){
				BasicDBObject obj=(BasicDBObject)cursor.next();
				MemberVO vo=new MemberVO();
				vo.setId(obj.getString("id"));
				//vo.setEmail(obj.getString("email"));
				vo.setMy_artist(obj.getString("my_artist"));
				vo.setMy_genre(obj.getString("my_genre"));
				list.add(vo);
			}
		}catch(Exception ex){
			System.out.println("trainAllData error:"+ex.getMessage());
		}
		return list;
	}
	
	public boolean CheckMember(String id) {
		boolean bCheck=false;
		try {
			BasicDBObject where = new BasicDBObject();
			where.put("id", id);
			BasicDBObject aObj=(BasicDBObject)dbc.findOne(where);	
			String dbId=aObj.getString("id");
			if(dbId.equals(id)){
				System.out.println("Check Member false");
				bCheck=false;
			}else {
				bCheck=true;
			}
		} catch (Exception e) {
			System.out.println("Check Member : "+e.getMessage());
		}
		return bCheck;
	}
	
	public void MemberInsert(MemberVO vo){
		try{
			BasicDBObject query = new BasicDBObject();
			query.put("id", vo.getId());
			query.put("email", vo.getEmail());
			query.put("my_artist", vo.getMy_artist());
			query.put("my_genre", vo.getMy_genre());
			dbc.insert(query);
		} catch (Exception e){
			System.out.println("Insert Member" + e.getMessage());
		}
	}
	
	public void GenreInsert(String id,String my_genre){
		BasicDBObject where=new BasicDBObject();
		where.put("id",id);
		BasicDBObject data=(BasicDBObject) dbc.findOne(where);
		System.out.println("id:"+id+"my_genre:"+my_genre);
		data.put("my_genre", my_genre);
		dbc.update(where, new BasicDBObject("$set",data)); // $set���ָ� insert�ȴ�
	}
	
}
