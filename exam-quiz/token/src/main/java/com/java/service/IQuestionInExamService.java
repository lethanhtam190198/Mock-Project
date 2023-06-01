package com.java.service;

import com.java.model.Exam;
import com.java.model.QuestionInExam;

import java.util.List;
import java.util.Map;

public interface IQuestionInExamService {
        void saveAndAnswerEachQuestion(Exam exam, Map<String, List<String >> listMap);
    List<QuestionInExam> findAllByIdExam(Integer id);
}
