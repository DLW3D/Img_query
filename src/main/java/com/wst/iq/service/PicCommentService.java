package com.wst.iq.service;

import com.wst.iq.pojo.PicComment;
import com.wst.iq.pojo.Picture;

import java.util.List;

public interface PicCommentService {
    PicComment get(int cid);
    List list(int pid);
    void fill(List<Picture> pictures);
    void fill(Picture picture);
}
