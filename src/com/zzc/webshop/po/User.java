package com.zzc.webshop.po;

public class User {
	private Integer uid;
	private String uname;
	private String upassword;
	private String uidcard;
	private double ubalance;
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getUidcard() {
		return uidcard;
	}
	public void setUidcard(String uidcard) {
		this.uidcard = uidcard;
	}

	public double getUbalance() {
		return ubalance;
	}

	public void setUbalance(double ubalance) {
		this.ubalance = ubalance;
	}
}

