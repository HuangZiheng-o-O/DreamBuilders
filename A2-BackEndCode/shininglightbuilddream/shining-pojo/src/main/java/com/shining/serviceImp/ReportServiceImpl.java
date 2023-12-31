package com.shining.serviceImp;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shining.entity.Report;
import com.shining.mapper.ReportMapper;
import com.shining.service.IReportService;
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
public class ReportServiceImpl extends ServiceImpl<ReportMapper, Report> implements IReportService {

}
