package com.sist.board.dao;
// mongodb
//rNo, rEmail,rContent, rRegdate, rLike
public class ReplyBoardVO {
    private int rNo;
    private String rEmail;
    private String rContent;
    private String rRegdate;
    private int rLike;
    
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public String getrEmail() {
		return rEmail;
	}
	public void setrEmail(String rEmail) {
		this.rEmail = rEmail;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getrRegdate() {
		return rRegdate;
	}
	public void setrRegdate(String rRegdate) {
		this.rRegdate = rRegdate;
	}
	public int getrLike() {
		return rLike;
	}
	public void setrLike(int rLike) {
		this.rLike = rLike;
	}
}