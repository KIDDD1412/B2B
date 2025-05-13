package com.zzc.webshop.po;

public class OrderVo {
	private String oid;//订单编号
	private String gid;//商品编号
	private String gamount;//商品数量
	private String gprice;//商品原单价
	private String oprice;//总价
	private String sid;//卖家用户编号
	private String bid;//买家用户编号
	private String contract;//合同存储路径
	private String date;//订单创建或更新日期
	private String oversion;//订单版本号
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getGamount() {
		return gamount;
	}
	public void setGamount(String gamount) {
		this.gamount = gamount;
	}
	public String getGprice() {
		return gprice;
	}
	public void setGprice(String gprice) {
		this.gprice = gprice;
	}
	public String getOprice() {
		return oprice;
	}
	public void setOprice(String oprice) {
		this.oprice = oprice;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getContract() {
		return contract;
	}
	public void setContract(String contract) {
		this.contract = contract;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getOversion() {
		return oversion;
	}
	public void setOversion(String oversion) {
		this.oversion = oversion;
	}
	public OrderVo(String oid, String gid, String gamount, String gprice, String oprice, String sid, String bid,
			String contract, String date, String oversion) {
		super();
		this.oid = oid;
		this.gid = gid;
		this.gamount = gamount;
		this.gprice = gprice;
		this.oprice = oprice;
		this.sid = sid;
		this.bid = bid;
		this.contract = contract;
		this.date = date;
		this.oversion = oversion;
	}
	@Override
	public String toString() {
		return "OrderVo [oid=" + oid + ", gid=" + gid + ", gamount=" + gamount + ", gprice=" + gprice + ", oprice="
				+ oprice + ", sid=" + sid + ", bid=" + bid + ", contract=" + contract + ", date=" + date + ", oversion="
				+ oversion + "]";
	}
	public OrderVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
