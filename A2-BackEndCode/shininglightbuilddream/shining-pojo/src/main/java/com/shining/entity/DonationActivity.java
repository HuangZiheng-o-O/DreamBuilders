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

public class DonationActivity {

    private String id;
    private String donatorId;
    private String donationType;
    private String childId;
    private String loveProjectId;
    private String itemDonationInfoId;
    private String description;
    @TableField(fill = FieldFill.INSERT)
    private java.time.LocalDateTime startTime;
    @TableField(fill = FieldFill.UPDATE)
    private java.time.LocalDateTime updateTime;
    private String remark;
    private String billId;
    @TableField(exist = false)
    private String loveProjectName;
}
