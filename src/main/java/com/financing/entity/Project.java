package com.financing.entity;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by Penny on 2018/5/16.
 */
@Entity
@Table(name = "Project")
public class Project {
    @Id
    @GeneratedValue(generator = "IDGenerator")
    @GenericGenerator(
            name = "IDGenerator",
            strategy = "com.financing.utils.IDGenerator",
            parameters = {
                    @Parameter(name ="classname",value = "com.financing.entity.Project"),
                    @Parameter(name = "pk",value = "id"),
                    @Parameter(name = "sign",value = "PJ"),
                    @Parameter(name = "numLength",value = "8")}
    )
    private String id;

    @Column
    private  String title;

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_id",referencedColumnName = "id",nullable = false)
    private User user;

    @ManyToOne(targetEntity = Category.class)
    @JoinColumn(name = "category_id",referencedColumnName = "id")
    private Category category;

    @Column
    private String cover;

    @Column(name = "goal_amount")
    private BigDecimal goalAmount;

    @Column(name = "actual_amount")
    private BigDecimal actualAmount;

    @Column(name = "publish_time")
    private Date publishTime;

    @Column(name = "end_time")
    private Date endTime;

    @Column(name = "support_count")
    private int supportCount;

    @Column
    private String team;

    @Column
    private String purpose;

    @Column
    private String detail;

    @Column(name = "contact_name")
    private String contactName;

    @Column
    private String hotline;

    @Column(name = "contact_phone")
    private String contactPhone;

    @Column
    private Byte status;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public BigDecimal getGoalAmount() {
        return goalAmount;
    }

    public void setGoalAmount(BigDecimal goalAmount) {
        this.goalAmount = goalAmount;
    }

    public BigDecimal getActualAmount() {
        return actualAmount;
    }

    public void setActualAmount(BigDecimal actualAmount) {
        this.actualAmount = actualAmount;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public int getSupportCount() {
        return supportCount;
    }

    public void setSupportCount(int supportCount) {
        this.supportCount = supportCount;
    }

    public String getTeam() {
        return team;
    }

    public void setTeam(String team) {
        this.team = team;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getHotline() {
        return hotline;
    }

    public void setHotline(String hotline) {
        this.hotline = hotline;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Project{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", user=" + user +
                ", category=" + category +
                ", cover='" + cover + '\'' +
                ", goalAmount=" + goalAmount +
                ", actualAmount=" + actualAmount +
                ", publishTime=" + publishTime +
                ", endTime=" + endTime +
                ", supportCount=" + supportCount +
                ", team='" + team + '\'' +
                ", purpose='" + purpose + '\'' +
                ", detail='" + detail + '\'' +
                ", contactName='" + contactName + '\'' +
                ", hotline='" + hotline + '\'' +
                ", contactPhone='" + contactPhone + '\'' +
                ", status=" + status +
                '}';
    }
}
