package com.pdsu.education.controller;


import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pdsu.education.model.Answer;
import com.pdsu.education.model.Question;
import com.pdsu.education.service.QuestionService;

@Controller
@RequestMapping("/page/question")
public class QuestionController extends BaseController{
	
	
	@Autowired
    private QuestionService questionService;

    public void setQuestionService(QuestionService questionService) {
        this.questionService = questionService;
    }
    
    @RequestMapping(value = "/submit-question", method = RequestMethod.POST)
    public ModelAndView submitQuestion(@RequestParam(value = "question_title", defaultValue = "") String title,
						           @RequestParam(value = "question_descripe", defaultValue = "") String descripe) {
    		Question question =new Question();
    		question.setTitle(title);
    		question.setContent(descripe);
    		question.setUserId(this.getUserId());
    	    questionService.saveQuestion(question);
    	    ModelAndView modelAndView = new ModelAndView();
    		modelAndView.setView(this.getRedirectView("page/home/qa"));
    		return modelAndView;
    }
    
    @RequestMapping(value = "/answer-question", method = RequestMethod.POST)
    public ModelAndView answerQuestion(@RequestParam(value = "answer", defaultValue = "") String answerString,
    		                           @RequestParam(value = "questionId", defaultValue = "") String questionId) {
        Answer answer = new Answer();
        answer.setAnswer(answerString);
        answer.setUserId(this.getUserId());
        answer.setQuestionId(Integer.parseInt(questionId));
        questionService.saveAnswer(answer);
    	ModelAndView modelAndView = new ModelAndView();
    	modelAndView.setView(this.getRedirectView("page/question/view-question?id="+questionId));
        return modelAndView;
    }
    
    @RequestMapping(value = "/view-question", method = RequestMethod.GET)
    public ModelAndView getQuestions(@RequestParam(value="id", defaultValue = "0") String newsId) {
        ModelAndView modelAndView = new ModelAndView();
        Question question = questionService.FindQuestionById(Integer.parseInt(newsId));
        this.addSession("Question", question);
        modelAndView.setViewName("view_question");
        return modelAndView;
    }
    
    @RequestMapping(value = "/find-question-by-word/{keyword}", method = RequestMethod.GET)
    @ResponseBody
    public List<Question> getQuestionsByKeyWord(@PathVariable String keyword) {
        return questionService.getQuestionByKeyWord(keyword);
    }
}
