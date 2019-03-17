package com.ajr.webapp.exception;

/**
 * 自定义异常处理
 */
public class TipException extends RuntimeException {

	/**
	 * 意义，目的和功能，以及被用到的地方<br>
	 */
	private static final long serialVersionUID = 1L;

	public TipException() {
	}

	public TipException(String message) {
		super(message);
	}

	public TipException(String message, Throwable cause) {
		super(message, cause);
	}

	public TipException(Throwable cause) {
		super(cause);
	}

}
