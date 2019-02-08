package com.wst.iq.service;

import com.wst.iq.pojo.PicNickname;
import com.wst.iq.pojo.Picture;

import java.util.List;

public interface PicNicknameService {
    PicNickname get(int nid);
    List list(int pid);
    void fill(List<Picture> pictures);
    void fill(Picture picture);
}
