package com.shining.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@Data
@NoArgsConstructor
public class ChildCreditStatistics {
    private Integer creditThisMonth;
    private Integer month;
}
