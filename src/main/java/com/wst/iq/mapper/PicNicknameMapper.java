package com.wst.iq.mapper;

import com.wst.iq.pojo.PicNickname;
import com.wst.iq.pojo.PicNicknameExample;
import java.util.List;

public interface PicNicknameMapper {
    int deleteByPrimaryKey(Integer nid);

    int insert(PicNickname record);

    int insertSelective(PicNickname record);

    List<PicNickname> selectByExample(PicNicknameExample example);

    PicNickname selectByPrimaryKey(Integer nid);

    int updateByPrimaryKeySelective(PicNickname record);

    int updateByPrimaryKey(PicNickname record);
}