package com.shining.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.shining.entity.MarkingResult;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author baomidou
 * @since 2023-11-03
 */
public interface IMarkingResultService extends IService<MarkingResult> {
    List<MarkingResult> getMarkingResultsList(String answerSheetId);
}
