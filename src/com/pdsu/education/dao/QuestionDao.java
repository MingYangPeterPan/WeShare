package com.pdsu.education.dao;

import java.util.List;

import com.pdsu.education.model.Answer;
import com.pdsu.education.model.Child;
import com.pdsu.education.model.Pagination;
import com.pdsu.education.model.Question;
import com.pdsu.education.model.User;

public interface QuestionDao {

	public void createQuestion(Question question);
	public void createAnwer(Answer answer);
    public List<Question> queryAllQuestions(Pagination pagination);
    public Integer getQuestionCount(String keyword);
    public Question getQuestionById(Integer questionId);
    public void deletedQuestion(Integer questionId);
    public List<Question> queryNewQuestion(User user, Child child);
    public List<Question> queryQuestionByKeyWord(String keyword);
}
