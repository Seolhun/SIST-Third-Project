package com.sist.train;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import com.sist.songlist.SonglistVO;
@Repository
public class TrainDAO {
	private MongoClient mc;
	private DB db;
	private DBCollection dbc;
	public TrainDAO(){
		try{
			// 몽고디비 연결
			mc=new MongoClient("211.238.142.23:27017");
			// 데이터베이스 일기
			db=mc.getDB("sist"); // use mydb
			// 컬렉션 연결
			dbc=db.getCollection("sist_train");
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	
	public List<TrainVO> trainAllData(String id){
		List<TrainVO> list=new ArrayList<TrainVO>();
		try{
			BasicDBObject where=new BasicDBObject();
			where.put("id", id);
			DBCursor cursor=dbc.find(where);
			while(cursor.hasNext()){
				BasicDBObject obj=(BasicDBObject)cursor.next();
				TrainVO vo=new TrainVO();
				vo.setId(obj.getString("id"));
				vo.setTrain_no(obj.getInt("train_no"));
				vo.setTrain_id(obj.getString("train_id"));
				vo.setTrain_name(obj.getString("train_name"));
				vo.setLike(obj.getInt("like"));
				list.add(vo);
			}
		}catch(Exception ex){
			System.out.println("trainAllData error:"+ex.getMessage());
		}
		return list;
	}
	
	public void trainInsert(String id,String name){
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

	
	public void trainDelete(int no,String id){
		try{
			System.out.println("no:"+no+" id:"+id);
			BasicDBObject where=new BasicDBObject();
			where.put("id", id);
			where.put("train_no", no);
			BasicDBObject data=(BasicDBObject)dbc.findOne(where);
			
			dbc.remove(data);
		}catch(Exception ex){
			System.out.println("trainDelete error: "+ex.getMessage());
		}
	}
}
