package com.shining.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class TaskFinishDto {
//    // type ChildTaskFinishDetailsDTO = {
////     points: number,
////     studyDays: number,
////     completedTasks: number,
////     completionRate: number,
//// }
    private Integer points;
    private Integer studyDays;
    private Integer completedTasks;
    private Double completionRate;
}
