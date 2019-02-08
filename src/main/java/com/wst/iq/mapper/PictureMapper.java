package com.wst.iq.mapper;

import com.wst.iq.pojo.Picture;
import com.wst.iq.pojo.PictureExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PictureMapper {
    int deleteByPrimaryKey(Integer pid);

    int insert(Picture record);

    int insertSelective(Picture record);

    List<Picture> selectByExample(PictureExample example);

    Picture selectByPrimaryKey(Integer pid);

    int updateByPrimaryKeySelective(Picture record);

    int updateByPrimaryKey(Picture record);

    // 非自动生成字段
    List<Picture> selectByKeyword(@Param("keyword")String keyword);
}