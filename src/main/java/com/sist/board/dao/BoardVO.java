package com.sist.board.dao;
// mongodb
public class BoardVO {
	//no,email,subject,content,regdate,hit,depth
    private int no;
    private String email;
    private String subject;
    private String content;
    private String regdate;
    private int hit;
    private int depth; //답글 수
    private String kind;
    private ReplyBoardVO rvo;

    
    
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public ReplyBoardVO getRvo() {
		return rvo;
	}
	public void setRvo(ReplyBoardVO rvo) {
		this.rvo = rvo;
	}
	public ReplyBoardVO getrVO() {
		return rvo;
	}
	public void setrVO(ReplyBoardVO rVO) {
		this.rvo = rVO;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
    
    
    
    
}