package com.java.repos;

import com.java.model.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface IQuestionRepos extends JpaRepository<Question, Integer> {
    /**
     * This function get 10 question form question from categoryid and classid
     * Author:NgaTTT16
     * @param subject
     * @param classes
     * @return
     */
    @Query(value = "SELECT TOP 10 q.id,q.content, q.trueAnswer, q.falseAnswer, q.status,q.courseid FROM question q inner join course c on c.id = q.courseid " +
            "and c.categoryid = :subject and c.classid = :class " +
            "order BY NEWID() ", nativeQuery = true)
    List<Question> listQuestionExam(@Param("subject") String subject,@Param("class") String classes);

    /**
     * This function used get question from courseid
     * Author:NgaTTT16
     * @param course
     * @return
     */
    @Query(value = "SELECT * FROM question q WHERE q.courseid = :course", nativeQuery = true)
    List<Question> listQuestionofCourse(@Param("course") String course);

    /**
     * This function used update question to report of user
     * Author:NgaTTT16
     * @param id
     * @return
     */
    @Query(value = "UPDATE question SET status='off' WHERE id = :id", nativeQuery = true)
    List<Question> listReportQuestionofID(@Param("id") String id);
}
