package com.shining.serviceImp;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shining.entity.Donator;
import com.shining.mapper.DonatorMapper;
import com.shining.service.IDonatorService;
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
public class DonatorServiceImpl extends ServiceImpl<DonatorMapper, Donator> implements IDonatorService {

}
