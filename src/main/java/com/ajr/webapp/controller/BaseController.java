package com.ajr.webapp.controller;

import javax.servlet.http.HttpServletRequest;

import com.ajr.webapp.modal.Vo.UserVo;
import com.ajr.webapp.utils.MapCache;
import com.ajr.webapp.utils.TaleUtils;
import com.ajr.webapp.utils.WebConst;

/**
 * 基础Controller
 */
public abstract class BaseController {

	/**
	 * 主题键.
	 */
	protected static final String SITE_THEME = "site_theme";

	protected MapCache cache = MapCache.single();

	public String getTheme() {
		// 取出主题并进行拼接地址
		return "themes/" + WebConst.initConfig.get(SITE_THEME);
	}

	/**
	 * 主页的页面主题
	 * @param viewName
	 * @return
	 */
	public String render(String viewName) {
		return getTheme() + "/" + viewName;
	}

	public BaseController title(HttpServletRequest request, String title) {
		request.setAttribute("title", title);
		return this;
	}

	public BaseController keywords(HttpServletRequest request, String keywords) {
		request.setAttribute("keywords", keywords);
		return this;
	}

	/**
	 * 获取请求绑定的登录对象
	 * @param request
	 * @return
	 */
	public UserVo user(HttpServletRequest request) {
		return TaleUtils.getLoginUser(request);
	}

	public Integer getUid(HttpServletRequest request) {
		return this.user(request).getUid();
	}

	public String render_404() {
		return "comm/error_404";
	}

}
