package com.my.blog.website.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.my.blog.website.dao.UserVoMapper;
import com.my.blog.website.modal.Vo.UserVo;
import com.my.blog.website.modal.Vo.UserVoExample;
import com.my.blog.website.utils.EasyPoiUtil;

@RestController
@RequestMapping("/address")
public class ExcelExportController {

	@Autowired
	private UserVoMapper userVoMapper;

	@RequestMapping("/user")
	public void export(HttpServletResponse response) {
		// 从数据库获取需要导出的数据
		UserVoExample example = new UserVoExample();
		UserVoExample.Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo("taoweidong");
		List<UserVo> listData = userVoMapper.selectByExample(example);

		// 导出操作
		EasyPoiUtil.exportExcel(listData, "用户信息", "用户信息", UserVo.class, "用户信息.xls", response);

	}

}
