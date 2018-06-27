package com.my.blog.website;

import com.my.blog.website.modal.Vo.UserVo;
import com.my.blog.website.utils.TaleUtils;

/**
 * Created by 13 on 2017/4/2.
 */
public class Pwdtest {
    public static void main(String args[]){
        UserVo user = new UserVo();
        user.setUsername("taoweidong");
        user.setPassword("taoweidong");
        String encodePwd = TaleUtils.MD5encode(user.getUsername() + user.getPassword());
        System.out.println(encodePwd);
    }
}
