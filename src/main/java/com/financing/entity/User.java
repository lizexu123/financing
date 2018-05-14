package com.financing.entity;

import org.hibernate.annotations.*;
import org.hibernate.annotations.Parameter;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;

/**
 * @author Penny
 *
 */
@Entity
@Table(name = "User")
public class User {
    @Id
    @GeneratedValue(generator = "IDGenerator")
    @GenericGenerator(
            name = "IDGenerator",
            strategy = "com.financing.utils.IDGenerator",
            parameters = {
                    @Parameter(name ="classname",value = "com.financing.entity.User"),
                    @Parameter(name = "pk",value = "id"),
                    @Parameter(name = "sign",value = ""),
                    @Parameter(name = "numLength",value = "9")}
            )
    private String id;

    @Column
    private String username;

    @Column
    private String mobile;

    @Column
    private String password;

    @Column
    private String email;

    @Column
    private String avatar;

    @Column
    private String gender;

    @Column
    private String zone;

    @Column
    private BigDecimal balance;

    @Column
    private String intro;

    @Column
    private Byte status;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getZone() {
        return zone;
    }

    public void setZone(String zone) {
        this.zone = zone;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public String getDescribe() {
        return intro;
    }

    public void setDescribe(String describe) {
        this.intro = describe;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", mobile='" + mobile + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", avatar='" + avatar + '\'' +
                ", gender='" + gender + '\'' +
                ", zone='" + zone + '\'' +
                ", balance=" + balance +
                ", describe='" + intro + '\'' +
                ", status=" + status +
                '}';
    }
}
