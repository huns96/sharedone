package com.sharedOne;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
public class AaaApplication {

    public static void main(String[] args) {

        SpringApplication.run(AaaApplication.class, args);
    }

}
