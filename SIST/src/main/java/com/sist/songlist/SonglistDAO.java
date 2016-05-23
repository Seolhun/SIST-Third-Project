package com.sist.songlist;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;

@Repository
public class SonglistDAO {
	private MongoClient mc;
	private DB db;
	private DBCollection dbc;
	public SonglistDAO(){
		try{
			// 몽고디비 연결
			mc=new MongoClient("211.238.142.23:27017");
			// 데이터베이스 일기
			db=mc.getDB("sist"); // use mydb
			// 컬렉션 연결
			dbc=db.getCollection("sist_songlist");
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	public List<SonglistVO> songListAllData(int no,String id){
		
		List<SonglistVO> list=new ArrayList<SonglistVO>();
		try{
			BasicDBObject where=new BasicDBObject();
			where.put("train_id", id);
			where.put("train_no", no);
			DBCursor cursor=dbc.find(where);
			while(cursor.hasNext()){
				BasicDBObject obj=(BasicDBObject)cursor.next();
				SonglistVO vo=new SonglistVO();
				vo.setTrain_id(id);
				vo.setTrain_no(no);
				vo.setSong_title(obj.getString("song_title"));
				vo.setSong_no(1);
				vo.setSong_artist(obj.getString("song_artist"));
				list.add(vo);
			}
		}catch(Exception ex){
			System.out.println("songListAllData error:"+ex.getMessage());
		}
		return list;
	}
}
