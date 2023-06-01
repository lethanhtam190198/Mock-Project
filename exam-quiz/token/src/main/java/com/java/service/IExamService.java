package com.java.service;

import com.java.model.Exam;

import java.util.List;
import java.util.Map;

public interface IExamService {
      Exam calculatorFormToResult(Map<String, List<String>> map, Integer id);
      Exam saveNewExam(Exam exam);
}
