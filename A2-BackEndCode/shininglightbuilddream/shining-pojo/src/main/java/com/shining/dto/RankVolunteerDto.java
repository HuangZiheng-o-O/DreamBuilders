package com.shining.dto;

import com.shining.entity.VolunteerCredit;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RankVolunteerDto {

    private Integer place;
    private List<VolunteerCredit> volunteerCreditList;
}
