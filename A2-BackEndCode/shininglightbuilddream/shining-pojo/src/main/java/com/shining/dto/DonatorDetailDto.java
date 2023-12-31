package com.shining.dto;

import com.shining.entity.Donator;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DonatorDetailDto {
    //    ⑦	totalFundDonated int,
//⑧	totalDonatingTimes int,
//⑨	rank int（等级，分金、银、铜、铁四级，取值分别为4、3、2、1，判断依据是score大等于125000、2500、50、0）
//⑩	honorList（对象列表）
    private Integer totalFundDonated;
    private Integer totalDonatingTimes;
    private Integer rank;
    private List<String> honorList;
    private Donator donator;
}
