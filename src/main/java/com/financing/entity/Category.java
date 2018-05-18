package com.financing.entity;

import javax.persistence.*;

/**
 * Created by Penny on 2018/5/16.
 */
@Entity
@Table(name = "Category")
public class Category {

    @Id
    @GeneratedValue
    private Integer id;

    @Column
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
