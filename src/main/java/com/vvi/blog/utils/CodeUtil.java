package com.vvi.blog.utils;

import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
public class CodeUtil {
    public String generateUniqueCode(){
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
}
