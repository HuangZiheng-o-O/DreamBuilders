package com.shining;

import com.shining.entity.CallRecord;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

@Slf4j
public class MessageListStore {
    public static Map<String, BlockingQueue<CallRecord>> messageList = new HashMap<>();

    public static void init(String id) {
        messageList.put(id, new LinkedBlockingQueue<>());
    }

    public static boolean isEmpty(String id) {
        if (messageList.get(id) == null) {
            init(id);
        }
        return messageList.get(id).isEmpty();
    }

    public static CallRecord poll(String id) throws InterruptedException {
        if (messageList.get(id) == null) {
            init(id);
        }
        log.info("队列大小为{}，执行poll" + id, messageList.get(id).size());
        return Objects.requireNonNull(messageList.get(id).poll(1000L, TimeUnit.MILLISECONDS), "队列为空");
    }

    public static void put(CallRecord callRecord, String id) {
        if (messageList.get(id) == null) {
            init(id);
        }
        log.info("队列大小为{}，执行put" + id, messageList.get(id).size());
        messageList.get(id).add(callRecord);
    }
}
