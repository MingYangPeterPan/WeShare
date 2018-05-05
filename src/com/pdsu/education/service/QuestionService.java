package com.pdsu.education.service;

import java.util.List;

import com.pdsu.education.model.Answer;
import com.pdsu.education.model.Child;
import com.pdsu.education.model.Pagination;
import com.pdsu.education.model.Question;
import com.pdsu.education.model.User;
/**
 * The interface of QuestionService.
 * */
public interface QuestionService {

    public void saveQuestion(Question question);
    
    public void saveAnswer(Answer answer);

    public List<Question> getQuestionList(Pagination pagination);

    public Question FindQuestionById(Integer id);

    public void deleteQuestionById(Integer questionId);
    
    public List<Question> getNewQuestion(User user, Child child);
    
    public List<Question> getQuestionByKeyWord(String keyword);
}
