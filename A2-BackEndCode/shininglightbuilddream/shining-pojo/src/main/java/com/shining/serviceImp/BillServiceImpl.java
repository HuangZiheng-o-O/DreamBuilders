package com.shining.serviceImp;



import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shining.entity.Bill;
import com.shining.mapper.BillMapper;
import com.shining.service.IBillService;
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
public class BillServiceImpl extends ServiceImpl<BillMapper, Bill> implements IBillService {

}
