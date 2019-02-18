package com.wst.iq.pojo;

import java.util.Date;
import java.util.List;

public class Picture {
    private Integer pid;

    private String name;

    private String url;

    private Integer uid;

    private Date date;

    private Integer used;

    //自定义成员
    private List<PicComment> picComments;
    private List<PicNickname> picNicknames;
    private List<PicType> picTypes;
    private User user;

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getUsed() {
        return used;
    }

    public void setUsed(Integer used) {
        this.used = used;
    }

    public List<PicComment> getPicComments() {
        return picComments;
    }

    public void setPicComments(List<PicComment> picComments) {
        this.picComments = picComments;
    }

    public List<PicNickname> getPicNicknames() {
        return picNicknames;
    }

    public void setPicNicknames(List<PicNickname> picNicknames) {
        this.picNicknames = picNicknames;
    }

    public List<PicType> getPicTypes() {
        return picTypes;
    }

    public void setPicTypes(List<PicType> picTypes) {
        this.picTypes = picTypes;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Picture{" +
                "pid=" + pid +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", uid=" + uid +
                ", date=" + date +
                ", used=" + used +
                ", picComments=" + picComments +
                ", picNicknames=" + picNicknames +
                ", picTypes=" + picTypes +
                ", user=" + user +
                '}';
    }
}