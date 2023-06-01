package com.java.model;

import javax.persistence.*;


@Entity
@Table(name = "exam")
public class Exam {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    Long point;

    @ManyToOne
    @JoinColumn(name = "userid")
    Users users;

    public Exam() {
    }

    public Exam(Integer id) {
        this.id = id;
    }


    public Exam(Long point, Integer id ) {
        this.point = point;
        this.users = new Users(id);

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getPoint() {
        return point;
    }

    public void setPoint(Long point) {
        this.point = point;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }
}
