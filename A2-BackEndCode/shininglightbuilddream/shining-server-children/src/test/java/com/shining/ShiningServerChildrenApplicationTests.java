package com.shining;

import com.shining.controller.TaskController;
import com.shining.service.AliyunOssService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ShiningServerChildrenApplicationTests {
    @Autowired
    private AliyunOssService aliyunOssService;
    @Autowired
    private TaskController task;

    @Test
    void testAliYun() {
        String roleSessionName = "yourRoleSessionName";
        System.out.println(aliyunOssService.getStsToken(roleSessionName));
    }
    @Test
    void testTask() {
        System.out.println(task.getTaskDetail("T001"));
    }


}
