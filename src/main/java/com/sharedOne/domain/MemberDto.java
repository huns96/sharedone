package com.sharedOne.domain;

import lombok.Data;

import java.time.LocalDate;
import java.util.List;

@Data
public class MemberDto {
    private String name;
    private String user_id;
    private String password;
    private String phone;
    private String delyn;
    private String adduser;
    private LocalDate adddate;
    private String upduser;
    private LocalDate upddate;
    private List<String> auth;

}
