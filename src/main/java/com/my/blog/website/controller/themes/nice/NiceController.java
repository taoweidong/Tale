package com.my.blog.website.controller.themes.nice;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.blog.website.controller.BaseController;
import com.my.blog.website.utils.DateKit;

/**
 * 首页 - 前台页面的控制器 Created by Administrator on 2017/3/8 008.
 */
@Controller
@RequestMapping(value = "/nice")
public class NiceController extends BaseController {

	private static final Logger LOGGER = LoggerFactory.getLogger(NiceController.class);

	@GetMapping(value = "/index")
	public String test(HttpServletRequest request) {
		request.setAttribute("test", DateKit.getNowTime());
		LOGGER.info("主题2访问接口");
		return this.render("index");
	}

}
