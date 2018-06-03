package com.financing.test;

import com.financing.entity.Project;
import com.financing.service.ProjectService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Penny on 2018/5/17.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext.xml"})
public class ProjectTest {

    @Autowired
    private ProjectService projectService;

    @Test
    public void projectStatusTest(){
        List<Project> projectList= projectService.getProjectList();
        for (Project project:projectList) {
            Date now = new Date();
            Date endTime = project.getEndTime();
            BigDecimal goalAmount = project.getGoalAmount();
            BigDecimal actualAmount = project.getActualAmount();
            System.out.println("////"+goalAmount+"////"+actualAmount);
            System.out.println(goalAmount.compareTo(actualAmount));
            if (now.compareTo(endTime)>=0){//已到期
                System.out.println("now:"+now+", end:"+endTime);


                if (goalAmount.compareTo(actualAmount)<=0){//已完成融资
                    System.out.println("goal:"+goalAmount+",actual:"+actualAmount);
                    if (project.getStatus()!=3) {
                        System.out.println(project.getStatus());
                        project.setStatus((byte) 3);
                        projectService.updateProject(project);
                    }
                }else {//未完成融资
                    if (project.getStatus()!=2){
                        System.out.println(project.getStatus());
                        project.setStatus((byte) 2);
                        projectService.updateProject(project);
                    }
                }
            }else{//未到期
                System.out.println("now:"+now+", end:"+endTime);
                if (goalAmount.compareTo(actualAmount)<=0){//已完成融资
                    System.out.println("goal:"+goalAmount+",actual:"+actualAmount);
                    if (project.getStatus()!=1){
                        System.out.println(project.getStatus());
                        project.setStatus((byte) 1);
                        projectService.updateProject(project);
                    }
                }else{//未完成融资
                    if (project.getStatus()!=0){
                        System.out.println(project.getStatus());
                        project.setStatus((byte) 0);
                        projectService.updateProject(project);
                    }
                }

            }
        }
    }

}
