package com.shining.controller;

import cn.dev33.satoken.util.SaResult;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.MessageListStore;
import com.shining.client.ChildFeign;
import com.shining.dto.ChildMessageDto;
import com.shining.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/call")
public class CallController {
    @Autowired
    private ChildFeign feign;

    @PostMapping
    public SaResult call(@RequestBody CallRecord callRecord) {
        feign.inform(callRecord);
        return SaResult.ok();
    }

    @PostMapping("/urge")
    public SaResult call(Map<String, String> map) {
        String taskId = map.get("taskId");
        Task task = Db.getById(taskId, Task.class);
        return call(CallRecord.builder().callerId(map.get("volunteerId")).callerName(map.get("childId"))
                .content("催一催" + task.getTitle() + "任务").build());
    }

    @GetMapping("/single")
    public SaResult single(String id) throws InterruptedException {
        if (MessageListStore.isEmpty(id)) {
            return SaResult.data(null);
        } else {
            return SaResult.data(MessageListStore.poll(id));
        }

    }

    @GetMapping("/history")
    public SaResult history(String id) {
        List<CallRecord> listV = Db.lambdaQuery(CallRecord.class).eq(CallRecord::getReceiverId, id).list();
        listV.forEach(e -> {
            e.setType("volunteer");
            e.setCallerName(Db.getById(e.getCallerId(), Child.class).getName());
            e.setReceiverName(Db.getById(e.getReceiverId(), Volunteer.class).getName());
        });
        List<CallRecord> listC = Db.lambdaQuery(CallRecord.class).eq(CallRecord::getCallerId, id).list();
        listC.forEach(e -> {
            e.setType("child");
            e.setCallerName(Db.getById(e.getCallerId(), Volunteer.class).getName());
            e.setReceiverName(Db.getById(e.getReceiverId(), Child.class).getName());
        });
        listC.addAll(listV);
        listC.sort((o1, o2) -> -o2.getStartTime().compareTo(o1.getStartTime()));
        return SaResult.data(listC);
    }

    @PostMapping("/inform")
    public SaResult inform(@RequestBody CallRecord callRecord) {
        callRecord.setType("volunteer");
        boolean save = Db.save(callRecord);
        if (!save) {
            return SaResult.error("保存失败");
        }
        callRecord.setCallerName(Db.getById(callRecord.getCallerId(), Child.class).getName());
        callRecord.setReceiverName(Db.getById(callRecord.getReceiverId(), Volunteer.class).getName());
        MessageListStore.put(callRecord, callRecord.getReceiverId());
        return SaResult.ok();
    }
    @Value("${imgBaseUrl}")
    private String baseUrl;
    @GetMapping("/childList")
    public SaResult childList(@RequestParam String volunteerId) {
        List<ChildVolunteer> list = Db.lambdaQuery(ChildVolunteer.class).eq(ChildVolunteer::getVolunteerId, volunteerId).list();
        List<ChildMessageDto> dtoList = list.stream().map(e -> {
            CallRecord record1 = Db.lambdaQuery(CallRecord.class).eq(CallRecord::getReceiverId, volunteerId).orderByDesc(CallRecord::getStartTime).last("limit 1").one();
            CallRecord record2 = Db.lambdaQuery(CallRecord.class).eq(CallRecord::getCallerId, volunteerId).orderByDesc(CallRecord::getStartTime).last("limit 1").one();
            Child child = Db.getById(e.getChildId(), Child.class);
            CallRecord callRecord = record1.getStartTime().isAfter(record2.getStartTime()) ? record1 : record2;
            return ChildMessageDto.builder().avatar(child.getAvatar()).childId(e.getChildId()).name(child.getName()).newMessage(callRecord).build();
        }).toList();
        dtoList.forEach(e->e.setAvatar(e.getAvatar()==null?null:baseUrl+e.getAvatar()));
        return SaResult.data(dtoList);
    }
}
