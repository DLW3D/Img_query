package com.wst.iq.service;

import com.wst.iq.pojo.PicComment;
import com.wst.iq.pojo.Picture;
import com.wst.iq.pojo.User;

import java.util.List;

public interface UserService {
    User get(int uid);
    void fill(List<Picture> pictures);
    void fill(Picture picture);
    void fill(PicComment picComment);
    void fillThrow(List<Picture> pictures);
    boolean isExist(String name);
    void add(User user);
    User get(String name, String password);
}
