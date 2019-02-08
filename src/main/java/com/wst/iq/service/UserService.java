package com.wst.iq.service;

import com.wst.iq.pojo.Picture;
import com.wst.iq.pojo.User;

import java.util.List;

public interface UserService {
    User get(int uid);
    void fill(List<Picture> pictures);
    void fill(Picture picture);
}
