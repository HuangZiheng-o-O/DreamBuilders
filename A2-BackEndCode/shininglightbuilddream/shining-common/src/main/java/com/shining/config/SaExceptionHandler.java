package com.shining.config;

import cn.dev33.satoken.util.SaResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class SaExceptionHandler{
    @ExceptionHandler(value = Exception.class)
    public SaResult handle(Exception e){
        e.printStackTrace();
        return SaResult.error(e.getMessage());
    }
}
