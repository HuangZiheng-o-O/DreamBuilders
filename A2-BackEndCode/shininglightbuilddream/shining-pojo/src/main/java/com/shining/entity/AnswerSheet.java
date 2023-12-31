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

public class AnswerSheet {

  private String id;
  private String taskId;
  private String childId;
  private String contentsType;
  private String contentsPicture;
  private String contentsVideo;
  private double averageGrade;
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


  public String getTaskId() {
    return taskId;
  }

  public void setTaskId(String taskId) {
    this.taskId = taskId;
  }


  public String getChildId() {
    return childId;
  }

  public void setChildId(String childId) {
    this.childId = childId;
  }


  public String getContentsType() {
    return contentsType;
  }

  public void setContentsType(String contentsType) {
    this.contentsType = contentsType;
  }


  public String getContentsPicture() {
    return contentsPicture;
  }

  public void setContentsPicture(String contentsPicture) {
    this.contentsPicture = contentsPicture;
  }


  public String getContentsVideo() {
    return contentsVideo;
  }

  public void setContentsVideo(String contentsVideo) {
    this.contentsVideo = contentsVideo;
  }


  public double getAverageGrade() {
    return averageGrade;
  }

  public void setAverageGrade(double averageGrade) {
    this.averageGrade = averageGrade;
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
