package com.sist.artist;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.mongodb.*;

@Repository
public class ArtistDAO {
   private MongoClient mc;
   private DB db;
   private DBCollection dbc;
   public ArtistDAO(){
      try{
         // 몽고디비 연결
         mc=new MongoClient("211.238.142.23:27017");
         // 데이터베이스 일기
         db=mc.getDB("sist"); // use mydb
         // 컬렉션 연결
         dbc=db.getCollection("sist_artist");
      }catch(Exception ex){
         System.out.println(ex.getMessage());
      }
   }
   public void ArtistInsert(String id,String my_artist){
      BasicDBObject where=new BasicDBObject();
      where.put("id", id);
      where.put("my_artist", my_artist);
      dbc.insert(where);
      
   }
   public List<ArtistVO> ArtistAllData(String id){
      List<ArtistVO> list=new ArrayList<ArtistVO>();
      BasicDBObject where=new BasicDBObject();
      where.put("id", id);
      DBCursor cursor=dbc.find(where);
      while(cursor.hasNext()){
         BasicDBObject data=(BasicDBObject)cursor.next();
         ArtistVO vo=new ArtistVO();
         vo.setId(id);
         vo.setMy_artist(data.getString("my_artist"));
         list.add(vo);
      }
      return list;
   }
   public void ArtistDelete(String id,String my_artist){
      BasicDBObject where=new BasicDBObject();
      where.put("id", id.trim());
      where.put("my_artist", my_artist.trim());
      BasicDBObject data=(BasicDBObject)dbc.findOne(where);
      dbc.remove(data);
   }
}