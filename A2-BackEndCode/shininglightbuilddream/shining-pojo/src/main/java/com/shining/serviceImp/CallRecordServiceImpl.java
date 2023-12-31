package com.shining.serviceImp;



import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shining.entity.CallRecord;
import com.shining.mapper.CallRecordMapper;
import com.shining.service.ICallRecordService;
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
public class CallRecordServiceImpl extends ServiceImpl<CallRecordMapper, CallRecord> implements ICallRecordService {

}
