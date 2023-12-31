package com.shining.entity;


import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class LoveProject {
    private String id;
    private String type;
    private String itemName;
    private Integer fund;
    private Integer amount;
    private String thumbnail;
    private Integer requiredCredit;
    @TableField(fill = FieldFill.INSERT)
    private java.time.LocalDateTime startTime;
    @TableField(fill = FieldFill.UPDATE)
    private java.time.LocalDateTime updateTime;
    private String remark;
    @TableField(exist = false)
    private Integer beingFocusOn;
}
