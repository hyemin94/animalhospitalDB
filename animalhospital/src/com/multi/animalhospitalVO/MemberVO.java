package com.multi.animalhospitalVO;

public class MemberVO {
	String name;
	String id;
	String password;
	
	public MemberVO() {
		super();
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "MemberVO [name=" + name + ", id=" + id + ", password=" + password + "]";
	}
}
