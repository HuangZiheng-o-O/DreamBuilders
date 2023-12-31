package com.shining.dto;


import com.shining.entity.AnswerSheet;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class AnswerSheetScoreMaxDTO {
    private AnswerSheet answerSheet;
    private double scoreMax;

}
