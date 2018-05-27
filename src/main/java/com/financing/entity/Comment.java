package com.financing.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Penny on 2018/5/26.
 */
@Entity
@Table(name = "Comment")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "from_user_id",referencedColumnName = "id",nullable = false)
    private User fromUser;

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "to_user_id",referencedColumnName = "id",nullable = false)
    private User toUser;

    @Column
    private Date createTime;

    @Column
    private String content;

    @ManyToOne(targetEntity = Project.class)
    @JoinColumn(name = "project_id",referencedColumnName = "id",nullable = false)
    private Project project;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getFromUser() {
        return fromUser;
    }

    public void setFromUser(User fromUser) {
        this.fromUser = fromUser;
    }

    public User getToUser() {
        return toUser;
    }

    public void setToUser(User toUser) {
        this.toUser = toUser;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }
}
