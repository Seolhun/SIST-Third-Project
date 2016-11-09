package com.sist.emotion;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;

@Repository
public class GenreDAO {
	private MongoClient mcg;
	private DB dbg;
	 private DBCollection dbcg;
	 
	 public GenreDAO()
	 {
		 try
		 {
			 mcg=new MongoClient("211.238.142.23:27017");
			 dbg=mcg.getDB("sist");
			 dbcg=dbg.getCollection("genre");
		 }catch(Exception ex)
		 {
			 System.out.println(ex.getMessage());
		 }
	 }
	 
	 


	public GenreVO GenreClickData(String  genre)
	{
		GenreVO vo=new GenreVO();
		try
		{
			BasicDBObject where=new BasicDBObject();
			where.put("genre",genre);
			
			BasicDBObject data1=(BasicDBObject)dbcg.findOne(where);
			int gcount=data1.getInt("gcount");
			System.out.println("gcount(): "+gcount);
			BasicDBObject up=new BasicDBObject();
			up.put("gcount", gcount+1);
			dbcg.update(where, new BasicDBObject("$set",up));
			
			BasicDBObject data=(BasicDBObject)dbcg.findOne(where);
			vo.setGenre(data.getString("genre"));
			vo.setGcount(data.getInt("gcount"));
		}catch(Exception ex)
		{
			System.out.println("GenreClickData(): "+ex.getMessage());
		}
		return vo;
	}
	
	
	
	
     public List<GenreVO> GenreAllData()
	{
		List<GenreVO> list=new ArrayList<GenreVO>();
		try
		{
			DBCursor cursor=dbcg.find();
			while(cursor.hasNext())
			{
				BasicDBObject obj=(BasicDBObject)cursor.next();
				GenreVO vo=new GenreVO();
					vo.setGenre(obj.getString("genre"));
					vo.setGcount(obj.getInt("gcount"));
					list.add(vo);
			}
		}catch(Exception ex)
		{
			System.out.println("GenreAllData(): "+ex.getMessage());
		}
		return list;
	}
	
}
