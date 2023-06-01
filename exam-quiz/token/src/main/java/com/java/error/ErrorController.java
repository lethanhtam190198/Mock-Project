package com.java.error;

import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.client.HttpClientErrorException.Forbidden;

import java.util.HashMap;
import java.util.Map;

/**
 *The functions below are used to determine the error
 * Author:TuanLN6
 */
@RestControllerAdvice
public class ErrorController {
    @ExceptionHandler(UsernameNotFoundException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Map<String, String> notFoundHandle(UsernameNotFoundException exception) {
        Map<String, String> errors = new HashMap<>();
        errors.put("loginError", exception.getMessage());
        return errors;
    }

    @ExceptionHandler(Forbidden.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Map<String, String> handleNotForbidden(Forbidden exception) {
        Map<String, String> errors = new HashMap<>();
        errors.put("loginError", exception.getMessage());
        return errors;
    }

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Map<String, String> handleNotException(Exception exception) {
        Map<String, String> errors = new HashMap<>();
        errors.put("loginError", exception.getMessage());
        return errors;
    }
}
