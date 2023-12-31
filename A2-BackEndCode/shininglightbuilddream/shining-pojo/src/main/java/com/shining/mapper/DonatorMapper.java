package com.shining.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.shining.entity.Donator;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author baomidou
 * @since 2023-11-03
 */
@Mapper
public interface DonatorMapper extends BaseMapper<Donator> {

    /**
     * <p>
     *  服务类
     * </p>
     *
     * @author baomidou
     * @since 2023-11-03
     */
}
