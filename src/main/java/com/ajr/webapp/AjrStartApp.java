package com.ajr.webapp;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.ajr.webapp.utils.DateKit;

/**
 * 启动类
 * @author taowd
 */
@SpringBootApplication
@EnableTransactionManagement
public class AjrStartApp {

	private static final Logger LOGGER = LoggerFactory.getLogger(AjrStartApp.class);

	public static void main(String[] args) {

		SpringApplication.run(AjrStartApp.class, args);

		LOGGER.info("启动为完毕------->" + DateKit.getNowTime());
	}
}
