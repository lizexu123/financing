package com.financing.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 项目回报
 * Created by Penny on 2018/5/19.
 */
@Entity
@Table(name = "Project_Back")
public class ProjectBack {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne(targetEntity = Project.class)
    @JoinColumn(name = "project_id",referencedColumnName = "id",nullable = false)
    private Project project;
    @Column
    private Integer compensation;
    @Column
    private BigDecimal amount;
    @Column
    private String content;
    @Column
    private Integer post;
    @Column
    private Integer allow;
    @Column(name = "back_date")
    private Date backDate;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public Integer getCompensation() {
        return compensation;
    }

    public void setCompensation(Integer compensation) {
        this.compensation = compensation;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getPost() {
        return post;
    }

    public void setPost(Integer post) {
        this.post = post;
    }

    public Integer getAllow() {
        return allow;
    }

    public void setAllow(Integer allow) {
        this.allow = allow;
    }

    public Date getBackDate() {
        return backDate;
    }

    public void setBackDate(Date backDate) {
        this.backDate = backDate;
    }
}
