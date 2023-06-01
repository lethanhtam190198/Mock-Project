package com.java.model;

import com.java.dto.QuestionUpdateDTO;

import javax.persistence.*;
import java.util.Arrays;
import java.util.stream.Collectors;

@Table(name = "question")
@Entity
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    String content;

    @Column(name = "trueAnswer")
    String trueAnswer;

    @Column(name = "falseAnswer")
    String falseAnswer;

    @ManyToOne
    @JoinColumn(name = "courseid")
    Course course;

    String status;

    public Question() {
    }

    public Question(String id) {
        this.id = Integer.parseInt(id);
    }

    public Question(QuestionUpdateDTO question) {
        this.id = question.getId();
        this.course = new Course(Integer.parseInt(question.getCourseId()));
        this.status = "on";
        this.content = question.getContent();
        this.trueAnswer = Arrays.stream(question.getTrueAnswer().split(","))
                .filter(x -> !"".equalsIgnoreCase(x))
                .map(x -> String.format("T%s", x.trim()))
                .collect(Collectors.joining("/"));
        this.falseAnswer = Arrays.stream(question.getFalseAnswer().split(","))
                .filter(x -> !"".equalsIgnoreCase(x))
                .map(x -> String.format("F%s", x.trim()))
                .collect(Collectors.joining("/"));
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public void setContent(String title) {
        this.content = title;
    }

    public String getTrueAnswer() {
        return trueAnswer;
    }

    public void setTrueAnswer(String trueAnswer) {
        this.trueAnswer = trueAnswer;
    }

    public String getFalseAnswer() {
        return falseAnswer;
    }

    public void setFalseAnswer(String falseAnswer) {
        this.falseAnswer = falseAnswer;
    }

 }
