package com.wst.iq.service.impl;

import com.wst.iq.mapper.PictureMapper;
import com.wst.iq.pojo.Picture;
import com.wst.iq.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PictureServiceImpl implements PictureService {
    @Autowired
    PictureMapper pictureMapper;

    @Override
    public List<Picture> search(String keyword) {
        return pictureMapper.selectByKeyword(keyword);
    }

    @Override
    public Picture get(int pid){
        return pictureMapper.selectByPrimaryKey(pid);
    }

    @Override
    public void add(Picture picture) {
        pictureMapper.insertSelective(picture);
    }
}
