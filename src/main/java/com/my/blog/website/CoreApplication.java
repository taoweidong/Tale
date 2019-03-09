package com.my.blog.website;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.my.blog.website.utils.DateKit;

@SpringBootApplication
@EnableTransactionManagement
public class CoreApplication {

	private static final Logger LOGGER = LoggerFactory.getLogger(CoreApplication.class);

	public static void main(String[] args) {

		SpringApplication.run(CoreApplication.class, args);
		LOGGER.info("启动为完毕------->" + DateKit.getNowTime());
	}
}
