package com.shining.controller;

import cn.dev33.satoken.util.SaResult;
import com.shining.dto.AliyunOssDto;
import com.shining.service.AliyunOssService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/oss")
public class OssController {
    @Autowired
    private AliyunOssService service;

    @GetMapping("/uploadPolicy")
    public SaResult oss() {
        AliyunOssDto stsToken = service.getStsToken("child");
        return SaResult.data(stsToken);
    }
}
