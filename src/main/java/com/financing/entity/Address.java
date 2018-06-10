package com.financing.entity;

import javax.persistence.*;

/**
 * 收货地址
 * Created by Penny on 2018/5/20.
 */
@Entity
@Table(name = "Address")
public class Address {
    @Override
    public String toString() {
        return "Address{" +
                "id=" + id +
                ", user=" + user +
                ", recipient='" + recipient + '\'' +
                ", zone='" + zone + '\'' +
                ", postcode='" + postcode + '\'' +
                ", detail='" + detail + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }

    @Id
    @GeneratedValue
    private Integer id;

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_id",referencedColumnName = "id",nullable = false)
    private User user;

    @Column
    private String recipient;

    @Column
    private String zone;

    @Column
    private String postcode;

    @Column
    private String detail;

    @Column
    private String phone;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getRecipient() {
        return recipient;
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient;
    }

    public String getZone() {
        return zone;
    }

    public void setZone(String zone) {
        this.zone = zone;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
