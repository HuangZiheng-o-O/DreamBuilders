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

public class Donator {

    private String id;
    private String idpid;
    private String avatar;
    private String name;
    private Integer age;
    private String tel;
    private Integer score;
    private String province;
    private String city;
    private String district;
    private String detailedAddress;
    @TableField(fill = FieldFill.INSERT)
    private java.time.LocalDateTime startTime;
    @TableField(fill = FieldFill.UPDATE)
    private java.time.LocalDateTime updateTime;
    private String remark;

}
