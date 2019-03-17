package com.ajr.webapp.controller.themes.nice;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ajr.webapp.controller.BaseController;
import com.ajr.webapp.utils.DateKit;

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
	
	@GetMapping(value = "/about")
	public String about(HttpServletRequest request) {
		request.setAttribute("test", DateKit.getNowTime());

		return this.render("about");
	}
	
	@GetMapping(value = "/services")
	public String services(HttpServletRequest request) {
		request.setAttribute("test", DateKit.getNowTime());

		return this.render("services");
	}
	
	@GetMapping(value = "/contact")
	public String contact(HttpServletRequest request) {
		request.setAttribute("test", DateKit.getNowTime());

		return this.render("contact");
	}
	
	@GetMapping(value = "/work")
	public String work(HttpServletRequest request) {
		request.setAttribute("test", DateKit.getNowTime());

		return this.render("work");
	}

}
