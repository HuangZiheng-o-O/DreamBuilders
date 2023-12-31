package com.shining.serviceImp;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shining.entity.ChatInfo;
import com.shining.mapper.ChatInfoMapper;
import com.shining.service.IChatInfoService;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author baomidou
 * @since 2023-11-03
 */
@Service
public class ChatInfoServiceImpl extends ServiceImpl<ChatInfoMapper, ChatInfo> implements IChatInfoService {

}
