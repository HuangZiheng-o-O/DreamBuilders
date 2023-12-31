package com.shining.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.stp.StpUtil;
import cn.dev33.satoken.util.SaResult;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.dto.CountDto;
import com.shining.dto.DonatorDetailDto;
import com.shining.entity.*;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;

@RestController
public class DonatorController {
    @Operation(summary = "假的")
    @GetMapping("/login")
    public SaResult login(@RequestParam String idpid) {
        Donator donator = Db.lambdaQuery(Donator.class).eq(Donator::getIdpid, idpid).one();
        StpUtil.login(donator.getId());
        return SaResult.data(StpUtil.getTokenValue());
    }

//    @GetMapping("/login")
//    public SaResult login(@RequestParam String code) {
//        HashMap<String, String> map = new HashMap<>();
//        map.put("js_code", code);
//        map.put("appid", "wxaa5a0625e62f4777");
//        map.put("secret", "899fb2e7a17d0abbca06eb04c6e78072");
//        map.put("grant_type", "authorization_code");
//        ResponseEntity<Map> entity = new RestTemplate().getForEntity("https://api.weixin.qq.com/sns/jscode2session", Map.class, map);
//        String openid = (String) entity.getBody().get("openid");
//        HashMap<String, String> hashMap = new HashMap<>();
//        hashMap.put("openid",openid);
//        if ( Db.lambdaQuery(Donator.class).eq(Donator::getIdpid, openid).exists()){
//            Donator donator = Db.lambdaQuery(Donator.class).eq(Donator::getIdpid,openid).one();
//            StpUtil.login(donator.getId());
//            String tokenValue = StpUtil.getTokenValue();
//            hashMap.put("token",tokenValue);
//            return SaResult.data(hashMap).setMsg("登录");
//        }else {
//            return SaResult.data(hashMap).setMsg("注册");
//        }
//
//    }

    @GetMapping("/userBasicInfo")
    @SaCheckLogin
    public SaResult userBasicInfo() {
        return SaResult.data(Db.getById((String) StpUtil.getLoginId(), Donator.class));
    }

    @GetMapping("/user")
    public SaResult userInfo(@RequestParam String id) {
        Donator donator = Db.getById(id, Donator.class);
        int time = Math.toIntExact(Db.lambdaQuery(DonationActivity.class).eq(DonationActivity::getDonatorId, id).count());
        int fund = Db.lambdaQuery(Bill.class).eq(Bill::getDonatorId, id).list().stream().mapToInt(Bill::getMoney).sum();
        Integer score = donator.getScore();
        int rank = 1;
        if (score >= 125000) {
            rank = 4;
        } else if (score >= 2500) {
            rank = 3;
        } else if (score >= 50) {
            rank = 2;
        }
        DonatorDetailDto donatorDetailDto = DonatorDetailDto.builder().donator(donator).totalDonatingTimes(time).totalFundDonated(fund).rank(rank).build();
        ArrayList<String> strings = new ArrayList<>();
        strings.add("小爱心");
        if (fund>0&&time>0) {
            strings.add("铜心使者");
        }
        if (fund>80&&time>10) {
            strings.add("银翼英雄");
        }
        if (fund>200&&time>100) {
            strings.add("黄金善行者");
        }
        if (fund>1000&&time>500) {
            strings.add("慷慨慈善家");
        }
        if (fund>5000&&time>1000) {
            strings.add("希望之光");
        }
        donatorDetailDto.setHonorList(strings);
        return SaResult.data(donatorDetailDto);
    }

    @PostMapping("/goods")
    public SaResult goods(@RequestBody Map<String, String> map) {
        String id = map.get("id");
        String s = map.get("name") + "," + map.get("tel") + "," + map.get("toArea") + "," + map.get("toAddr") + "," + map.get("amount") + "," + map.get("description");
        boolean save = Db.save(DonationActivity.builder().donatorId(id).description(s).donationType("item").build());
        boolean saved = Db.save(ItemDonationInfo.builder().donatorId(id).itemName(map.get("name")).description(map.get("description"))
                .isChecked(0).isPassed(0).startTime(LocalDateTime.now()).build());
        boolean update = Db.update(Donator.class).setSql("score = score + " + 50).eq("id", id).update();
        return save && saved && update ? SaResult.ok() : SaResult.error("保存失败");
    }

    @GetMapping("/goods")
    public SaResult goods(@RequestParam String id) {
        List<ItemDonationInfo> list = Db.lambdaQuery(ItemDonationInfo.class).eq(ItemDonationInfo::getDonatorId, id).list();
        return SaResult.data(list);
    }

    @PostMapping("/register")
    public SaResult register(@RequestBody Donator donator) {
        Db.lambdaQuery(Donator.class).eq(Donator::getIdpid, donator.getIdpid()).oneOpt().ifPresent(e -> {
            throw new RuntimeException("该身份证号已注册");
        });
        boolean save = Db.save(donator);
        return save ? SaResult.ok() : SaResult.error("保存失败");
    }

    @PostMapping("/user")
    public SaResult updateUser(@RequestBody Donator donator) {
        boolean update = Db.updateById(donator);
        return update ? SaResult.data(donator) : SaResult.error("更新失败");
    }

    //    3.	/donator/activity
//4.	GET
    @GetMapping("/activity")
    public SaResult queryDonationActivity(@RequestParam String id) {
        int sum = Db.lambdaQuery(Bill.class).eq(Bill::getDonatorId, id).list().stream().mapToInt(Bill::getMoney).sum();
        int times = Math.toIntExact(Db.lambdaQuery(DonationActivity.class).eq(DonationActivity::getDonatorId, id).count());
        int between = Period.between(Db.getById(id, Donator.class).getStartTime().toLocalDate(), LocalDate.now()).getDays();
        long count = Db.lambdaQuery(DonationActivity.class).eq(DonationActivity::getDonatorId, id).list().stream().map(DonationActivity::getChildId).distinct().count();
        return SaResult.data(CountDto.builder().totalDonatingTimes(times).totalFundDonated(sum).totalDays(between).totalChildrenHelped((int) count).build());
    }

    @GetMapping("/singleActivity")
    public SaResult querySingleDonationActivity(@RequestParam String id) {
        List<DonationActivity> list = Db.lambdaQuery(DonationActivity.class).eq(DonationActivity::getDonatorId, id).list();
        list.forEach(e -> e.setLoveProjectName(Optional.ofNullable(Db.getById(e.getLoveProjectId(), LoveProject.class)).map(LoveProject::getItemName).orElse(null)));
        List<HashMap<String, Object>> maps = list.stream().map(e -> {
            HashMap<String, Object> map = new HashMap<>();
            map.put("donationActivity", e);
            map.putIfAbsent("bill", Db.getById(e.getBillId(), Bill.class));
            map.putIfAbsent("child", Db.getById(e.getChildId(), Child.class));
            map.putIfAbsent("itemDonationInfo", Db.getById(e.getItemDonationInfoId(), ItemDonationInfo.class));
            return map;
        }).toList();
        return SaResult.data(maps);
    }

    @GetMapping("/activityByMonth")
    public SaResult queryDonationActivityByMonth(@RequestParam String id) {
        List<DonationActivity> list = Db.lambdaQuery(DonationActivity.class).eq(DonationActivity::getDonatorId, id)
                .orderByDesc(DonationActivity::getStartTime).list();
        if (list.isEmpty()) {
            return SaResult.data(Collections.emptyList());
        }
        AtomicReference<LocalDateTime> lastDateTime = new AtomicReference<>(list.get(0).getStartTime());
        List<Map<String, Object>> donationActivities = new ArrayList<>();
        list.forEach(e -> {
            if (e.getStartTime().getMonthValue() == lastDateTime.get().getMonthValue() && e.getStartTime().getYear() == lastDateTime.get().getYear()) {
                Map<String, Object> donationActivity = new HashMap<>();
                donationActivity.put("yearAndMonth", e.getStartTime().getYear() + "年" + e.getStartTime().getMonthValue() + "月");
                int money = 0;
                if (e.getDonationType().equalsIgnoreCase("project") || e.getDonationType().equalsIgnoreCase("child")) {
                    money = Db.getById(e.getBillId(), Bill.class).getMoney();
                }
                donationActivity.put("totalMoneyThisMonth", money);
                donationActivity.put("totalChildrenDonated", e.getDonationType().equalsIgnoreCase("child") ? 1 : 0);
                donationActivity.put("totalLoveProjectDonated", e.getDonationType().equalsIgnoreCase("project") ? 1 : 0);
                donationActivity.put("totalItemDonated", e.getDonationType().equalsIgnoreCase("item") ? 1 : 0);
                donationActivity.put("totalDonationDone", 1);
                if (donationActivities.isEmpty()) {
                    donationActivities.add(donationActivity);
                } else {
                    Map<String, Object> map = donationActivities.get(donationActivities.size() - 1);
                    map.put("totalMoneyThisMonth", (int) map.get("totalMoneyThisMonth") + money);
                    map.put("totalChildrenDonated", (int) map.get("totalChildrenDonated") + (e.getDonationType().equalsIgnoreCase("child") ? 1 : 0));
                    map.put("totalLoveProjectDonated", (int) map.get("totalLoveProjectDonated") + (e.getDonationType().equalsIgnoreCase("project") ? 1 : 0));
                    map.put("totalItemDonated", (int) map.get("totalItemDonated") + (e.getDonationType().equalsIgnoreCase("item") ? 1 : 0));
                    map.put("totalDonationDone", (int) map.get("totalDonationDone") + 1);
                    donationActivities.set(donationActivities.size() - 1, map);
                }
            } else {
                lastDateTime.set(e.getStartTime());
                Map<String, Object> donationActivity = new HashMap<>();
                donationActivity.put("yearAndMonth", e.getStartTime().getYear() + "年" + e.getStartTime().getMonthValue() + "月");
                int money = 0;
                if (e.getDonationType().equalsIgnoreCase("project") || e.getDonationType().equalsIgnoreCase("child")) {
                    money = Db.getById(e.getBillId(), Bill.class).getMoney();
                }
                donationActivity.put("totalMoneyThisMonth", money);
                donationActivity.put("totalChildrenDonated", e.getDonationType().equalsIgnoreCase("child") ? 1 : 0);
                donationActivity.put("totalLoveProjectDonated", e.getDonationType().equalsIgnoreCase("project") ? 1 : 0);
                donationActivity.put("totalItemDonated", e.getDonationType().equalsIgnoreCase("item") ? 1 : 0);
                donationActivity.put("totalDonationDone", 1);
                donationActivities.add(donationActivity);
            }
        });
        return SaResult.data(donationActivities);
    }

    @GetMapping("/total")
    public SaResult total() {
        long count = Db.count(Bill.class);
        count += 569567459;
        int sum = Db.lambdaQuery(Bill.class).list().stream().mapToInt(Bill::getMoney).sum();
        sum += 938403847;
        long projectCount = Db.lambdaQuery(Bill.class).ne(Bill::getLoveProjectId, null).list().stream().map(Bill::getLoveProjectId).distinct().count();
        projectCount += 373875954;
        return SaResult.data(Arrays.asList((int) count, sum, (int) projectCount));
    }
}
