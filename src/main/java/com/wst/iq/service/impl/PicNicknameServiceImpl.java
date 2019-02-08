package com.wst.iq.service.impl;

import com.wst.iq.mapper.PicNicknameMapper;
import com.wst.iq.pojo.PicNickname;
import com.wst.iq.pojo.PicNickname;
import com.wst.iq.pojo.PicNicknameExample;
import com.wst.iq.pojo.Picture;
import com.wst.iq.service.PicNicknameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PicNicknameServiceImpl implements PicNicknameService {
    @Autowired
    PicNicknameMapper picNicknameMapper;

    @Override
    public PicNickname get(int nid) {
        return picNicknameMapper.selectByPrimaryKey(nid);
    }

    @Override
    public List list(int pid) {
        PicNicknameExample example = new PicNicknameExample();
        example.createCriteria().andPidEqualTo(pid);
        return picNicknameMapper.selectByExample(example);
    }

    @Override
    public void fill(List<Picture> pictures) {
        for (Picture picture: pictures){
            fill(picture);
        }
    }

    @Override
    public void fill(Picture picture) {
        picture.setPicNicknames(list(picture.getPid()));
    }

    @Override
    public void delete(int nid) {
        picNicknameMapper.deleteByPrimaryKey(nid);
    }

    @Override
    public void add(PicNickname nickname) {
        picNicknameMapper.insertSelective(nickname);
    }
}
