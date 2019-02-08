package com.wst.iq.mapper;

import com.wst.iq.pojo.Picture;
import com.wst.iq.pojo.PictureExample;
import java.util.List;

public interface PictureMapper {
    int deleteByPrimaryKey(Integer pid);

    int insert(Picture record);

    int insertSelective(Picture record);

    List<Picture> selectByExample(PictureExample example);

    Picture selectByPrimaryKey(Integer pid);

    int updateByPrimaryKeySelective(Picture record);

    int updateByPrimaryKey(Picture record);
}