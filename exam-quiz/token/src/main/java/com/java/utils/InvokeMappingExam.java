package com.java.utils;

import com.java.dto.DetailsExamView;
import lombok.SneakyThrows;
import org.springframework.stereotype.Component;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

@Component
public class InvokeMappingExam {
    /**
     * Set Question in Entity
     * @param exam
     * @param map
     * @return
     * @throws IllegalAccessException
     * @throws InvocationTargetException
     * @throws ClassNotFoundException
     * @throws NoSuchMethodException
     * @throws SecurityException
     */
    @SneakyThrows
    public DetailsExamView setterQuestionInEntity(DetailsExamView exam, Map<String, List<String>> map) throws IllegalAccessException, InvocationTargetException, ClassNotFoundException, NoSuchMethodException, SecurityException   {
        Class<?> classes = Class.forName("com.java.dto.DetailsExamView");
        Method method1 = null;
        Method method2 = null;
        int i = 0;
        for (Map.Entry<String, List<String>> entry : map.entrySet()) {
            method1 = classes.getMethod(String.format("setQuestion%did", i), String.class);
            method2 = classes.getMethod(String.format("setAnswer%d", i), String.class);
            method1.invoke(exam, entry.getKey());
            method2.invoke(exam, String.join(",", entry.getValue()));
            i++;
        }
        return exam;
    }
}
