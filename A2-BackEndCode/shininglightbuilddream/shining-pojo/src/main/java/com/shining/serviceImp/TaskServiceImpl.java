package com.shining.serviceImp;

;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.shining.entity.Task;
import com.shining.entity.TaskHistory;
import com.shining.mapper.TaskMapper;
import com.shining.service.ITaskService;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author baomidou
 * @since 2023-11-03
 */
@Service
public class TaskServiceImpl extends ServiceImpl<TaskMapper, Task> implements ITaskService {
    @Override
    public List<Task> getTaskList(String childId) {
        List<TaskHistory> taskHistories = Db.lambdaQuery(TaskHistory.class)
                .eq(TaskHistory::getChildId, childId).list();
        HashSet<String> taskIds = new HashSet<>();
        taskHistories.forEach(taskHistory -> taskIds.add(taskHistory.getTaskId()));
        if (taskIds.isEmpty()) return Collections.emptyList();
        return this.listByIds(taskIds.stream().toList());
    }
}
