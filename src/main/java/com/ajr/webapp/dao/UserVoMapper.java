package com.ajr.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ajr.webapp.modal.Vo.UserVo;
import com.ajr.webapp.modal.Vo.UserVoExample;

@Mapper
public interface UserVoMapper {
	long countByExample(UserVoExample example);

	int deleteByExample(UserVoExample example);

	int deleteByPrimaryKey(Integer uid);

	int insert(UserVo record);

	int insertSelective(UserVo record);

	List<UserVo> selectByExample(UserVoExample example);

	UserVo selectByPrimaryKey(Integer uid);

	int updateByExampleSelective(@Param("record") UserVo record,
			@Param("example") UserVoExample example);

	int updateByExample(@Param("record") UserVo record, @Param("example") UserVoExample example);

	int updateByPrimaryKeySelective(UserVo record);

	int updateByPrimaryKey(UserVo record);
}