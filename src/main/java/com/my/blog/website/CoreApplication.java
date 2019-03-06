package com.my.blog.website;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.my.blog.website.utils.DateKit;

@MapperScan("com.my.blog.website.dao") // 扫描Mybatis对应的接口包
@SpringBootApplication
@EnableTransactionManagement
public class CoreApplication {

	private static final Logger logger = LoggerFactory.getLogger(CoreApplication.class);

	public static void main(String[] args) {
		// 连接数据库，初始化数据库，即执行创建数据库的语句

		SpringApplication.run(CoreApplication.class, args);

		logger.info("启动为完毕" + DateKit.getNowTime());
	}
}
