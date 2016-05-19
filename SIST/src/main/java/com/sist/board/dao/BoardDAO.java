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
	         mc=new MongoClient("211.238.142.40:27017");
	         // 데이터베이스 일기
	         db=mc.getDB("sist"); // use mydb
	         // 컬렉션 연결
	         dbc=db.getCollection("sist_member");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	public List<BoardVO> boardListData(int page) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			int rowSize = 10;
			int skip = (page * rowSize) - rowSize;
			DBCursor cursor = dbc.find().sort(new BasicDBObject("group_id", -1).append("group_step", 1)).skip(skip)
					.limit(rowSize);
			while (cursor.hasNext()) {
				BasicDBObject obj = (BasicDBObject) cursor.next();
				BoardVO vo = new BoardVO();
				vo.setNo(obj.getInt("no"));
				vo.setSubject(obj.getString("subject"));
				vo.setName(obj.getString("name"));
				vo.setRegdate(obj.getString("regdate"));
				vo.setHit(obj.getInt("hit"));
				vo.setGroup_tab(obj.getInt("group_tab"));
				list.add(vo);
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return list;
	}

	public void boardInsert(BoardVO vo) {

		int no = 0;
		int group_id = 0;
		DBCursor cursor = dbc.find();
		while (cursor.hasNext()) {
			BasicDBObject data = (BasicDBObject) cursor.next();
			int n = data.getInt("no");
			int g = data.getInt("group_id");
			if (no < n)
				no = n;
			if (group_id < g)
				group_id = g;
		}
		cursor.close();
		BasicDBObject query = new BasicDBObject();
		query.put("no", no + 1);
		query.put("name", vo.getName());
		query.put("subject", vo.getSubject());
		query.put("content", vo.getContent());
		query.put("pwd", vo.getPwd());
		query.put("regdate", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		query.put("hit", 0);
		query.put("group_id", group_id + 1);
		query.put("group_step", 0);
		query.put("group_tab", 0);
		query.put("root", 0);
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
}
