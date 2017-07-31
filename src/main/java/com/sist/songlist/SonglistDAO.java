package com.sist.songlist;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.mongodb.*;
import com.sun.swing.internal.plaf.basic.resources.basic;

@Repository
public class SonglistDAO {
	private MongoClient mc;
	private DB db;
	private DBCollection dbc;
	public SonglistDAO(){
		try{
			// 占쏙옙占쏙옙占� 占쏙옙占쏙옙
			mc=new MongoClient("211.238.142.23:27017");
			// 占쏙옙占쏙옙占싶븝옙占싱쏙옙 占싹깍옙
			db=mc.getDB("sist"); // use mydb
			// 占시뤄옙占쏙옙 占쏙옙占쏙옙
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
			System.out.println("id:"+id+" 트占쏙옙占싸넘뱄옙:"+no);
			DBCursor cursor=dbc.find(where);
			while(cursor.hasNext()){
				BasicDBObject obj=(BasicDBObject)cursor.next();
				SonglistVO vo=new SonglistVO();
				vo.setTrain_id(id);
				vo.setTrain_no(no);
				vo.setSong_title(obj.getString("song_title"));
				vo.setSong_no(obj.getInt("song_no"));
				vo.setSong_artist(obj.getString("song_artist"));
				list.add(vo);
			}
		}catch(Exception ex){
			System.out.println("songListAllData error:"+ex.getMessage());
		}
		return list;
	}
	/*
	 * public void trainInsert(String id,String name){
		int train_no =0;
		BasicDBObject where=new BasicDBObject();
		where.put("id", id);
		DBCursor cursor=dbc.find(where);
		while(cursor.hasNext()){
			BasicDBObject data=(BasicDBObject)cursor.next();
			int n=data.getInt("train_no");
			if(train_no<n){
				train_no=n;
			}
		}
		cursor.close();
		BasicDBObject query=new BasicDBObject();
		query.put("id", id);
		query.put("train_no", train_no+1);
		query.put("train_id", id);
		query.put("train_name", name);
		query.put("like", 0);
		dbc.insert(query);
	}
	 */
	public void songlistInsert(int no,String id,String song_title,String song_artist){
		BasicDBObject where=new BasicDBObject();
		where.put("train_id", id);
		where.put("train_no", no);
		DBCursor cursor=dbc.find(where);
		int song_no=1;
		boolean bCheck=false;
		while(cursor.hasNext()){
			BasicDBObject data=(BasicDBObject)cursor.next();
			int n=data.getInt("song_no");
			if(song_no<n){
				song_no=n;
			}
			String title=data.getString("song_title");
			if(song_title.equals(title)){
				bCheck=true;
				break;
			}
		}
		
		cursor.close();
		System.out.println("no:"+no+" song_title: "+song_title+" song_artist:"+song_artist);
		if(bCheck==false){
			BasicDBObject query=new BasicDBObject();
			query.put("train_id", id);
			query.put("train_no", no);
			query.put("song_title", song_title);
			query.put("song_artist", song_artist);
			query.put("song_no", song_no+1);
			dbc.insert(query);
		}
	}
	public void createSongList(int train_no,String id){
		BasicDBObject where=new BasicDBObject();
		where.put("train_id",id);
		where.put("train_no", train_no);
		where.put("song_title", "리스트 추가 후 삭제 하세요");
		where.put("song_artist", "가수없음");
		where.put("song_no", 1);
		dbc.insert(where);
	}
	public void songDelete(int train_no,String id,int song_no){
		try{
			BasicDBObject where=new BasicDBObject();
			where.put("train_id", id);
			where.put("train_no", train_no);
			where.put("song_no", song_no);
			BasicDBObject data=(BasicDBObject)dbc.findOne(where);
			
			dbc.remove(data);
		}catch(Exception ex){
			System.out.println("songDelete error: "+ex.getMessage());
		}
	}
	public void songlistDelete(int train_no,String id){
		try{
			BasicDBObject where=new BasicDBObject();
			where.put("train_no", train_no);
			where.put("train_id", id);
			DBCursor cursor=dbc.find(where);
			
			while(cursor.hasNext()){
				BasicDBObject data=(BasicDBObject)cursor.next();
				dbc.remove(data);
			}
		}catch(Exception ex){
			System.out.println("songlistDelete error: "+ex.getMessage());
		}
	}
	
	public List<SonglistVO> songList_Load(int no,String id){
		
		List<SonglistVO> list=new ArrayList<SonglistVO>();
		try{
			BasicDBObject where=new BasicDBObject();
			where.put("train_id", id);
			where.put("train_no", no);
			DBCursor cursor=dbc.find(where);
			while(cursor.hasNext()){
				BasicDBObject obj=(BasicDBObject)cursor.next();
				SonglistVO vo=new SonglistVO();
				vo.setSong_title(obj.getString("song_title"));
				vo.setSong_artist(obj.getString("song_artist"));
				list.add(vo);
			}
		}catch(Exception ex){
			System.out.println("songListAllData error:"+ex.getMessage());
		}
		return list;
	}
}
