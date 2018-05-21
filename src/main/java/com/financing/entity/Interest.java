package com.financing.entity;

import javax.persistence.*;

/**
 * 收藏
 * Created by Penny on 2018/5/20.
 */
@Entity
@Table(name = "Interest")
public class Interest {
    @Id
    @GeneratedValue
    private Integer id;

    @ManyToOne(targetEntity = Project.class)
    @JoinColumn(name = "project_id",referencedColumnName = "id")
    private Project project;

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_id",referencedColumnName = "id",nullable = false)
    private User user;


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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
