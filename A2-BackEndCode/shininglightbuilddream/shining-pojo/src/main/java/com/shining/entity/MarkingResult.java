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

public class MarkingResult {

  private String id;
  private String answerId;
  private String volunteerId;
  private Integer grade;
  private Integer isChecked;
  private String contentsType;
  private String contentsText;
  private String contentsPicture;
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


  public String getAnswerId() {
    return answerId;
  }

  public void setAnswerId(String answerId) {
    this.answerId = answerId;
  }


  public String getVolunteerId() {
    return volunteerId;
  }

  public void setVolunteerId(String volunteerId) {
    this.volunteerId = volunteerId;
  }


  public Integer getGrade() {
    return grade;
  }

  public void setGrade(Integer grade) {
    this.grade = grade;
  }


  public Integer getIsChecked() {
    return isChecked;
  }

  public void setIsChecked(Integer isChecked) {
    this.isChecked = isChecked;
  }


  public String getContentsType() {
    return contentsType;
  }

  public void setContentsType(String contentsType) {
    this.contentsType = contentsType;
  }


  public String getContentsText() {
    return contentsText;
  }

  public void setContentsText(String contentsText) {
    this.contentsText = contentsText;
  }


  public String getContentsPicture() {
    return contentsPicture;
  }

  public void setContentsPicture(String contentsPicture) {
    this.contentsPicture = contentsPicture;
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
