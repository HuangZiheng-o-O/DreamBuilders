package com.shining.client;

import cn.dev33.satoken.util.SaResult;
import com.shining.entity.CallRecord;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient("child")
public interface ChildFeign {
    @GetMapping("/personal/getInformation")
    SaResult getChildren(@RequestParam String childId);
    @GetMapping("/task/answerSheet")
    SaResult getAnswerSheet(@RequestParam String taskId, @RequestParam String childId);
    @RequestMapping("/call/inform")
    SaResult inform(@RequestBody CallRecord callRecord);
}
