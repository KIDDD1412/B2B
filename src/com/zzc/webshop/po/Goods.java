package com.zzc.webshop.po;

import org.springframework.web.multipart.MultipartFile;

public class Goods {
	private int gid;//商品ID,主键
	private String gname;//商品名
	private double gprice;//商品价格
	private String gintroduction;//商品介绍
	private String gpicture;//商品图片路径
	private int sellerId;//店家ID
	private int sid;//店铺ID
	private int gstatus;//审核状态（待审核、通过、拒绝）
	private int gamount;//店铺ID
	private MultipartFile logoImage;

	public MultipartFile getLogoImage() {
		return logoImage;
	}

	public void setLogoImage(MultipartFile logoImage) {
		this.logoImage = logoImage;
	}

	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public double getGprice() {
		return gprice;
	}
	public void setGprice(double gprice) {
		this.gprice = gprice;
	}
	public String getGintroduction() {
		return gintroduction;
	}
	public void setGintroduction(String gintroduction) {
		this.gintroduction = gintroduction;
	}
	public String getGpicture() {
		return gpicture;
	}
	public void setGpicture(String gpicture) {
		this.gpicture = gpicture;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getGstatus() {
		return gstatus;
	}
	public void setGstatus(int gstatus) {
		this.gstatus = gstatus;
	}

	public int getGamount() {return gamount;}
	public void setGamount(int gamount) {this.gamount = gamount;}
}
