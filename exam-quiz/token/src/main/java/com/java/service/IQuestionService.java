package com.java.service;

import com.java.model.Question;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface IQuestionService {
    List<Question> getQuestionExam(String subject,String classes);
//    List<Question> getListQuestionExamByLimitQuestion(Integer limit);
    Question findById(Integer id);

    Question addQuestion(Question question);

    List<Question> getAllQuestionofCourse(String course);
    void reportQuestion(String id);
}
