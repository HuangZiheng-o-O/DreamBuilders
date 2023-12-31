package com.shining.dto;

import com.shining.entity.Child;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChildDetailDto {
    private Child child;
    private Integer beingFocusOn;
    private Integer beingDonated;
    private Integer donationReceived;
}
