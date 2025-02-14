package com.zzc.webshop.po;

public class Cart {
    private Integer cid;

    private Integer uid;

    private Integer gid;

    private Integer number;

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getCid() {
        return cid;
    }

    public Integer getGid() {
        return gid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

}