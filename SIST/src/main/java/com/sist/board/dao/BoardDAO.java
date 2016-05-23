package com.sist.board.dao;

import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.stereotype.Repository;

import com.mongodb.*;

@Repository
public class BoardDAO {
	private MongoClient mc; // Connection
	private DB db; // ORCL(DataBase)
	private DBCollection dbc; // Table
	
	public BoardDAO() {
		try {
	         // 몽고디비 연결
	         mc=new MongoClient("211.238.142.23:27017");
	         // 데이터베이스 일기
	         db=mc.getDB("sist"); // use mydb
	         // 컬렉션 연결
	         dbc=db.getCollection("sist_member");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
	
	//no,email,subject,content,regdate,hit,depth
	public List<BoardVO> boardAllData(int page){
		List<BoardVO> list=new ArrayList<BoardVO>();
		try{
			int rowSize=10;
			int skip = (page*rowSize)-rowSize;
			DBCursor cursor=dbc.find().sort(new BasicDBObject("no",-1).append("no", 1)).skip(skip).limit(rowSize); //해결해야 된다.
			while(cursor.hasNext()){
				BasicDBObject obj = (BasicDBObject) cursor.next();
				BoardVO vo=new BoardVO();
				vo.setNo(obj.getInt("no"));
				vo.setEmail(obj.getString("email"));
				vo.setSubject(obj.getString("subject"));
				vo.setContent(obj.getString("content"));
				vo.setRegdate(obj.getString("regdate"));
				vo.setHit(obj.getInt("hit"));
				list.add(vo);
			}
			cursor.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	//no,email,subject,content,regdate,hit,depth
	public void boardInsert(BoardVO vo) {
		int no = 0;
		DBCursor cursor = dbc.find();
		while (cursor.hasNext()) {
			BasicDBObject data = (BasicDBObject) cursor.next();
			int n = data.getInt("no"); //cursor의 의미는 무엇인가??
			if (no < n)
				no = n;
		}
		cursor.close();
		BasicDBObject query = new BasicDBObject();
		query.put("no", no + 1);
		query.put("email", vo.getEmail());
		query.put("subject", vo.getSubject());
		query.put("content", vo.getContent());
		query.put("regdate", new SimpleDateFormat("yyyy-MM-dd, hh:mm:ss a").format(new Date()));
		query.put("hit", 0);
		query.put("depth", 0);
		// {name:"",}
		dbc.insert(query);
	}

	public int boardTotalPage() {
		int total = 0;
		DBCursor cursor = dbc.find();
		int count = cursor.count();
		total = (int) (Math.ceil(count / 10.0));
		return total;
	}
	
	public void boardDelete(String email){
		boolean bCheck=false;
	}
}
