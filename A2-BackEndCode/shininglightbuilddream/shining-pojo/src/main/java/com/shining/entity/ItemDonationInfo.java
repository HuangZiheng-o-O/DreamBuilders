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

public class ItemDonationInfo {

    private String id;
    private String itemName;
    private String itemPicture;
    private String description;
    private String donatorId;
    private Integer isChecked;
    private Integer isPassed;
    private String volunteerId;
    @TableField(fill = FieldFill.INSERT)
    private java.time.LocalDateTime startTime;
    @TableField(fill = FieldFill.UPDATE)
    private java.time.LocalDateTime updateTime;
    private String remark;


}
