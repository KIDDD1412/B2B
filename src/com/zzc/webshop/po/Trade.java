package com.zzc.webshop.po;

import java.util.Date;

public class Trade {
   private int tid;
   private int in;
   private int out;
   private int oid;
   private Date data;
   private double amount;

	public double getAmount() {
		return amount;
	}

	public Date getData() {
		return data;
	}

	public int getIn() {
		return in;
	}

	public int getOid() {
		return oid;
	}

	public int getOut() {
		return out;
	}

	public int getTid() {
		return tid;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public void setIn(int in) {
		this.in = in;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public void setOut(int out) {
		this.out = out;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

}
