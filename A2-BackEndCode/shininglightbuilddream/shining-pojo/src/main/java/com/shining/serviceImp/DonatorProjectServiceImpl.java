package com.shining.serviceImp;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shining.entity.DonatorProject;
import com.shining.mapper.DonatorProjectMapper;
import com.shining.service.IDonatorProjectService;
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
public class DonatorProjectServiceImpl extends ServiceImpl<DonatorProjectMapper, DonatorProject> implements IDonatorProjectService {

}
