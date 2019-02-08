package com.wst.iq.pojo;

import java.util.Date;

public class PicComment {
    private Integer cid;

    private Integer pid;

    private Integer attitude;

    private Integer uid;

    private String comment;

    private Date comm_time;

    //自定义属性
    private User user;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getAttitude() {
        return attitude;
    }

    public void setAttitude(Integer attitude) {
        this.attitude = attitude;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    public Date getComm_time() {
        return comm_time;
    }

    public void setComm_time(Date comm_time) {
        this.comm_time = comm_time;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "PicComment{" +
                "cid=" + cid +
                ", pid=" + pid +
                ", attitude=" + attitude +
                ", uid=" + uid +
                ", comment='" + comment + '\'' +
                ", comm_time=" + comm_time +
                '}';
    }
}