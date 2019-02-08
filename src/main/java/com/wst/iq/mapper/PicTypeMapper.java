package com.wst.iq.mapper;

import com.wst.iq.pojo.PicType;
import com.wst.iq.pojo.PicTypeExample;
import java.util.List;

public interface PicTypeMapper {
    int deleteByPrimaryKey(Integer tid);

    int insert(PicType record);

    int insertSelective(PicType record);

    List<PicType> selectByExample(PicTypeExample example);

    PicType selectByPrimaryKey(Integer tid);

    int updateByPrimaryKeySelective(PicType record);

    int updateByPrimaryKey(PicType record);
}