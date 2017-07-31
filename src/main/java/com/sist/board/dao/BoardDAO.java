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
	         dbc=db.getCollection("sist_board");
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
			DBCursor cursor=dbc.find().sort(new BasicDBObject("no",1).append("no", 1)).skip(skip).limit(rowSize); //해결해야 된다.
			/*
				int rowSize = 10;
				int skip = (page * rowSize) - rowSize;
				DBCursor cursor = dbc.find().sort(new BasicDBObject("group_id", -1).append("group_step", 1)).skip(skip).limit(rowSize);
			// SELECT * FROM board => Order BY group_id DESC,group_step ASC
			// WHERE rownum BETWEEN skip AND limit
			// NOSQL {no:1,name:"",subject:""}, ROW
			// {no:2,name:"",subject:{}}
			*/
			while(cursor.hasNext()){
				BasicDBObject obj = (BasicDBObject) cursor.next();
				BoardVO vo=new BoardVO();
				vo.setNo(obj.getInt("no"));
				vo.setKind(obj.getString("kind"));
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
		query.put("kind", vo.getKind());
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
	
	public boolean boardDelete(int no, String email){
		boolean bCheck=false;
		try{
			BasicDBObject board=new BasicDBObject("no", no);
			BasicDBObject data=(BasicDBObject)dbc.findOne(board);
			String dbEmail=data.getString("email");
			int dbDepth=data.getInt("depth");
			if(dbEmail.equals(email)){
				if(dbDepth==0){
					dbc.remove(board);
				} else {
					dbc.remove(board);
					//댓글을 그냥 지우는데 경고창만, rNO는 결국 no와 같다.
					BasicDBObject rBoard=new BasicDBObject("rNo", no);
					dbc.remove(rBoard);
				}
				bCheck=true;
			} else {
				bCheck=false;
			}
		}catch(Exception e){
			e.printStackTrace();
		}		
		return bCheck;
	}
	//no,email,subject,content,regdate,hit,depth
	//rNo, rEmail,rContent, rRegdate, rLike
	public void rBoardInsert(ReplyBoardVO rvo, int no){
		try{
			BasicDBObject query=new BasicDBObject();
			query.put("rNo", no);
			query.put("rEmail", rvo.getrEmail());
			query.put("rContent", rvo.getrContent());
			query.put("rRegdate", rvo.getrRegdate());
			query.put("rLike", 0);
			dbc.insert(query);
		} catch(Exception e){
			
		}
	}
}
