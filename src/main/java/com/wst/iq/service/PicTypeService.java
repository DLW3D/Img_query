package com.wst.iq.service;

import com.wst.iq.pojo.PicType;
import com.wst.iq.pojo.Picture;

import java.util.List;

public interface PicTypeService {
    PicType get(int tid);
    List list(int pid);
    void fill(List<Picture> pictures);
    void fill(Picture picture);
}
