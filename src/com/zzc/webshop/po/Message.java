package com.zzc.webshop.po;

import java.util.Date;

public class Message {
    private Integer fromid;

    private Integer toid;

    private String context;

    private String type;
    
    private Date time;

    public Integer getFromid() {
        return fromid;
    }

    public void setFromid(Integer fromid) {
//        this.fromid = fromid == null ? null : Integer.valueOf(fromid.trim());
        this.fromid = fromid;
    }

    public Integer getToid() {
        return toid;
    }

    public void setToid(Integer toid) {
//        this.toid = toid == null ? null : toid.trim();
        this.toid = toid;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context == null ? null : context.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
}