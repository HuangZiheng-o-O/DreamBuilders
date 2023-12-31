package com.shining.service;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.auth.sts.AssumeRoleRequest;
import com.aliyuncs.auth.sts.AssumeRoleResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.shining.dto.AliyunOssDto;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
@Tag(name = "AliyunOssService", description = "阿里云oss服务")
//阿里云oss服务
public class AliyunOssService {
    @Value("${aliyun.AccessKey-ID}")
    private String accessKeyID;
    @Value("${aliyun.AccessKey-Secret}")
    private String accessKeySecret;
    @Value("${aliyun.timeout}")
    private Long timeout;
    @Value("${aliyun.arn}")
    private String arn;
    @Value("${aliyun.endpoint}")
    private String endpoint;
    @Value("${aliyun.Region-ID}")
    private String regionId;
    /*
    * @param roleSessionName 角色会话名称
    * @return AliyunOssDto 阿里云oss临时凭证
    * @throws RuntimeException
    * */
    public AliyunOssDto getStsToken(String roleSessionName) {
        String policy = """
                {
                    "Version": "1",\s
                    "Statement": [
                        {
                            "Action": [
                                "oss:PutObject"
                            ],\s
                            "Resource": [
                                "acs:oss:*:*:shining-dream/*"\s
                            ],\s
                            "Effect": "Allow"
                        }
                    ]
                }""";
        try {
            DefaultProfile.addEndpoint(regionId, "Sts", endpoint);
            IClientProfile profile = DefaultProfile.getProfile(regionId, accessKeyID, accessKeySecret);
            DefaultAcsClient client = new DefaultAcsClient(profile);
            final AssumeRoleRequest request = new AssumeRoleRequest();
            request.setSysMethod(MethodType.POST);
            request.setRoleArn(arn);
            request.setRoleSessionName(roleSessionName);
            request.setPolicy(policy);
            request.setDurationSeconds(timeout);
            final AssumeRoleResponse response = client.getAcsResponse(request);
            return AliyunOssDto.builder()
                    .accessKeyId(response.getCredentials().getAccessKeyId())
                    .accessKeySecret(response.getCredentials().getAccessKeySecret())
                    .securityToken(response.getCredentials().getSecurityToken())
                    .expiration(response.getCredentials().getExpiration())
                    .build();
        } catch (ClientException e) {
            String message = String.format("Failed：Error code: %s\nError message: %s\nRequestId: %s",
                    e.getErrCode(), e.getErrMsg(), e.getRequestId());
           throw new RuntimeException(message);
        }
    }

}
