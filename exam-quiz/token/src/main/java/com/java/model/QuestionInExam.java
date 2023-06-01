package com.java.model;

import javax.persistence.*;
import java.util.List;
import java.util.Map;

@Entity
@Table(name = "questionforexam")
public class QuestionInExam {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    @ManyToOne
    @JoinColumn(name = "examid")
    Exam exam;

    @ManyToOne
    @JoinColumn(name = "questionid")
    Question question;

    String answer;

    public QuestionInExam() {
    }

    public QuestionInExam(Integer id, Map.Entry<String, List<String>> entry) {
        this.exam = new Exam(id);
        this.question = new Question(entry.getKey());
        this.answer = String.join(",", entry.getValue());
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}
