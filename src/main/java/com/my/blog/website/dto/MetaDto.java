package com.my.blog.website.dto;

import com.my.blog.website.modal.Vo.MetaVo;

public class MetaDto extends MetaVo {

	/**
	 * 意义，目的和功能，以及被用到的地方<br>
	 */
	private static final long serialVersionUID = 1L;
	private int count;

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
