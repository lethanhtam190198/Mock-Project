package com.java.service.impl;

import com.java.model.Question;
import com.java.repos.IQuestionRepos;
import com.java.service.IQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionServiceImpl implements IQuestionService {
    @Autowired
    IQuestionRepos questionRepos;

    /**
     * Get data Question
     * Author:TamLT16
     * @param subject
     * @param classes
     * @return Question
     */
    @Override
    public List<Question> getQuestionExam(String subject, String classes) {
        return questionRepos.listQuestionExam(subject, classes);
    }

    /**
     * find Question from id
     * Author:TamLT16
     * @param id
     * @return Question
     */
    @Override
    public Question findById(Integer id) {
        return questionRepos.findById(id).orElse(null);
    }

    /**
     * save data for Question
     * Author:NghiaTH11
     * @param question
     * @return Question
     */
    @Override
    public Question addQuestion(Question question) {
        return questionRepos.save(question);
    }

    /**
     * Get Data Question of Course
     * Author:NghiaTH11
     * @param course
     * @return Question
     */
    @Override
    public List<Question> getAllQuestionofCourse(String course) {
        return questionRepos.listQuestionofCourse(course);
    }

    /**
     * Report Question
     * Author:NgaTTT16
     * @param id
     */
    @Override
    public void reportQuestion(String id) {
        questionRepos.listReportQuestionofID(id);
    }
}
