package com.java.service.impl;

import com.java.model.Exam;
import com.java.model.Question;
import com.java.repos.IExamRepos;
import com.java.service.IExamService;
import com.java.service.IQuestionService;
import com.java.utils.InvokeMappingExam;

import lombok.SneakyThrows;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class ExamServiceImpl implements IExamService {
    @Autowired
    IQuestionService iQuestionService;
    @Autowired
    IExamRepos repos;
    @SneakyThrows
    public Exam calculatorFormToResult(Map<String, List<String>> map, Integer id) {
        Question question = null;
        Long point = 0L;
        for (Map.Entry<String, List<String>> entry : map.entrySet()) {
            if (entry.getValue().isEmpty()) continue;
            question = iQuestionService.findById(Integer.parseInt(entry.getKey()));
            if (checkAnswerFormWithAnswerDatabase(question.getTrueAnswer(), entry.getValue())) {
                point++;
            }
        }
        return saveNewExam(new Exam(point, id));
    }

    /**
     * Insert data for Exam
     * Author:TuanLN6
     * @param exam
     * @return
     */
    @Override
    public Exam saveNewExam(Exam exam) {
        return repos.save(exam);
    }

    /**
     * Check Answer to form with answer database
     * Author:TuanLN6
     * @param answerFromDatabase
     * @param answerFromForm
     * @return
     */
    public boolean checkAnswerFormWithAnswerDatabase(String answerFromDatabase, List<String> answerFromForm) {
        List<String> list = Arrays
                .stream(answerFromDatabase.split("/"))
                .sorted(Comparator.naturalOrder())
                .collect(Collectors.toList());
        List<String> answer = answerFromForm
                .stream()
                .sorted(Comparator.naturalOrder())
                .collect(Collectors.toList());
        return list.equals(answer);
    }
}
