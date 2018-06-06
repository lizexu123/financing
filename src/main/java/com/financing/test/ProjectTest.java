package com.financing.test;

import com.financing.entity.Order;
import com.financing.entity.Project;
import com.financing.entity.User;
import com.financing.service.OrderService;
import com.financing.service.ProjectService;
import com.financing.service.UserService;
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

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

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
//            if (project.getStatus()==2){
//                List<Order> orders = orderService.getOrderListByProject(project);
//                for (Order order:orders) {
//                    if(order.getStatus()==0){//融资失败退款，用户账户余额变更，订单状态改变
//                        BigDecimal amount = order.getAmount();
//                        User user = order.getUser();
//                        userService.refundBalance(user,amount);
//                        order.setStatus((byte) -2);
//                        orderService.refundOrder(order);
//                    }
//                }
//            }
        }
    }

    @Test
    public void projectByUserTest(){
        User user = new User();
        user.setId("994622138");
        List<Project> projects = projectService.getProjectByUser(user);

        System.out.println(projects);
    }

    @Test
    public void projectByCID(){
        List<Project> projects = projectService.getProjectByCID(1);
    }

    @Test
    public void orderRefund(){
        List<Order> orders = orderService.getOrderListByPStatus((byte) 2);
    }

    @Test
    public void testProject(){
        Project project = projectService.getProject("PJ96589566");
        System.out.println(project);
    }
}
