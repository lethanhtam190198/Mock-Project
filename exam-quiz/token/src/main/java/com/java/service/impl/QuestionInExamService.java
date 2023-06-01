package com.java.service.impl;

import com.java.model.Exam;
import com.java.model.QuestionInExam;
import com.java.repos.IQuestionInExamRepos;
import com.java.service.IQuestionInExamService;
 import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class QuestionInExamService implements IQuestionInExamService {
    @Autowired
    IQuestionInExamRepos questionInExamRepos;

    /**
     * Save and answer each question
     * Author:TuanLN6
     * @param exam
     * @param listMap
     */
    @Override
    public void saveAndAnswerEachQuestion(Exam exam, Map<String, List<String>> listMap) {
        for (Map.Entry<String, List<String>> entry : listMap.entrySet()){
            questionInExamRepos.save(new QuestionInExam(exam.getId(),entry));
        }

    }

    /**
     * Find QuestionInExam by id
     * @param id
     * @return QuestionInExam
     */
    @Override
    public List<QuestionInExam> findAllByIdExam(Integer id) {
        return questionInExamRepos.findAllByExam_Id(id);
    }
}
