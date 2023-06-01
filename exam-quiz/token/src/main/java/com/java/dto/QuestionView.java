package com.java.dto;

import com.java.model.Question;


public class QuestionView {
    Integer id;

    String title;

    String trueAnswer;

    String falseAnswer;

    public QuestionView() {
    }

    public QuestionView(Question question) {
        this.id = question.getId();
        this.title = question.getContent();
        this.trueAnswer = question.getTrueAnswer();
        this.falseAnswer = question.getFalseAnswer();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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
