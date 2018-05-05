package com.pdsu.education.service.impl;

import java.util.List;

import com.pdsu.education.dao.QuestionDao;
import com.pdsu.education.model.Answer;
import com.pdsu.education.model.Child;
import com.pdsu.education.model.Pagination;
import com.pdsu.education.model.Question;
import com.pdsu.education.model.User;
import com.pdsu.education.service.QuestionService;

public class QuestionServiceImpl implements QuestionService {

    private QuestionDao questionDao;

    public void setQuestionDao(QuestionDao questionDao) {
        this.questionDao = questionDao;
    }

    @Override
    public void saveQuestion(Question question) {
        questionDao.createQuestion(question);
    }

    @Override
    public List<Question> getQuestionList(Pagination pagination) {
        List<Question> allQuestions = questionDao.queryAllQuestions(pagination);
        return allQuestions;
    }

    @Override
    public Question FindQuestionById(Integer questionId) {
        Question question = questionDao.getQuestionById(questionId);
        return question;
    }

    @Override
    public void deleteQuestionById(Integer questionId) {
        questionDao.deletedQuestion(questionId);
    }

	@Override
	public void saveAnswer(Answer answer) {
		questionDao.createAnwer(answer);
	}

	@Override
	public List<Question> getNewQuestion(User user, Child child) {
		return questionDao.queryNewQuestion(user, child);
	}

	@Override
	public List<Question> getQuestionByKeyWord(String keyword) {
		return questionDao.queryQuestionByKeyWord(keyword);
	}
}
