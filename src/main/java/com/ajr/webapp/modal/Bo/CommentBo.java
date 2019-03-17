package com.ajr.webapp.modal.Bo;

import java.util.List;

import com.ajr.webapp.modal.Vo.CommentVo;

/**
 * 返回页面的评论，包含父子评论内容
 * @author Taowd
 * @version 2019年3月10日
 * @see CommentBo
 */
public class CommentBo extends CommentVo {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int levels;
	private List<CommentVo> children;

	public CommentBo(CommentVo comments) {
		setAuthor(comments.getAuthor());
		setMail(comments.getMail());
		setCoid(comments.getCoid());
		setAuthorId(comments.getAuthorId());
		setUrl(comments.getUrl());
		setCreated(comments.getCreated());
		setAgent(comments.getAgent());
		setIp(comments.getIp());
		setContent(comments.getContent());
		setOwnerId(comments.getOwnerId());
		setCid(comments.getCid());
	}

	public int getLevels() {
		return levels;
	}

	public void setLevels(int levels) {
		this.levels = levels;
	}

	public List<CommentVo> getChildren() {
		return children;
	}

	public void setChildren(List<CommentVo> children) {
		this.children = children;
	}
}
