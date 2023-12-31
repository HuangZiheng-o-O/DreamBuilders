package com.shining.dto;

import com.shining.entity.CallRecord;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class ChildMessageDto {
    private String avatar;
    private String name;
    private CallRecord newMessage;
    private String childId;
}
