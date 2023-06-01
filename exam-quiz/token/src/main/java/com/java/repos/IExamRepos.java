package com.java.repos;

import com.java.model.Exam;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IExamRepos extends JpaRepository<Exam, Integer> {
}
