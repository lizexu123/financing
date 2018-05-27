package com.financing.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * 项目更新
 * Created by Penny on 2018/5/26.
 */
@Entity
@Table(name = "Project_Update")
public class ProjectUpdate {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    @ManyToOne(targetEntity = Project.class)
    @JoinColumn(name = "project_id",referencedColumnName = "id",nullable = false)
    Project project;

    @Column(name = "update_time")
    Date updateTime;

    @Column(name = "update_content")
    String updateContent;


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

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getUpdateContent() {
        return updateContent;
    }

    public void setUpdateContent(String updateContent) {
        this.updateContent = updateContent;
    }
}
