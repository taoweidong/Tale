package com.ajr.webapp.modal.Bo;

import java.io.Serializable;

/**
 * 后台统计对象
 */
public class StatisticsBo implements Serializable {

	/**
	 * 意义，目的和功能，以及被用到的地方<br>
	 */
	private static final long serialVersionUID = 1L;
	private Long articles;
	private Long comments;
	private Long links;
	private Long attachs;

	public Long getArticles() {
		return articles;
	}

	public void setArticles(Long articles) {
		this.articles = articles;
	}

	public Long getComments() {
		return comments;
	}

	public void setComments(Long comments) {
		this.comments = comments;
	}

	public Long getLinks() {
		return links;
	}

	public void setLinks(Long links) {
		this.links = links;
	}

	public Long getAttachs() {
		return attachs;
	}

	public void setAttachs(Long attachs) {
		this.attachs = attachs;
	}

	@Override
	public String toString() {
		return "StatisticsBo{" + "articles=" + articles + ", comments=" + comments + ", links="
				+ links + ", attachs=" + attachs + '}';
	}
}
