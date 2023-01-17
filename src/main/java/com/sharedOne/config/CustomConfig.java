package com.sharedOne.config;

import com.sharedOne.security.CustomUserDetailsService;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.sql.DataSource;

@Configuration
@MapperScan("com.sharedOne.mapper")
@EnableWebSecurity
public class CustomConfig {

    @Autowired
    private DataSource  dataSource;

    @Autowired
    private CustomUserDetailsService customUserDetailsService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


    /*@Bean
    public PersistentTokenRepository persistentTokenRepository(){
        JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
        repo.setDataSource(dataSource);
        return repo;
    }*/

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
        httpSecurity.formLogin().loginPage("/member/login").defaultSuccessUrl("/member/login", true);
        httpSecurity.logout().logoutUrl("/member/logout").logoutSuccessUrl("/member/login");
        /*  해당 tokenRepository 사용시 admin 사용자 토큰 15일 지난후 원래 있던 토큰이 삭제 되는게 아니라
        *   하나의 컬럼이 더 추가됩니당
        *   로그아웃버튼을 직접 클릭해서 사용시엔 db에서 컬럼이 삭제가 제대로 됨
        *   기간 만료 처리를 해야할시 변경해야함
        *   아래 링크 참고해서 변경하면됨  하지만 지금 상황에서 맞는진 모르겠어요
        *   https://bluexmas.tistory.com/1201
        *    */
        //httpSecurity.rememberMe().key("gomgom").tokenRepository(persistentTokenRepository()).tokenValiditySeconds(60 * 60 * 24 * 15).userDetailsService(customUserDetailsService);
        httpSecurity.rememberMe();
        httpSecurity.csrf().disable();
        return httpSecurity.build();
    }



}

