package com.shining.dto;

import com.shining.entity.LoveProject;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LoveProjectDetailDto {
    private LoveProject loveProject;
    private Integer beingFocusOn;
    private Integer donationReceived;
}
