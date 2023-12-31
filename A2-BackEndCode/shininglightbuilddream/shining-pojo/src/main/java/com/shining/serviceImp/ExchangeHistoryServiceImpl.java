package com.shining.serviceImp;

;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shining.entity.ExchangeHistory;
import com.shining.mapper.ExchangeHistoryMapper;
import com.shining.service.IExchangeHistoryService;
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
public class ExchangeHistoryServiceImpl extends ServiceImpl<ExchangeHistoryMapper, ExchangeHistory> implements IExchangeHistoryService {

}
