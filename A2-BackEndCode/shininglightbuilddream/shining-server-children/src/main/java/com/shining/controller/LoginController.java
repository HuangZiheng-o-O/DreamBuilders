package com.shining.controller;

import cn.dev33.satoken.stp.StpUtil;
import cn.dev33.satoken.util.SaResult;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.entity.Child;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
@Tag(name = "儿童端登录接口")
public class LoginController {
    @Operation(summary = "登录")
    @PostMapping("/login")
    public SaResult login(@RequestBody Child childE) {
        Child child = Db.lambdaQuery(Child.class).eq(Child::getAccount, childE.getAccount()).eq(Child::getPassword, childE.getPassword()).oneOpt()
                .orElseThrow(() -> new RuntimeException("账号或密码错误"));
        StpUtil.login(child.getId());
        HashMap<String, String> map = new HashMap<>();
        map.put("id", child.getId());
        map.put("name", child.getName());
        map.put("token", StpUtil.getTokenValue());
        return SaResult.data(map);
    }
}
