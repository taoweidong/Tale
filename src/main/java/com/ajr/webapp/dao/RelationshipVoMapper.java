package com.ajr.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ajr.webapp.modal.Vo.RelationshipVoExample;
import com.ajr.webapp.modal.Vo.RelationshipVoKey;

@Mapper
public interface RelationshipVoMapper {
	long countByExample(RelationshipVoExample example);

	int deleteByExample(RelationshipVoExample example);

	int deleteByPrimaryKey(RelationshipVoKey key);

	int insert(RelationshipVoKey record);

	int insertSelective(RelationshipVoKey record);

	List<RelationshipVoKey> selectByExample(RelationshipVoExample example);

	int updateByExampleSelective(@Param("record") RelationshipVoKey record,
			@Param("example") RelationshipVoExample example);

	int updateByExample(@Param("record") RelationshipVoKey record,
			@Param("example") RelationshipVoExample example);
}