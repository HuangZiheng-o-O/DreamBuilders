package com.shining.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.shining.entity.ChildVolunteer;
import com.shining.entity.Report;

import java.util.List;

public interface ResponseService extends IService<ChildVolunteer> {


    List<ChildVolunteer> getCorrespondingVolunteer(String childId);

    Report getStageReport(String childId, String volunteerId);
}
