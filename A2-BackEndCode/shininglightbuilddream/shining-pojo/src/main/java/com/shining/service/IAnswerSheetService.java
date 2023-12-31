package com.shining.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.shining.entity.AnswerSheet;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author baomidou
 * @since 2023-11-03
 */
public interface IAnswerSheetService extends IService<AnswerSheet> {

    AnswerSheet  getAnswerSheet(String taskId, String childId);

    List<AnswerSheet> getAnswerSheetList(String taskId);
}
