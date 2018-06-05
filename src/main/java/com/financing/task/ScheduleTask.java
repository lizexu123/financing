package com.financing.task;

import com.financing.entity.Order;
import com.financing.entity.Project;
import com.financing.entity.User;
import com.financing.service.OrderService;
import com.financing.service.ProjectService;
import com.financing.service.UserService;
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


    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

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
            if (project.getStatus()==2){//融资失败
                List<Order> orders = orderService.getOrderListByProject(project);
                for (Order order:orders) {
                    if(order.getStatus()==0){//融资失败退款，用户账户余额变更，订单状态改变
                        BigDecimal amount = order.getAmount();
                        User user = order.getUser();
                        System.out.println(amount);
                        userService.refundBalance(user,amount);
                        order.setStatus((byte) -2);
                        orderService.refundOrder(order);
                    }
                }
            }
        }
    }
}
