package com.sharedOne.security;

import com.sharedOne.domain.MemberDto;
import com.sharedOne.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class CustomUserDetailsService  implements UserDetailsService {
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private MemberMapper mapper;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        MemberDto member = mapper.selectById(username);
        if (member == null) {
            return null;
        }
        List<SimpleGrantedAuthority> authorityList = new ArrayList<>();
        if(member.getAuth() != null) {
            for (String auth : member.getAuth()){
                authorityList.add(new SimpleGrantedAuthority(auth));
            }
        }
        String encodedPw = passwordEncoder.encode(member.getPassword());
        User user = new User(member.getUser_id(), encodedPw, authorityList);
        return user;
    }
}
