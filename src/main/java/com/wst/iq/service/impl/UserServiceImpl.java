package com.wst.iq.service.impl;

import com.wst.iq.mapper.UserMapper;
import com.wst.iq.pojo.PicComment;
import com.wst.iq.pojo.User;
import com.wst.iq.pojo.Picture;
import com.wst.iq.pojo.UserExample;
import com.wst.iq.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    
    @Override
    public User get(int cid) {
        return userMapper.selectByPrimaryKey(cid);
    }

    @Override
    public void fill(List<Picture> pictures) {
        for (Picture picture: pictures){
            fill(picture);
        }
    }

    @Override
    public void fill(Picture picture){
        picture.setUser(get(picture.getUid()));
    }

    @Override
    public void fill(PicComment picComment) {
        picComment.setUser(get(picComment.getUid()));
    }

    @Override
    public void fillThrow(List<Picture> pictures) {
        for (Picture picture: pictures){
            fill(picture);
            for (PicComment picComment: picture.getPicComments()){
                fill(picComment);
            }
        }
    }

    @Override
    public boolean isExist(String name) {
        UserExample example = new UserExample();
        example.createCriteria().andNameEqualTo(name);
        List<User> result = userMapper.selectByExample(example);
        return !result.isEmpty();
    }

    @Override
    public void add(User user) {
        userMapper.insertSelective(user);
    }

    @Override
    public User get(String name, String password) {
        UserExample example =new UserExample();
        example.createCriteria().andNameEqualTo(name).andPasswordEqualTo(password);
        List<User> result= userMapper.selectByExample(example);
        if(result.isEmpty())
            return null;
        return result.get(0);
    }
}
