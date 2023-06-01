package com.java.controller;

import com.java.dto.QuestionUpdateDTO;
import com.java.model.Question;
import com.java.service.IQuestionService;
import com.java.service.impl.QuestionServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/question")
@CrossOrigin("http://localhost:3000/")
public class QuestionController {
    @Autowired
    IQuestionService iQuestionService;

    public QuestionController(QuestionServiceImpl service){
        this.iQuestionService = service;
    }

    /**
     * This funtion used save question
     * Author:TuanLN6
     * @param question
     * @return
     */
    @PostMapping("")
    public ResponseEntity<Question> saveQuestionFromForm(@RequestBody QuestionUpdateDTO question){
        return ResponseEntity.status(HttpStatus.OK).body(iQuestionService.addQuestion(new Question(question)));
    }
}
