package com.zzc.webshop.po;
public class Order {
    private int oid;//�������
    private int gid;//��Ʒ���
    private int gamount;//��Ʒ����
    private double gprice;//��Ʒԭ����
    private double oprice;//�ܼ�
    private int sid;//�����û����
    private int bid;//����û����
    private String contract;//��ͬ�洢·��
    private String date;//�����������������
    private int oversion;//�����汾��
    private int Status;//����״̬

    public int getStatus() {
        return Status;
    }

    public void setStatus(int status) {
        Status = status;
    }

    public int getOid() {
        return oid;
    }
    public void setOid(int oid) {
        this.oid = oid;
    }
    public int getGid() {
        return gid;
    }
    public void setGid(int gid) {
        this.gid = gid;
    }
    public int getGamount() {
        return gamount;
    }
    public void setGamount(int gamount) {
        this.gamount = gamount;
    }
    public double getGprice() {
        return gprice;
    }
    public void setGprice(double gprice) {
        this.gprice = gprice;
    }
    public double getOprice() {
        return oprice;
    }
    public void setOprice(double oprice) {
        this.oprice = oprice;
    }
    public int getSid() {
        return sid;
    }
    public void setSid(int sid) {
        this.sid = sid;
    }
    public int getBid() {
        return bid;
    }
    public void setBid(int bid) {
        this.bid = bid;
    }
    public String getContract() {
        return contract;
    }
    public void setContract(String contract) {
        this.contract = contract;
    }
    public int getOversion() {
        return oversion;
    }
    public void setOversion(int oversion) {
        this.oversion = oversion;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    @Override
    public String toString() {
        return "Order [oid=" + oid + ", gid=" + gid + ", gamount=" + gamount + ", gprice=" + gprice + ", oprice="
                + oprice + ", sid=" + sid + ", bid=" + bid + ", contract=" + contract + ", date=" + date + ", oversion="
                + oversion + "]";
    }

}
