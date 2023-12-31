package com.shining.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.shining.entity.LoveProject;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author baomidou
 * @since 2023-11-03
 */
public interface ILoveProjectService extends IService<LoveProject> {
    List<LoveProject> getGiftList();
}
