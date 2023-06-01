package com.java.controller;

import com.java.model.Course;
import com.java.model.Question;
import com.java.service.ICourseService;
import com.java.service.IPaymentService;
import com.java.service.IQuestionService;
import com.java.service.impl.PaymentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/user/learn")
@CrossOrigin("http://localhost:3000/")
public class LearnController {
    @Autowired
    ICourseService iCourseService;

    @Autowired
    IQuestionService iQuestionService;

    @Autowired
    IPaymentService iPaymentService;

    /**
     * This function use get all course in database
     * Author: NgaTTT16
     * @param subject
     * @param classes
     * @param user
     * @return Course
     */
    @GetMapping("")
    public ResponseEntity<List<Course>> getAllCourse(@RequestParam(value = "s", required = false) String subject,
                                                     @RequestParam(value = "c", required = false) String classes,
                                                     @RequestParam(value = "user", required = false) String user) throws ParseException {
        Date now = new Date(System.currentTimeMillis());
        SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
        if ((iPaymentService.findAll(user)).length != 0){
            Date endvip = formatter1.parse(iPaymentService.findAll(user)[0]);
            if (now.before(endvip)) {
                return ResponseEntity
                        .status(HttpStatus.ACCEPTED)
                        .body(iCourseService
                                .getAllCourseVIP(subject, classes));
            }
        }
        return ResponseEntity
                .status(HttpStatus.ACCEPTED)
                .body(iCourseService
                        .getAllCourse(subject, classes));
    }

    /**
     * This function use get all course and search
     * Author: NgaTTT16
     * @param subject
     * @param classes
     * @param search
     * @return Course
     */
    @GetMapping("search")
    public ResponseEntity<List<Course>> getAllCourseSearch(@RequestParam(value = "s", required = false) String subject,
                                                           @RequestParam(value = "c", required = false) String classes,
                                                           @RequestParam(value = "search", required = false) String search) {
        return ResponseEntity
                .status(HttpStatus.ACCEPTED)
                .body(iCourseService
                        .getAllCourseSearch(subject, classes, search));
    }

    /**
     * This function use get all question of course to study
     * Author: NgaTTT16
     * @param course
     * @return Question
     */
    @GetMapping("getquestioncourse")
    public ResponseEntity<List<Question>> getAllQuestionofCourse(@RequestParam(value = "u", required = false) String course) {
        return ResponseEntity
                .status(HttpStatus.ACCEPTED)
                .body(iQuestionService
                        .getAllQuestionofCourse(course));
    }

    /**
     * This function used to user could report question
     * Author: NgaTTT16
     * @param id
     * @return
     */
    @GetMapping("report")
    public ResponseEntity<?> reportQuestionofID(@RequestParam(value = "re", required = false) String id) {
        iQuestionService.reportQuestion(id);
        return ResponseEntity
                .status(HttpStatus.ACCEPTED)
                .body("");
    }
}
