package com.shining.utils;

import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.rules.DbColumnType;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.sql.Types;

public class MybatisGenerator {
    public static void generator(){
        FastAutoGenerator.create("jdbc:mysql://localhost:3306/shining_light_build_dream", "root", "zem509525130")
                .globalConfig(builder -> {
                    builder.enableSpringdoc()
                            .fileOverride() // 覆盖已生成文件
                            .outputDir("D://generation"); // 指定输出目录
                })
                .dataSourceConfig(builder -> builder.typeConvertHandler((globalConfig, typeRegistry, metaInfo) -> {
                    int typeCode = metaInfo.getJdbcType().TYPE_CODE;
                    if (typeCode == Types.SMALLINT) {
                        // 自定义类型转换
                        return DbColumnType.INTEGER;
                    }
                    return typeRegistry.getColumnType(metaInfo);

                }))
                .packageConfig(builder -> {
                    // 设置父包名
                    builder.parent("com.shining.shiningserver")
                            // 设置父包模块名
                            .moduleName("shining-server-children")
                            .service("service")
                            .serviceImpl("impl")
                            .mapper("mapper");
                })
                .strategyConfig(builder -> {
                    builder.entityBuilder().enableLombok();//使用lombok
                    builder.controllerBuilder().enableHyphenStyle()
                            .enableRestStyle();//开启RestController
                    //加入所有数据库表名,表明在类中注释sql内
                    builder.addInclude("answer_sheet")
                            .addInclude("bill")
                            .addInclude("call_record")
                            .addInclude("child")
                            .addInclude("child_credit")
                            .addInclude("child_volunteer")
                            .addInclude("chat_info")
                            .addInclude("donation_activity")
                            .addInclude("donator")
                            .addInclude("donator_child")
                            .addInclude("donator_project")
                            .addInclude("exchange_history")
                            .addInclude("item_donation_info")
                            .addInclude("love_plan")
                            .addInclude("love_project")
                            .addInclude("marking_result")
                            .addInclude("personal_info_change_request")
                            .addInclude("report")
                            .addInclude("task")
                            .addInclude("task_history")
                            .addInclude("volunteer")
                            .addInclude("volunteer_credit")
                    ;

                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }
}
