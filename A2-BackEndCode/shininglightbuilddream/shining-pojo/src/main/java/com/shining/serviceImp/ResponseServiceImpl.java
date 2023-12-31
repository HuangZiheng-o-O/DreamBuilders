package com.shining.serviceImp;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.entity.ChildVolunteer;
import com.shining.entity.Report;
import com.shining.mapper.ChildVolunteerMapper;
import com.shining.service.ResponseService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author baomidou
 * @since 2023-11-03
 */
@Service
public class ResponseServiceImpl extends ServiceImpl<ChildVolunteerMapper, ChildVolunteer> implements ResponseService {
    @Override
    public List<ChildVolunteer> getCorrespondingVolunteer(String childId) {
        return Db.lambdaQuery(ChildVolunteer.class)
                .eq(ChildVolunteer::getChildId, childId).list();
    }

    @Override
    public Report getStageReport(String childId, String volunteerId) {
        return Db.lambdaQuery(Report.class)
                .eq(Report::getToId, childId)
                .eq(Report::getFromId, volunteerId).one();
    }

}
