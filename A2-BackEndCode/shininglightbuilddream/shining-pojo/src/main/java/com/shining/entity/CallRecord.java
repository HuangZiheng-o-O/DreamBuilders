package com.shining.entity;


import com.baomidou.mybatisplus.annotation.TableField;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class CallRecord {

    private String id;
    private java.time.LocalDateTime startTime;
    private java.time.LocalDateTime endTime;
    private String callerId;
    private String receiverId;
    private Integer duration;
    private String content;
    private String remark;
    @TableField(exist = false)
    private String type;
    @TableField(exist = false)
    private String callerName;
    @TableField(exist = false)
    private String receiverName;
}
