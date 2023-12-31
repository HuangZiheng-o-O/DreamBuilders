package com.shining.serviceImp;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shining.entity.ItemDonationInfo;
import com.shining.mapper.ItemDonationInfoMapper;
import com.shining.service.IItemDonationInfoService;
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
public class ItemDonationInfoServiceImpl extends ServiceImpl<ItemDonationInfoMapper, ItemDonationInfo> implements IItemDonationInfoService {

}
