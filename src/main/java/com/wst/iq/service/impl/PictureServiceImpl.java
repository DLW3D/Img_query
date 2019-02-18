package com.wst.iq.service.impl;

import com.wst.iq.mapper.PictureMapper;
import com.wst.iq.pojo.Picture;
import com.wst.iq.pojo.PictureExample;
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
        if (isExist(picture.getName())){
            picture.setPid(-1);
        }else{
            pictureMapper.insertSelective(picture);
        }
    }

    @Override
    public boolean isExist(String name){
        PictureExample pictureExample = new PictureExample();
        pictureExample.createCriteria().andNameEqualTo(name);
        List result = pictureMapper.selectByExample(pictureExample);
        return !result.isEmpty();
    }
}
