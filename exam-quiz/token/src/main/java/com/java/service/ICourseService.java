package com.java.service;

import com.java.model.Course;

import java.util.List;

public interface ICourseService {
    Course save(Course course);
    List<Course> getAllCourse(String subject, String classes);
    List<Course> getAllCourseVIP(String subject, String classes);
    List<Course> getAllCourseSearch(String subject, String classes, String search);
}
