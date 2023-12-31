package com.shining.serviceImp;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shining.entity.LovePlan;
import com.shining.mapper.LovePlanMapper;
import com.shining.service.ILovePlanService;
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
public class LovePlanServiceImpl extends ServiceImpl<LovePlanMapper, LovePlan> implements ILovePlanService {

}
