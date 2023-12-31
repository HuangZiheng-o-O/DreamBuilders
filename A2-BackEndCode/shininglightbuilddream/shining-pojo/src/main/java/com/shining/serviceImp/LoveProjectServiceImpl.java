package com.shining.serviceImp;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.entity.LoveProject;
import com.shining.mapper.LoveProjectMapper;
import com.shining.service.ILoveProjectService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author baomidou
 * @since 2023-11-03
 */
@Service
public class LoveProjectServiceImpl extends ServiceImpl<LoveProjectMapper, LoveProject> implements ILoveProjectService {
    @Override
    public List<LoveProject> getGiftList() {
        return Db.lambdaQuery(LoveProject.class)
                .list();
    }
}
