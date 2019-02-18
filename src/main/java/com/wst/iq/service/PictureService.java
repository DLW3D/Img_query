package com.wst.iq.service;

import com.wst.iq.pojo.Picture;

import java.util.List;

public interface PictureService {

    List<Picture> search(String keyword);

    Picture get(int pid);

    void add(Picture picture);

    boolean isExist(String name);
}
