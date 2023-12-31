package com.shining.serviceImp;

;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shining.entity.ChildCredit;
import com.shining.mapper.ChildCreditMapper;
import com.shining.service.IChildCreditService;
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
public class ChildCreditServiceImpl extends ServiceImpl<ChildCreditMapper, ChildCredit> implements IChildCreditService {

}
