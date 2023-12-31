package com.shining.serviceImp;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.entity.MarkingResult;
import com.shining.mapper.MarkingResultMapper;
import com.shining.service.IMarkingResultService;
import org.springframework.stereotype.Service;

import java.util.Collections;
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
public class MarkingResultServiceImpl extends ServiceImpl<MarkingResultMapper, MarkingResult> implements IMarkingResultService {
    @Override
    public List<MarkingResult> getMarkingResultsList(String answerSheetId) {
        List<MarkingResult> list = Db.lambdaQuery(MarkingResult.class)
                .eq(MarkingResult::getAnswerId, answerSheetId)
                .list();
        if (list.isEmpty()) {
            return Collections.emptyList();
        }
        return list;
    }
}
