package com.ajr.webapp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ajr.webapp.dao.AttachVoMapper;
import com.ajr.webapp.modal.Vo.AttachVo;
import com.ajr.webapp.modal.Vo.AttachVoExample;
import com.ajr.webapp.service.IAttachService;
import com.ajr.webapp.utils.DateKit;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * Created by wangq on 2017/3/20.
 */
@Service
public class AttachServiceImpl implements IAttachService {

	@Resource
	private AttachVoMapper attachDao;

	@Override
	public PageInfo<AttachVo> getAttachs(Integer page, Integer limit) {
		PageHelper.startPage(page, limit);
		AttachVoExample attachVoExample = new AttachVoExample();
		attachVoExample.setOrderByClause("id desc");
		List<AttachVo> attachVos = attachDao.selectByExample(attachVoExample);
		return new PageInfo<>(attachVos);
	}

	@Override
	public AttachVo selectById(Integer id) {
		if (null != id) {
			return attachDao.selectByPrimaryKey(id);
		}
		return null;
	}

	@Override
	public void save(String fname, String fkey, String ftype, Integer author) {
		AttachVo attach = new AttachVo();
		attach.setFname(fname);
		attach.setAuthorId(author);
		attach.setFkey(fkey);
		attach.setFtype(ftype);
		attach.setCreated(DateKit.getCurrentUnixTime());
		attachDao.insertSelective(attach);
	}

	@Override
	public void deleteById(Integer id) {
		if (null != id) {
			attachDao.deleteByPrimaryKey(id);
		}
	}
}
