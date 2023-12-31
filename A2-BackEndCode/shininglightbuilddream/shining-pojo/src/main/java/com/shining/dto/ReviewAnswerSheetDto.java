package com.shining.dto;

import com.shining.entity.AnswerSheet;
import com.shining.entity.MarkingResult;
import com.shining.entity.Task;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class ReviewAnswerSheetDto {
    private Task task;
    private AnswerSheet answerSheet;
    private List<MarkingResult> markingResultList;
}
