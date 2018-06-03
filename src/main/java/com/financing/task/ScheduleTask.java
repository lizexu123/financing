package com.financing.task;

import com.financing.entity.Project;
import com.financing.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**定时任务
 * @author penny
 */

@Component
public class ScheduleTask {

    @Autowired
    private ProjectService projectService;
    /**
     * 项目融资状态
     */
    @Scheduled(cron ="0/30 * * * * ?")
    public void projectStatus(){//间隔30秒执行一次
        List<Project> projectList= projectService.getProjectList();
        for (Project project:projectList) {
            Date now = new Date();
            Date endTime = project.getEndTime();
            BigDecimal goalAmount = project.getGoalAmount();
            BigDecimal actualAmount = project.getActualAmount();
            System.out.println("now:"+now+", end:"+endTime);
            System.out.println("////"+goalAmount+"////"+actualAmount);
            System.out.println(goalAmount.compareTo(actualAmount));
            if (now.compareTo(endTime)>=0){//已到期
                if (goalAmount.compareTo(actualAmount)<=0){//已完成融资
                   if (project.getStatus()!=3) {
                       project.setStatus((byte) 3);
                       projectService.updateProject(project);
                   }
                }else {//未完成融资
                    if (project.getStatus()!=2){
                        project.setStatus((byte) 2);
                        projectService.updateProject(project);
                    }
                }
            }else{//未到期
                if (goalAmount.compareTo(actualAmount)<=0){//已完成融资
                    if (project.getStatus()!=1){
                        project.setStatus((byte) 1);
                        projectService.updateProject(project);
                    }
                }else{//未完成融资
                    if (project.getStatus()!=0){
                        project.setStatus((byte) 0);
                        projectService.updateProject(project);
                    }
                }

            }
        }
    }
}
