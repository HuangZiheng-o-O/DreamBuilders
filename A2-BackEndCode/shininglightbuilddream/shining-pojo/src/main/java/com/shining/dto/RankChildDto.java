package com.shining.dto;

import com.shining.entity.ChildCredit;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RankChildDto {
    private Integer place;
    private List<ChildCredit>  childCreditList;
}
