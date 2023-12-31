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

public class Task {

  private String id;
  private String thumbnail;
  private String title;
  private String description;
  private java.time.LocalDateTime deadline;
  private String contentsType;
  private Integer isNecessary;
  private Integer correctionTimes;
  @TableField(fill = FieldFill.INSERT)
private java.time.LocalDateTime startTime;
   @TableField(fill = FieldFill.UPDATE)
private java.time.LocalDateTime updateTime;
  private String remark;


  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }


  public String getThumbnail() {
    return thumbnail;
  }

  public void setThumbnail(String thumbnail) {
    this.thumbnail = thumbnail;
  }


  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }


  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }


  public java.time.LocalDateTime getDeadline() {
    return deadline;
  }

  public void setDeadline(java.time.LocalDateTime deadline) {
    this.deadline = deadline;
  }


  public String getContentsType() {
    return contentsType;
  }

  public void setContentsType(String contentsType) {
    this.contentsType = contentsType;
  }


  public Integer getIsNecessary() {
    return isNecessary;
  }

  public void setIsNecessary(Integer isNecessary) {
    this.isNecessary = isNecessary;
  }


  public Integer getCorrectionTimes() {
    return correctionTimes;
  }

  public void setCorrectionTimes(Integer correctionTimes) {
    this.correctionTimes = correctionTimes;
  }


  public java.time.LocalDateTime getStartTime() {
    return startTime;
  }

  public void setStartTime(java.time.LocalDateTime startTime) {
    this.startTime = startTime;
  }


  public java.time.LocalDateTime getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(java.time.LocalDateTime updateTime) {
    this.updateTime = updateTime;
  }


  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }

}
