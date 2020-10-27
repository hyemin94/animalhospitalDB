package com.multi.animalhospitalVO;

public class Medical {
	int seq;
	String name;
	String nameAddress;
	String seg;
	String statusCode;
	String statusName;
	String tel;
	String X;
	String Y;
	public Medical(int seq, String name, String nameAddress, String seg, String statusCode, String statusName,
			String tel, String x, String y) {
		super();
		this.seq = seq;
		this.name = name;
		this.nameAddress = nameAddress;
		this.seg = seg;
		this.statusCode = statusCode;
		this.statusName = statusName;
		this.tel = tel;
		X = x;
		Y = y;
	}
	public Medical() {
		super();
	}

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNameAddress() {
		return nameAddress;
	}
	public void setNameAddress(String nameAddress) {
		this.nameAddress = nameAddress;
	}
	public String getSeg() {
		return seg;
	}
	public void setSeg(String seg) {
		this.seg = seg;
	}
	public String getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getX() {
		return X;
	}
	public void setX(String x) {
		X = x;
	}
	public String getY() {
		return Y;
	}
	public void setY(String y) {
		Y = y;
	}
}
