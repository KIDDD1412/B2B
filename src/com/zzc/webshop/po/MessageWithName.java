package com.zzc.webshop.po;

import java.util.Date;

public class MessageWithName {
    private int fromid;
    private String fromname;
    private int toid;
    private String toname;
    private String context;
    private String type;
    private Date time;

    public Date getTime() {
        return time;
    }

    public int getFromid() {
        return fromid;
    }

    public int getToid() {
        return toid;
    }

    public String getContext() {
        return context;
    }

    public String getFromname() {
        return fromname;
    }

    public String getToname() {
        return toname;
    }

    public String getType() {
        return type;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public void setFromid(int fromid) {
        this.fromid = fromid;
    }

    public void setFromname(String fromname) {
        this.fromname = fromname;
    }

    public void setTime(Date mtime) {
        this.time = mtime;
    }

    public void setToid(int toid) {
        this.toid = toid;
    }

    public void setToname(String toname) {
        this.toname = toname;
    }

    public void setType(String type) {
        this.type = type;
    }
}
