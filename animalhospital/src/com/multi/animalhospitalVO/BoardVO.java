package com.multi.animalhospitalVO;

public class BoardVO {
	String date;
	String title;
	String text;
	public BoardVO(String date, String title, String text) {
		super();
		this.date = date;
		this.title = title;
		this.text = text;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
}
