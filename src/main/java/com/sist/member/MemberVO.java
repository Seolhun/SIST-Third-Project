package com.sist.member;

public class MemberVO {
	private String id;
	private String email;
	private String my_artist;
	private String my_genre;
	private String nick;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMy_artist() {
		return my_artist;
	}
	public void setMy_artist(String my_artist) {
		this.my_artist = my_artist;
	}
	public String getMy_genre() {
		return my_genre;
	}
	public void setMy_genre(String my_genre) {
		this.my_genre = my_genre;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
}
