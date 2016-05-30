package com.sist.member;

import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import com.sist.train.TrainVO;

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
				vo.setNick(obj.getString("nick"));
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
			bCheck=true;
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
			query.put("nick", vo.getId());  // add nick
			dbc.insert(query);
			System.out.println("�븘�씠�뵒 �엯�젰");

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

		dbc.update(where, new BasicDBObject("$set",data)); // $set占쏙옙占쌍몌옙 insert占싫댐옙
	}
	public void nickChange(String id,String nick){
		BasicDBObject where=new BasicDBObject();
		where.put("id", id.trim());
		BasicDBObject data=(BasicDBObject)dbc.findOne(where);
		data.put("nick", nick.trim());
		dbc.update(where, new BasicDBObject("$set",data));
	}
	
}
