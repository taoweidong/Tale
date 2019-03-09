package com.my.blog.website.controller.themes;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.my.blog.website.constant.WebConst;
import com.my.blog.website.utils.DateKit;
import com.my.blog.website.utils.MapCache;

/**
 * 首页 - 前台页面的控制器 Created by Administrator on 2017/3/8 008.
 */
@Controller
public class IndexController {

	protected MapCache cache = MapCache.single();

	/**
	 * 主题键.
	 */
	private static final String SITE_THEME = "site_theme";

	private static final Logger LOGGER = LoggerFactory.getLogger(IndexController.class);

	@GetMapping(value = "/")
	public ModelAndView test(HttpServletRequest request) {
		request.setAttribute("test", DateKit.getNowTime());

		String theme = WebConst.initConfig.get(SITE_THEME);

		LOGGER.info("入口区分主题：" + theme);

		return new ModelAndView("redirect:" + render(theme));
	}

	/**
	 * 主页的页面主题
	 * @param viewName
	 * @return
	 */
	public String render(String viewName) {
		return "/" + viewName + "/index";
	}

}
