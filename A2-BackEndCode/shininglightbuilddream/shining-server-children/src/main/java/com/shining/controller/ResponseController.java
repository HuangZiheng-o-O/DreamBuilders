/**
 * -- Drop the existing database if it exists and create a new one
 * DROP DATABASE IF EXISTS shining_light_build_dream;
 * CREATE DATABASE shining_light_build_dream;
 * USE shining_light_build_dream;
 * <p>
 * -- Create donator table with VARCHAR(255) for id
 * CREATE TABLE donator (
 * id VARCHAR(255) PRIMARY KEY,
 * idpid VARCHAR(255),
 * avatar VARCHAR(255) NULL,
 * name VARCHAR(255) NULL,
 * age INT NULL,
 * tel VARCHAR(255) NULL,
 * sex CHAR(1) NULL,
 * province VARCHAR(255) NULL,
 * city VARCHAR(255) NULL,
 * district VARCHAR(255) NULL,
 * detailed_address VARCHAR(255) NULL,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * remark TEXT NULL
 * <p>
 * );
 * <p>
 * -- Create child table with VARCHAR(255) for id
 * CREATE TABLE child (
 * id VARCHAR(255) PRIMARY KEY,
 * tel VARCHAR(255),
 * account VARCHAR(255) NULL,
 * password VARCHAR(255) NULL,
 * avatar VARCHAR(255) NULL,
 * name VARCHAR(255) NULL,
 * age INT NULL,
 * gender CHAR(1) NULL,
 * is_orphan INT NULL,
 * is_left_behind INT NULL,
 * is_disability INT NULL,
 * description TEXT NULL,
 * province VARCHAR(255) NULL,
 * city VARCHAR(255) NULL,
 * district VARCHAR(255) NULL,
 * detailed_address VARCHAR(255) NULL,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * remark TEXT NULL
 * );
 * <p>
 * -- Create volunteer table with VARCHAR(255) for id
 * CREATE TABLE volunteer (
 * id VARCHAR(255) PRIMARY KEY,
 * account VARCHAR(255) NULL,
 * password VARCHAR(255) NULL,
 * avatar VARCHAR(255) NULL,
 * name VARCHAR(255) NULL,
 * age INT NULL,
 * gender CHAR(1) NULL,
 * has_authority INT NULL,
 * province VARCHAR(255) NULL,
 * city VARCHAR(255) NULL,
 * district VARCHAR(255) NULL,
 * description TEXT NULL,
 * detailed_address VARCHAR(255) NULL,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * remark TEXT NULL
 * );
 * -- Create report table with VARCHAR(255) for ids and set foreign keys
 * CREATE TABLE report (
 * id VARCHAR(255) NOT NULL PRIMARY KEY,
 * from_id VARCHAR(255) NOT NULL,
 * to_id VARCHAR(255) NOT NULL,
 * contents_type VARCHAR(255) NULL,
 * contents_text TEXT NULL,
 * contents_picture VARCHAR(255) NULL,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * FOREIGN KEY (from_id) REFERENCES volunteer (id),
 * FOREIGN KEY (to_id) REFERENCES child (id)
 * );
 * -- Create love_project table with VARCHAR(255) for id
 * CREATE TABLE love_project (
 * id VARCHAR(255) PRIMARY KEY,
 * title VARCHAR(255) NULL,
 * item_name VARCHAR(255) NULL,
 * fund INT NULL,
 * amount INT NULL,
 * required_credit INT NULL,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * remark TEXT NULL
 * );
 * <p>
 * -- Create personal_info_change_request table with VARCHAR(255) for id
 * CREATE TABLE personal_info_change_request (
 * id VARCHAR(255) NOT NULL PRIMARY KEY,
 * applicant_id VARCHAR(255) NOT NULL,
 * contents_text TEXT NULL,
 * is_visited INT NOT NULL DEFAULT 0,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * FOREIGN KEY (applicant_id) REFERENCES child (id)
 * );
 * <p>
 * -- Create task table with VARCHAR(255) for id
 * CREATE TABLE task (
 * id VARCHAR(255) PRIMARY KEY,
 * thumbnail VARCHAR(255) NULL,
 * title VARCHAR(255) NULL,
 * description VARCHAR(255) NULL,
 * deadline DATETIME NULL,
 * contents_type VARCHAR(255) NULL,
 * is_necessary INT NULL,
 * correction_times INT NULL,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * remark TEXT NULL
 * );
 * <p>
 * -- Create answer_sheet table with VARCHAR(255) for ids and set foreign keys
 * CREATE TABLE answer_sheet (
 * id VARCHAR(255) PRIMARY KEY,
 * task_id VARCHAR(255) NOT NULL,
 * child_id VARCHAR(255) NOT NULL,
 * contents_type VARCHAR(255) NULL,
 * contents_picture VARCHAR(255) NULL,
 * contents_video VARCHAR(255) NULL,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * remark TEXT NULL,
 * FOREIGN KEY (task_id) REFERENCES task (id),
 * FOREIGN KEY (child_id) REFERENCES child (id)
 * );
 * -- Create marking_result table with VARCHAR(255) for ids and set foreign keys
 * CREATE TABLE marking_result (
 * id VARCHAR(255) PRIMARY KEY,
 * answer_id VARCHAR(255) NOT NULL,
 * volunteer_id VARCHAR(255) NOT NULL,
 * grade INT NULL,
 * is_checked INT NULL,
 * contents_type VARCHAR(255) NULL,
 * contents_text TEXT NULL,
 * contents_picture VARCHAR(255) NULL,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * remark TEXT NULL,
 * FOREIGN KEY (answer_id) REFERENCES answer_sheet (id),
 * FOREIGN KEY (volunteer_id) REFERENCES volunteer (id)
 * );
 * <p>
 * -- Create love_plan table with VARCHAR(255) for id
 * CREATE TABLE love_plan (
 * id VARCHAR(255) PRIMARY KEY,
 * target_score INT NULL,
 * is_reached INT NULL,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * remark TEXT NULL,
 * donator_id VARCHAR(255) NOT NULL,
 * FOREIGN KEY (donator_id) REFERENCES donator (id)
 * <p>
 * );
 * <p>
 * -- Create exchange_history table with VARCHAR(255) for id and set foreign keys
 * CREATE TABLE exchange_history (
 * id VARCHAR(255) PRIMARY KEY,
 * thumbnail VARCHAR(255) NULL,
 * child_id VARCHAR(255) NOT NULL,
 * love_project_id VARCHAR(255) NULL,
 * amount INT NULL,
 * description TEXT NULL,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * remark TEXT NULL,
 * FOREIGN KEY (child_id) REFERENCES child (id),
 * FOREIGN KEY (love_project_id) REFERENCES love_project (id)
 * );
 * <p>
 * -- Create task_history table with VARCHAR(255) for ids and set foreign keys
 * CREATE TABLE task_history (
 * id VARCHAR(255) PRIMARY KEY,
 * thumbnail VARCHAR(255) NULL,
 * child_id VARCHAR(255) NOT NULL,
 * task_id VARCHAR(255) NOT NULL,
 * description TEXT NULL,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * remark TEXT NULL,
 * FOREIGN KEY (child_id) REFERENCES child (id),
 * FOREIGN KEY (task_id) REFERENCES task (id)
 * );
 * <p>
 * -- Create child_credit table with VARCHAR(255) for ids and set foreign keys
 * CREATE TABLE child_credit (
 * id VARCHAR(255) PRIMARY KEY,
 * child_id VARCHAR(255) NOT NULL,
 * total_gained_credit INT NULL,
 * current_credit INT NULL,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * remark TEXT NULL,
 * FOREIGN KEY (child_id) REFERENCES child (id)
 * );
 * -- Create bill table with VARCHAR(255) for ids and set foreign keys
 * CREATE TABLE bill (
 * id VARCHAR(255) PRIMARY KEY,
 * child_id VARCHAR(255) NOT NULL,
 * donator_id VARCHAR(255) NOT NULL,
 * money INT NULL,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * remark TEXT NULL,
 * FOREIGN KEY (child_id) REFERENCES child (id),
 * FOREIGN KEY (donator_id) REFERENCES donator (id)
 * );
 * <p>
 * -- Create donator_project table with VARCHAR(255) for ids and set foreign keys
 * CREATE TABLE donator_project (
 * id VARCHAR(255) PRIMARY KEY,
 * donator_id VARCHAR(255) NOT NULL,
 * love_project_id VARCHAR(255) NULL,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * remark TEXT NULL,
 * FOREIGN KEY (donator_id) REFERENCES donator (id),
 * FOREIGN KEY (love_project_id) REFERENCES love_project (id)
 * );
 * <p>
 * -- Create donator_child table with VARCHAR(255) for ids and set foreign keys
 * CREATE TABLE donator_child (
 * id VARCHAR(255) PRIMARY KEY,
 * donator_id VARCHAR(255) NOT NULL,
 * child_id VARCHAR(255) NOT NULL,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * remark TEXT NULL,
 * FOREIGN KEY (donator_id) REFERENCES donator (id),
 * FOREIGN KEY (child_id) REFERENCES child (id)
 * );
 * <p>
 * -- Create child_volunteer table with VARCHAR(255) for ids and set foreign keys
 * CREATE TABLE child_volunteer (
 * id VARCHAR(255) PRIMARY KEY,
 * child_id VARCHAR(255) NOT NULL,
 * volunteer_id VARCHAR(255) NOT NULL,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * remark TEXT NULL,
 * FOREIGN KEY (child_id) REFERENCES child (id),
 * FOREIGN KEY (volunteer_id) REFERENCES volunteer (id)
 * );
 * <p>
 * -- Create volunteer_credit table with VARCHAR(255) for id
 * CREATE TABLE volunteer_credit (
 * id VARCHAR(255) PRIMARY KEY,
 * volunteer_id VARCHAR(255) NOT NULL,
 * current_credit INT NULL,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * remark TEXT NULL,
 * FOREIGN KEY (volunteer_id) REFERENCES volunteer (id)
 * );
 * <p>
 * -- Create item_donation_info table with VARCHAR(255) for id and set foreign keys
 * CREATE TABLE item_donation_info (
 * id VARCHAR(255) PRIMARY KEY,
 * item_name VARCHAR(255) NULL,
 * item_picture VARCHAR(255) NULL,
 * description TEXT NULL,
 * donator_id VARCHAR(255) NOT NULL,
 * is_checked INT NULL,
 * is_passed INT NULL,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * remark TEXT NULL,
 * FOREIGN KEY (donator_id) REFERENCES donator (id)
 * );
 * <p>
 * <p>
 * -- Create call_record table with VARCHAR(255) for ids and set foreign keys
 * CREATE TABLE call_record (
 * id VARCHAR(255) NOT NULL PRIMARY KEY,
 * start_time DATETIME NULL,
 * end_time DATETIME NULL,
 * caller_id VARCHAR(255) NOT NULL,
 * receiver_id VARCHAR(255) NOT NULL,
 * duration INT NULL,
 * status ENUM('MISSED', 'ANSWERED', 'DECLINED')  NULL,
 * remark TEXT NULL,
 * FOREIGN KEY (caller_id) REFERENCES volunteer (id),
 * FOREIGN KEY (receiver_id) REFERENCES child (id)
 * );
 * <p>
 * -- Create chat_info table with VARCHAR(255) for ids and set foreign keys
 * CREATE TABLE chat_info (
 * id VARCHAR(255) NOT NULL PRIMARY KEY,
 * poster_id VARCHAR(255) NOT NULL,
 * receiver_id VARCHAR(255) NOT NULL,
 * contents_type VARCHAR(255) NULL,
 * contents_text VARCHAR(255) NULL,
 * contents_picture VARCHAR(255) NULL,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * remark TEXT NULL,
 * FOREIGN KEY (poster_id) REFERENCES child (id),
 * FOREIGN KEY (receiver_id) REFERENCES volunteer (id)
 * );
 * <p>
 * -- Create donation_activity table with VARCHAR(255) for ids and set foreign keys
 * CREATE TABLE donation_activity (
 * id VARCHAR(255) NOT NULL PRIMARY KEY,
 * donator_id VARCHAR(255) NOT NULL,
 * donation_type VARCHAR(255) NULL,
 * child_id VARCHAR(255) NULL,
 * love_project_id VARCHAR(255) NULL,
 * item_donation_info_id VARCHAR(255) NULL,
 * description VARCHAR(255) NULL,
 * start_time DATETIME NULL,
 * update_time DATETIME NULL,
 * remark TEXT NULL,
 * FOREIGN KEY (donator_id) REFERENCES donator (id),
 * FOREIGN KEY (child_id) REFERENCES child (id),
 * FOREIGN KEY (item_donation_info_id) REFERENCES item_donation_info (id),
 * FOREIGN KEY (love_project_id) REFERENCES love_project (id)
 * <p>
 * );
 */


package com.shining.controller;

import cn.dev33.satoken.util.SaResult;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.entity.ChildVolunteer;
import com.shining.entity.Volunteer;
import com.shining.service.ResponseService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/response")
@Tag(name = "查看对应志愿者总结评价")
public class ResponseController {
    @Autowired
    private ResponseService responseService;

    //接口名称：查看小朋友对应志愿者
//接口路径：/child/task/corresponding_volunteer
    @GetMapping("/correspondingVolunteer")
    public SaResult getCorrespondingVolunteer(String childId) {
        List<ChildVolunteer> list = Db.lambdaQuery(ChildVolunteer.class).eq(ChildVolunteer::getChildId, childId).list();
        List<String> list1 = list.stream().map(ChildVolunteer::getVolunteerId).toList();
        return SaResult.data(Db.listByIds(list1, Volunteer.class));
    }

    //    GET接口
//接口名称：查看志愿者给小朋友的阶段性评价
    @GetMapping("/stageReport")
    public SaResult getStageReport(String childId, String volunteerId) {
        return SaResult.data(responseService.getStageReport(childId, volunteerId));
    }
}


