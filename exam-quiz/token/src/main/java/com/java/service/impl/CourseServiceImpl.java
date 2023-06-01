package com.java.service.impl;

import com.java.model.Course;
import com.java.repos.ICourseRepos;
import com.java.service.ICourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CourseServiceImpl implements ICourseService {
    @Autowired
    ICourseRepos courseRepos;

    /**
     * insert data for Course
     * Author:NgaTTT16
     * @param course
     * @return
     */
    @Override
    public Course save(Course course) {
        return courseRepos.save(course);
    }

    @Override
    public List<Course> getAllCourseVIP(String subject, String classes) {
        return courseRepos.listCourseodSubjectandClass(subject, classes);
    }

    @Override
    public List<Course> getAllCourse(String subject, String classes) {
        return courseRepos.listCourseodSubjectandClass(subject, classes)
                .stream()
                .filter(item -> item.getStatus().contains("on")).collect(Collectors.toList());
    }

    /**
     * Get data Course and Search
     * Author:NgaTTT16
     * @param subject
     * @param classes
     * @param search
     * @return
     */
    @Override
    public List<Course> getAllCourseSearch(String subject, String classes, String search) {
        return courseRepos
                .listCourseodSubjectandClass(subject, classes)
                .stream()
                .filter(item -> item.getName().contains(search)).collect(Collectors.toList());
    }
}
