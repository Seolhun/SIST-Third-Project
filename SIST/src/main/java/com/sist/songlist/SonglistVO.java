package com.sist.songlist;

public class SonglistVO {
	private String train_id;
	private int train_no;
	private int song_no;
	private String song_title;
	private String song_artist;
	public String getTrain_id() {
		return train_id;
	}
	public void setTrain_id(String train_id) {
		this.train_id = train_id;
	}
	public int getTrain_no() {
		return train_no;
	}
	public void setTrain_no(int train_no) {
		this.train_no = train_no;
	}
	public int getSong_no() {
		return song_no;
	}
	public void setSong_no(int song_no) {
		this.song_no = song_no;
	}
	public String getSong_title() {
		return song_title;
	}
	public void setSong_title(String song_title) {
		this.song_title = song_title;
	}
	public String getSong_artist() {
		return song_artist;
	}
	public void setSong_artist(String song_artist) {
		this.song_artist = song_artist;
	}
	
	
}
