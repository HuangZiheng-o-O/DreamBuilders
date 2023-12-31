package com.shining.serviceImp;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shining.entity.DonatorChild;
import com.shining.mapper.DonatorChildMapper;
import com.shining.service.IDonatorChildService;
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
public class DonatorChildServiceImpl extends ServiceImpl<DonatorChildMapper, DonatorChild> implements IDonatorChildService {

}
