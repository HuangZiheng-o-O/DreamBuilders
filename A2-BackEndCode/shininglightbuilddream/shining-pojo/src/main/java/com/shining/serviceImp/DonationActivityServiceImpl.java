package com.shining.serviceImp;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shining.entity.DonationActivity;
import com.shining.mapper.DonationActivityMapper;
import com.shining.service.IDonationActivityService;
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
public class DonationActivityServiceImpl extends ServiceImpl<DonationActivityMapper, DonationActivity> implements IDonationActivityService {

}
