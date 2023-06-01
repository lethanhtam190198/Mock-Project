package com.java.repos;

import com.java.model.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ICourseRepos extends JpaRepository<Course, Integer> {
    /**
     * This function used get course from subject and class
     * Author:TuanLN6
     * @param subject
     * @param classes
     * @return course
     */
    @Query(value = "SELECT * FROM course c WHERE c.categoryid = :subject and c.classid = :class", nativeQuery = true)
    List<Course> listCourseodSubjectandClass(@Param("subject") String subject, @Param("class") String classes);
}
