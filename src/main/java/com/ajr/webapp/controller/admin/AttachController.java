package com.ajr.webapp.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ajr.webapp.controller.BaseController;
import com.ajr.webapp.dto.LogActions;
import com.ajr.webapp.dto.Types;
import com.ajr.webapp.exception.TipException;
import com.ajr.webapp.modal.Bo.RestResponseBo;
import com.ajr.webapp.modal.Vo.AttachVo;
import com.ajr.webapp.modal.Vo.UserVo;
import com.ajr.webapp.service.IAttachService;
import com.ajr.webapp.service.ILogService;
import com.ajr.webapp.utils.Commons;
import com.ajr.webapp.utils.QiniuUpload;
import com.ajr.webapp.utils.TaleUtils;
import com.ajr.webapp.utils.WebConst;
import com.github.pagehelper.PageInfo;

/**
 * 附件管理 By Taowd .
 */
@Controller
@RequestMapping("admin/attach")
public class AttachController extends BaseController {

	private static final Logger LOGGER = LoggerFactory.getLogger(AttachController.class);

	public static final String CLASSPATH = TaleUtils.getUplodFilePath();

	@Resource
	private IAttachService attachService;

	@Resource
	private ILogService logService;

	@Autowired
	private QiniuUpload qiniuUpload;

	/**
	 * 附件页面
	 * @param request
	 * @param page
	 * @param limit
	 * @return
	 */
	@GetMapping(value = "")
	public String index(HttpServletRequest request,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "limit", defaultValue = "12") int limit) {
		PageInfo<AttachVo> attachPaginator = attachService.getAttachs(page, limit);
		request.setAttribute("attachs", attachPaginator);
		request.setAttribute(Types.ATTACH_URL.getType(),
				Commons.site_option(Types.ATTACH_URL.getType(), Commons.site_url()));
		request.setAttribute("max_file_size", WebConst.MAX_FILE_SIZE / 1024);
		return "admin/attach";
	}

	/**
	 * 上传文件接口
	 * @param request
	 * @return
	 */
	@PostMapping(value = "upload")
	@ResponseBody
	@Transactional(rollbackFor = TipException.class)
	public RestResponseBo<?> upload(HttpServletRequest request,
			@RequestParam("file") MultipartFile[] multipartFiles) throws IOException {
		UserVo users = this.user(request);
		Integer uid = users.getUid();
		List<String> errorFiles = new ArrayList<>();
		try {
			for (MultipartFile multipartFile : multipartFiles) {
				String fname = multipartFile.getOriginalFilename();
				if (multipartFile.getSize() <= WebConst.MAX_FILE_SIZE) {
					String fkey = TaleUtils.getFileKey(fname);
					String ftype = TaleUtils.isImage(multipartFile.getInputStream())
							? Types.IMAGE.getType()
							: Types.FILE.getType();
					// 存储本地
					// File file = new File(CLASSPATH + fkey);
					// try {
					// FileCopyUtils.copy(multipartFile.getInputStream(),
					// new FileOutputStream(file));
					// } catch (IOException e) {
					// e.printStackTrace();
					// }
					// 存储到七牛云对象存储服务
					fkey = qiniuUpload.postFileByStream(fname, multipartFile.getInputStream());
					attachService.save(fname, fkey, ftype, uid);
				} else {
					errorFiles.add(fname);
				}
			}
		} catch (Exception e) {
			return RestResponseBo.fail();
		}
		return RestResponseBo.ok(errorFiles);
	}

	@RequestMapping(value = "delete")
	@ResponseBody
	@Transactional(rollbackFor = TipException.class)
	public RestResponseBo<?> delete(@RequestParam Integer id, HttpServletRequest request) {
		try {
			AttachVo attach = attachService.selectById(id);
			if (null == attach) {
				return RestResponseBo.fail("不存在该附件");
			}
			attachService.deleteById(id);
			new File(CLASSPATH + attach.getFkey()).delete();
			logService.insertLog(LogActions.DEL_ARTICLE.getAction(), attach.getFkey(),
					request.getRemoteAddr(), this.getUid(request));
		} catch (Exception e) {
			String msg = "附件删除失败";
			if (e instanceof TipException) {
				msg = e.getMessage();
			} else {
				LOGGER.error(msg, e);
			}
			return RestResponseBo.fail(msg);
		}
		return RestResponseBo.ok();
	}

}
