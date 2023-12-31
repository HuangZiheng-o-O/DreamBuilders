package com.shining.controller;

import cn.dev33.satoken.util.SaResult;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.entity.Bill;
import com.shining.entity.DonationActivity;
import com.shining.entity.Donator;
import com.shining.mapper.DonatorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/payment")
public class PaymentController {
    @Autowired
    private DonatorMapper mapper;
    //    ②	id string,
//③	loveProjectId string,
//④	money int
    @GetMapping("/recordFundDonationForChild")
    public SaResult recordFundDonationForChild(String id, String childId, Integer money) {
        Bill bill = Bill.builder().donatorId(id).childId(childId).money(money).build();
        boolean saveBill = Db.save(bill);
        boolean saveActivity = Db.save(DonationActivity.builder().billId(bill.getId()).donatorId(id).childId(childId).donationType("child").description("").build());
        boolean update = Db.update(Donator.class).setSql("score = score + " + money / 10).eq("id", id).update();
        //        int updated = mapper.update(new UpdateWrapper<Donator>().eq("id", id).setSql("score = score + " + money / 10));
//        boolean update = updated!=0;
        return saveActivity && saveBill && update
                ? SaResult.ok("捐款成功") : SaResult.error("捐款失败");
    }

    @GetMapping("/recordFundDonationForProject")
    public SaResult recordFundDonationForProject(String id, String loveProjectId, Integer money) {
        Bill bill = Bill.builder().donatorId(id).loveProjectId(loveProjectId).money(money).build();
        boolean saveBill = Db.save(bill);
        boolean saveActivity = Db.save(DonationActivity.builder().billId(bill.getId()).donatorId(id).loveProjectId(loveProjectId).donationType("project").build());
        boolean update = Db.update(Donator.class).setSql("score = score + " + money / 10).eq("id", id).update();
        return saveActivity && saveBill && update ? SaResult.ok() : SaResult.error("记录失败");

    }
}
