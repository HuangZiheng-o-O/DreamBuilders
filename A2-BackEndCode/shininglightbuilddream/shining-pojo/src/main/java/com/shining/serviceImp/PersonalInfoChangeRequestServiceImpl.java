package com.shining.serviceImp;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shining.entity.PersonalInfoChangeRequest;
import com.shining.mapper.PersonalInfoChangeRequestMapper;
import com.shining.service.IPersonalInfoChangeRequestService;
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
public class PersonalInfoChangeRequestServiceImpl extends ServiceImpl<PersonalInfoChangeRequestMapper, PersonalInfoChangeRequest> implements IPersonalInfoChangeRequestService {

}
