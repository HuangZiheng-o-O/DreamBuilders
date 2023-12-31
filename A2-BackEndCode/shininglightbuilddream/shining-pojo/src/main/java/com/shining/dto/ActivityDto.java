package com.shining.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ActivityDto {
    private LocalDateTime startTime;
    private Integer type;
    private String avatar;
    private String detail;
}
