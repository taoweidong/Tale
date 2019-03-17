package com.ajr.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ajr.webapp.modal.Vo.AttachVo;
import com.ajr.webapp.modal.Vo.AttachVoExample;

@Mapper
public interface AttachVoMapper {
	long countByExample(AttachVoExample example);

	int deleteByExample(AttachVoExample example);

	int deleteByPrimaryKey(Integer id);

	int insert(AttachVo record);

	int insertSelective(AttachVo record);

	List<AttachVo> selectByExample(AttachVoExample example);

	AttachVo selectByPrimaryKey(Integer id);

	int updateByExampleSelective(@Param("record") AttachVo record,
			@Param("example") AttachVoExample example);

	int updateByExample(@Param("record") AttachVo record,
			@Param("example") AttachVoExample example);

	int updateByPrimaryKeySelective(AttachVo record);

	int updateByPrimaryKey(AttachVo record);
}