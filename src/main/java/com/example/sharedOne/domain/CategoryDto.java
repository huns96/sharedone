package com.example.sharedOne.domain;

import lombok.Data;

@Data
public class CategoryDto {

    private int main_id;
    private String main_name;

    private int middle_id;
    private String middle_name;

    private int middle_main_id;

    private int sub_id;
    private String sub_name;

    private int sub_middle_id;
}

