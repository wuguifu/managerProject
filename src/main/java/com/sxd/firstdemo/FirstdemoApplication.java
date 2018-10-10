package com.sxd.firstdemo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

@SpringBootApplication
//此注解表示动态扫描DAO接口所在包
@MapperScan("com.sxd.firstdemo.dao")
@ImportResource(locations = {"classpath:mapper/sqlmap-config.xml"})
public class FirstdemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(FirstdemoApplication.class, args);
	}
}
