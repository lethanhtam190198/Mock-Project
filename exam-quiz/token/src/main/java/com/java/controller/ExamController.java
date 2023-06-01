package com.java.controller;

import com.java.dto.DetailsExamView;
import com.java.dto.QuestionView;
import com.java.model.Exam;
import com.java.service.IExamService;
import com.java.service.IQuestionInExamService;
import com.java.service.IQuestionService;
import com.java.service.impl.ExamServiceImpl;
import com.java.service.impl.QuestionInExamService;
import com.java.service.impl.QuestionServiceImpl;
import com.java.service.impl.UserServiceImpl;
import com.java.utils.InvokeMappingExam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.InvocationTargetException;
import java.security.Principal;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/user/exam")
@CrossOrigin("http://localhost:3000/")
public class ExamController {
    @Autowired
    InvokeMappingExam invokeMappingExam;

    @Autowired
    UserServiceImpl userService;

    @Autowired
    IQuestionService iQuestionService;

    @Autowired
    IExamService iExamService;

    @Autowired
    IQuestionInExamService questionInExamService;

    public ExamController(QuestionServiceImpl iQuestionService, ExamServiceImpl examService, QuestionInExamService questionInExamService) {
        this.iQuestionService = iQuestionService;
        this.questionInExamService = questionInExamService;
        this.iExamService = examService;
    }

    /**
     * This function is get data Question
     * Author:TamLT16
     * @param subject
     * @param classes
     * @return
     */
    @GetMapping("")
    public ResponseEntity<List<QuestionView>> getDataQuestion(@RequestParam(value = "s", required = false) String subject,
                                                              @RequestParam(value = "c", required = false) String classes) {
        return ResponseEntity
                .status(HttpStatus.ACCEPTED)
                .body(iQuestionService
                        .getQuestionExam(subject, classes)
                        .stream()
                        .map(QuestionView::new)
                        .collect(Collectors.toList()));
    }

    /**
     * This function use display form answer
     * @param myMap
     * @param principal
     * @return invokeMappingExam
     * @throws InvocationTargetException
     * @throws ClassNotFoundException
     * @throws NoSuchMethodException
     * @throws IllegalAccessException
     */
    @PostMapping(value = "", consumes = "application/json")
    public ResponseEntity<DetailsExamView> calculatorFormAnswer(@RequestBody Map<String, List<String>> myMap, Principal principal) throws InvocationTargetException, ClassNotFoundException, NoSuchMethodException, IllegalAccessException {
        Exam exam = iExamService
                .calculatorFormToResult(myMap,  userService.findByUsername(principal.getName()).getId());
        questionInExamService.saveAndAnswerEachQuestion(exam, myMap);
        DetailsExamView detailsExamView = new DetailsExamView(exam.getPoint());
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(invokeMappingExam.setterQuestionInEntity(detailsExamView, myMap));
    }
}
