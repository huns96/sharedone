package com.sharedOne.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;
@Configuration
@MapperScan("com.example.sharedOne.mapper")
public class CustomConfig {

}
