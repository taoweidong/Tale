package com.ajr.webapp.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ajr.webapp.dto.Types;
import com.ajr.webapp.modal.Vo.OptionVo;
import com.ajr.webapp.modal.Vo.UserVo;
import com.ajr.webapp.service.IOptionService;
import com.ajr.webapp.service.IUserService;
import com.ajr.webapp.utils.AdminCommons;
import com.ajr.webapp.utils.Commons;
import com.ajr.webapp.utils.IPKit;
import com.ajr.webapp.utils.MapCache;
import com.ajr.webapp.utils.TaleUtils;
import com.ajr.webapp.utils.UUID;
import com.ajr.webapp.utils.WebConst;

/**
 * 自定义SpringMVC拦截器<br/>
 * SpringWebMVC的处理器拦截器，类似于Servlet开发中的过滤器Filter，用于处理器进行预处理和后处理。
 * @author Taowd
 * @version 2019年3月6日
 * @see BaseInterceptor
 */
@Component
public class BaseInterceptor implements HandlerInterceptor {

	/**
	 * 应用场景<br/>
	 * 1、日志记录，可以记录请求信息的日志，以便进行信息监控、信息统计等。<br/>
	 * 2、权限检查：如登陆检测，进入处理器检测是否登陆，如果没有直接返回到登陆页面。<br/>
	 * 3、性能监控：典型的是慢日志。<br/>
	 */

	private static final Logger LOGGE = LoggerFactory.getLogger(BaseInterceptor.class);
	// private static final String USER_AGENT = "user-agent";

	@Resource
	private IUserService userService;

	@Resource
	private IOptionService optionService;

	private MapCache cache = MapCache.single();

	@Resource
	private Commons commons;

	@Resource
	private AdminCommons adminCommons;

	/**
	 * 预处理回调方法，实现处理器的预处理（如检查登陆）， <br/>
	 * 第三个参数为响应的处理器，自定义Controller 返回值：true表示继续流程（如调用下一个拦截器或处理器）；false表示流程中断（如登录检查失败），
	 * 不会继续调用其他的拦截器或处理器，此时我们需要通过response来产生响应；
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o)
			throws Exception {
		String uri = request.getRequestURI();

		// LOGGE.info("UserAgent: {}", request.getHeader(USER_AGENT));
		LOGGE.info("用户访问地址: {}, 来路地址: {}", uri, IPKit.getIpAddrByRequest(request));

		// 请求拦截处理
		UserVo user = TaleUtils.getLoginUser(request);
		if (null == user) {
			Integer uid = TaleUtils.getCookieUid(request);
			if (null != uid) {
				// 这里还是有安全隐患,cookie是可以伪造的
				user = userService.queryUserById(uid);
				request.getSession().setAttribute(WebConst.LOGIN_SESSION_KEY, user);
			}
		}
		if (uri.startsWith("/admin") && !uri.startsWith("/admin/login") && null == user) {
			response.sendRedirect(request.getContextPath() + "/admin/login");
			return false;
		}
		// 设置get请求的token
		if (request.getMethod().equals("GET")) {
			String csrf_token = UUID.UU64();
			// 默认存储30分钟
			cache.hset(Types.CSRF_TOKEN.getType(), csrf_token, uri, 30 * 60);
			request.setAttribute("_csrf_token", csrf_token);
		}
		return true;
	}

	/**
	 * 后处理回调方法，实现处理器的后处理（但在渲染视图之前），此时我们可以通过modelAndView（模型和视图对象）对模型数据进行处理或对视图进行处理，
	 * modelAndView也可能为null。
	 */
	@Override
	public void postHandle(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView)
			throws Exception {

		OptionVo ov = optionService.getOptionByName("site_record");
		httpServletRequest.setAttribute("commons", commons);// 一些工具类和公共方法
		httpServletRequest.setAttribute("option", ov);
		httpServletRequest.setAttribute("adminCommons", adminCommons);
	}

	/**
	 * 整个请求处理完毕回调方法，即在视图渲染完毕时回调，如性能监控中我们可以在此记录结束时间并输出消耗时间，
	 * 还可以进行一些资源清理，类似于try-catch-finally中的finally，但仅调用处理器执行链中
	 */
	@Override
	public void afterCompletion(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

	}
}
