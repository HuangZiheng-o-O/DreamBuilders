package com.shining.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class CountDto {
    private Integer totalFundDonated;
    private Integer totalDonatingTimes;
    private Integer totalDays;
    private Integer totalChildrenHelped;
}
