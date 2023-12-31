package com.shining.client;

import cn.dev33.satoken.util.SaResult;
import com.shining.entity.CallRecord;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@FeignClient("volunteer")
public interface VolunteerFeign {
    @RequestMapping("/call/inform")
    SaResult inform(@RequestBody CallRecord callRecord);
}
