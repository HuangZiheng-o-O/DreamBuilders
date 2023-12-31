package com.shining.dto;

import com.shining.entity.AnswerSheet;
import com.shining.entity.MarkingResult;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AnswerSheetDTO {
    private AnswerSheet answerSheet;
    private List<MarkingResult> markingResultList;
    private Integer isRemarked;
    private Integer isNecessary;


}