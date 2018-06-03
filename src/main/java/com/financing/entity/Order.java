package com.financing.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 订单
 * Created by Penny on 2018/5/20.
 */
@Entity
@Table(name = "`Order`")
public class Order {
    @Id
    @GeneratedValue(generator = "IDGenerator")
    @GenericGenerator(
            name = "IDGenerator",
            strategy = "com.financing.utils.IDGenerator",
            parameters = {
                    @Parameter(name ="classname",value = "com.financing.entity.Order"),
                    @Parameter(name = "pk",value = "id"),
                    @Parameter(name = "sign",value = "OD"),
                    @Parameter(name = "numLength",value = "8")}
                    )
    private String id;

    @ManyToOne(targetEntity = Address.class)
    @JoinColumn(name = "address_id",referencedColumnName = "id")
    private Address address;

    @Column(name = "create_time")
    private Date createTime;

    @ManyToOne(targetEntity = Project.class)
    @JoinColumn(name = "project_id",referencedColumnName = "id")
    private Project project;

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_id",referencedColumnName = "id",nullable = false)
    private User user;

    @ManyToOne(targetEntity = ProjectBack.class)
    @JoinColumn(name = "project_back_id",referencedColumnName = "id",nullable = false)
    private ProjectBack projectBack;

    @Column
    private BigDecimal amount;

    @Column
    private Byte status;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public ProjectBack getProjectBack() {
        return projectBack;
    }

    public void setProjectBack(ProjectBack projectBack) {
        this.projectBack = projectBack;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }
}
