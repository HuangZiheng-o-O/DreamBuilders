package com.shining.serviceImp;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.entity.AnswerSheet;
import com.shining.mapper.AnswerSheetMapper;
import com.shining.service.IAnswerSheetService;
import org.springframework.stereotype.Service;

import java.util.List;

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
public class AnswerSheetServiceImpl extends ServiceImpl<AnswerSheetMapper, AnswerSheet> implements IAnswerSheetService {
    @Override
    public AnswerSheet  getAnswerSheet(String taskId, String childId) {
        return Db.lambdaQuery(AnswerSheet.class)
                .eq(AnswerSheet::getTaskId, taskId)
                .eq(AnswerSheet::getChildId, childId).last("limit 1").one();
    }

    @Override
    public List<AnswerSheet> getAnswerSheetList(String taskId) {
        return Db.lambdaQuery(AnswerSheet.class)
                .eq(AnswerSheet::getTaskId, taskId)
                .list();
    }
}
