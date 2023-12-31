package com.shining.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PersonalInfoChangeRequest {

  private String id;
  private String applicantId;
  private String contentsText;
  private Integer isVisited;
  private LocalDateTime startTime;
    private LocalDateTime updateTime;

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }


  public String getApplicantId() {
    return applicantId;
  }

  public void setApplicantId(String applicantId) {
    this.applicantId = applicantId;
  }


  public String getContentsText() {
    return contentsText;
  }

  public void setContentsText(String contentsText) {
    this.contentsText = contentsText;
  }


  public Integer getIsVisited() {
    return isVisited;
  }

  public void setIsVisited(Integer isVisited) {
    this.isVisited = isVisited;
  }

}
