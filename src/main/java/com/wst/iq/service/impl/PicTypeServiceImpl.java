package com.wst.iq.service.impl;

import com.wst.iq.mapper.PicTypeMapper;
import com.wst.iq.pojo.PicType;
import com.wst.iq.pojo.PicTypeExample;
import com.wst.iq.pojo.Picture;
import com.wst.iq.service.PicTypeService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class PicTypeServiceImpl implements PicTypeService {
    @Autowired
    PicTypeMapper picTypeMapper;

    @Override
    public PicType get(int cid) {
        return picTypeMapper.selectByPrimaryKey(cid);
    }

    @Override
    public List list(int pid) {
        PicTypeExample example = new PicTypeExample();
        example.createCriteria().andPidEqualTo(pid);
        example.setOrderByClause("comm_time DESC");
        return picTypeMapper.selectByExample(example);
    }

    @Override
    public void fill(List<Picture> pictures) {
        for (Picture picture: pictures){
            fill(picture);
        }
    }

    @Override
    public void fill(Picture picture){
        picture.setPicTypes(list(picture.getPid()));
    }
}
