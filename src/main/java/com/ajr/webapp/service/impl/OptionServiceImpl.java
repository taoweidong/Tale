package com.ajr.webapp.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ajr.webapp.dao.OptionVoMapper;
import com.ajr.webapp.modal.Vo.OptionVo;
import com.ajr.webapp.modal.Vo.OptionVoExample;
import com.ajr.webapp.service.IOptionService;

/**
 * options表的service Created by BlueT on 2017/3/7.
 */
@Service
public class OptionServiceImpl implements IOptionService {

	// private static final Logger LOGGER = LoggerFactory.getLogger(OptionServiceImpl.class);

	@Resource
	private OptionVoMapper optionDao;

	@Override
	public void insertOption(OptionVo optionVo) {
		optionDao.insertSelective(optionVo);
	}

	@Override
	public void insertOption(String name, String value) {
		OptionVo optionVo = new OptionVo();
		optionVo.setName(name);
		optionVo.setValue(value);
		if (optionDao.selectByPrimaryKey(name) == null) {
			optionDao.insertSelective(optionVo);
		} else {
			optionDao.updateByPrimaryKeySelective(optionVo);
		}
	}

	@Override
	public void saveOptions(Map<String, String> options) {
		if (null != options && !options.isEmpty()) {
			options.forEach(this::insertOption);
		}
	}

	@Override
	public OptionVo getOptionByName(String name) {
		return optionDao.selectByPrimaryKey(name);
	}

	@Override
	public List<OptionVo> getOptions() {
		return optionDao.selectByExample(new OptionVoExample());
	}
}
