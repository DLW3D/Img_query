package com.wst.iq.service.impl;

import com.wst.iq.mapper.PicCommentMapper;
import com.wst.iq.pojo.PicComment;
import com.wst.iq.pojo.PicCommentExample;
import com.wst.iq.pojo.Picture;
import com.wst.iq.service.PicCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PicCommentServiceImpl implements PicCommentService {
    @Autowired
    PicCommentMapper picCommentMapper;

    @Override
    public PicComment get(int cid) {
        return picCommentMapper.selectByPrimaryKey(cid);
    }

    @Override
    public List list(int pid) {
        PicCommentExample example = new PicCommentExample();
        example.createCriteria().andPidEqualTo(pid);
        example.setOrderByClause("comm_time DESC");
        return picCommentMapper.selectByExample(example);
    }

    @Override
    public void fill(List<Picture> pictures) {
        for (Picture picture: pictures){
            fill(picture);
        }
    }

    @Override
    public void fill(Picture picture){
        picture.setPicComments(list(picture.getPid()));
    }
}
