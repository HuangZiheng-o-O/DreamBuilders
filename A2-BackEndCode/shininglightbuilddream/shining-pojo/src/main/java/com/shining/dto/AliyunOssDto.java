package com.shining.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AliyunOssDto {
    private String accessKeyId;
    private String accessKeySecret;
    private String securityToken;
    private String expiration;
}
