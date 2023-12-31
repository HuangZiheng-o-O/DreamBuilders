package com.shining;

import cn.dev33.satoken.util.SaResult;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.controller.CallController;
import com.shining.controller.TaskController;
import com.shining.entity.CallRecord;
import com.shining.entity.Task;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Map;

@SpringBootTest
class ShiningServerVolunteerApplicationTests {
    @Autowired
    private TaskController taskController;

    @Test
    void callControllerTest1() {
        taskController.getTask("T001");

    }

    @Test
    void callControllerTest2() {
        taskController.distributeAnswerSheet("V001");
    }
    @Test
    void callControllerTest3() {
        taskController.getMarkingResultList("V001");
    }
    @Test
    void callControllerTest4() {
        taskController.distributeLoveProjectList("V001");
    }
    @Test
    void callControllerTest5() {
        taskController.loveProjectList("C001");
    }

}
