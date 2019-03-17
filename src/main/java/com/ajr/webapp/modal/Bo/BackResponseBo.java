package com.ajr.webapp.modal.Bo;

import java.io.Serializable;

/**
 * Created by 13 on 2017/2/25.
 */
public class BackResponseBo implements Serializable {

    /**
	 * 意义，目的和功能，以及被用到的地方<br>
	 */
	private static final long serialVersionUID = 1L;
	private String attachPath;
    private String themePath;
    private String sqlPath;

    public String getAttachPath() {
        return attachPath;
    }

    public void setAttachPath(String attachPath) {
        this.attachPath = attachPath;
    }

    public String getThemePath() {
        return themePath;
    }

    public void setThemePath(String themePath) {
        this.themePath = themePath;
    }

    public String getSqlPath() {
        return sqlPath;
    }

    public void setSqlPath(String sqlPath) {
        this.sqlPath = sqlPath;
    }
}
