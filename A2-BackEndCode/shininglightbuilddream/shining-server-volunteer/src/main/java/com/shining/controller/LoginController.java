package com.shining.controller;

import cn.dev33.satoken.stp.StpUtil;
import cn.dev33.satoken.util.SaResult;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.entity.Volunteer;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class LoginController {
    @PostMapping("/login")
    public SaResult login(@RequestBody Map<String,String> info) {
        String account = info.get("account");
        String password = info.get("password");
        Volunteer volunteer = Db.lambdaQuery(Volunteer.class).eq(Volunteer::getAccount, account).eq(Volunteer::getPassword, password).oneOpt()
                .orElseThrow(() -> new RuntimeException("账号或密码错误"));
        StpUtil.login(account);
        HashMap<String, String> map = new HashMap<>();
        map.put("id", volunteer.getId());
        map.put("name", volunteer.getName());
        map.put("token", StpUtil.getTokenValue());
        return SaResult.data(map);
    }
}
