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

public class Report {

  private String id;
  private String fromId;
  private String toId;
  private String contentsType;
  private String contentsText;
  private String contentsPicture;
  private LocalDateTime startTime;
    private LocalDateTime updateTime;


  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }


  public String getFromId() {
    return fromId;
  }

  public void setFromId(String fromId) {
    this.fromId = fromId;
  }


  public String getToId() {
    return toId;
  }

  public void setToId(String toId) {
    this.toId = toId;
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

}
