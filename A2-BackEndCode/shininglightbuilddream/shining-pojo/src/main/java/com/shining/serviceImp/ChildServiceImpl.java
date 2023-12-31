package com.shining.serviceImp;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shining.entity.Child;
import com.shining.mapper.ChildMapper;
import com.shining.service.IChildService;
import org.springframework.stereotype.Service;

;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author baomidou
 * @since 2023-11-03
 */
@Service
public class ChildServiceImpl extends ServiceImpl<ChildMapper, Child> implements IChildService {
}
