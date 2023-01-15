package com.sharedOne.domain;

import lombok.Data;

@Data
public class PageInfo {

    private int countAll;
    private int lastPageNumber;
    private int leftPageNumber;
    private int rightPageNumber;
    private int currentPageNumber;
    private boolean hasNextPageNumber;
}
