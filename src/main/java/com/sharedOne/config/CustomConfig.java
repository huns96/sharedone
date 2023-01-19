package com.sharedOne.config;

import com.sharedOne.security.CustomAccessDeniedHandler;
import com.sharedOne.security.CustomUserDetailsService;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;


import javax.sql.DataSource;

@Configuration
@MapperScan("com.sharedOne.mapper")
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class CustomConfig {

    @Autowired
    private CustomUserDetailsService customUserDetailsService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public CustomAccessDeniedHandler customAccessDeniedHandler(){
        return new CustomAccessDeniedHandler();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
        httpSecurity.formLogin().loginPage("/member/login").defaultSuccessUrl("/member/login", true);
        httpSecurity.logout().logoutUrl("/member/logout").logoutSuccessUrl("/member/login");
        //httpSecurity.rememberMe().key("rememberKey").userDetailsService(customUserDetailsService);
        //httpSecurity.rememberMe().key("rememberKey");
        httpSecurity.csrf().disable();
        httpSecurity.exceptionHandling().accessDeniedHandler(customAccessDeniedHandler());
        return httpSecurity.build();
    }



}
