package com.wst.iq.mapper;

import com.wst.iq.pojo.PicComment;
import com.wst.iq.pojo.PicCommentExample;
import java.util.List;

public interface PicCommentMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(PicComment record);

    int insertSelective(PicComment record);

    List<PicComment> selectByExample(PicCommentExample example);

    PicComment selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(PicComment record);

    int updateByPrimaryKey(PicComment record);
}