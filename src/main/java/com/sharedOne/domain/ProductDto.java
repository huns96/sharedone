package com.sharedOne.domain;

import lombok.Data;

<<<<<<< HEAD
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
=======
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;
>>>>>>> 3fd8e8ebfbd4ba7898131f597682a95fb1b169e5

@Data
public class ProductDto {
    private String product_code;
    private String name;
    private String ea;
    private int category_id;
<<<<<<< HEAD

    private String delyn;
    private String adduser;
    private Date adddate;
    private String upduser;
    private Date upddate;


=======
    private String delyn;
    private String adduser;
    private Timestamp adddate;
    private String upduser;
    private Timestamp upddate;

    private String main_cat;
    private String middle_cat;
    private String sub_cat;
>>>>>>> 3fd8e8ebfbd4ba7898131f597682a95fb1b169e5


}
