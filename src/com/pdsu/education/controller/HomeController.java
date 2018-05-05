package com.pdsu.education.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pdsu.education.model.Child;
import com.pdsu.education.model.EducationType;
import com.pdsu.education.model.News;
import com.pdsu.education.model.Pagination;
import com.pdsu.education.model.Question;
import com.pdsu.education.model.User;
import com.pdsu.education.model.Video;
import com.pdsu.education.service.NewsService;
import com.pdsu.education.service.QuestionService;
import com.pdsu.education.service.SystemService;
import com.pdsu.education.service.VideoService;
import com.pdsu.education.util.StringUtil;

@Controller
@RequestMapping("/page/home")
public class HomeController extends BaseController {
	
	@Autowired
    private NewsService newsService;
	@Autowired
    private VideoService videoService;
	@Autowired
    private QuestionService questionService;
	@Autowired
    private SystemService systemService;

    public void setSystemService(SystemService systemService) {
        this.systemService = systemService;
    }

    public void setQuestionService(QuestionService questionService) {
        this.questionService = questionService;
    }
    public void setNewsService(NewsService newsService) {
        this.newsService = newsService;
    }
    public void setVideoService(VideoService videoService) {
        this.videoService = videoService;
    }

	
	@RequestMapping(value = "/init-data", method = RequestMethod.GET)
    public ModelAndView getInitData() {
		List<News> hotNews = null;
		List<Video> hotVideos = null;
		List<Question> newQuestion = null;
		List<EducationType> educationType = null;
		List<News> newsByType1 = null;
		List<News> newsByType2 = null;
		List<News> newsByType3 = null;
		User user = (User)this.getSession("USER");
		if (user != null) {
			List<Child> childs = user.getChilds();
			if(childs != null && childs.size() > 0) {
				hotNews = newsService.getHotNews(user,childs.get(0));
				hotVideos = videoService.getHotVideo(user, childs.get(0));
				newQuestion = questionService.getNewQuestion(user, childs.get(0));
				educationType = systemService.getAllType();
			} else {
				hotNews = newsService.getHotNews(user,null);
				hotVideos = videoService.getHotVideo(user, null);
				newQuestion = questionService.getNewQuestion(user, null);
				educationType = systemService.getAllType();
			}
		} else {
			hotNews = newsService.getHotNews(null,null);
			hotVideos = videoService.getHotVideo(null, null);
			newQuestion = questionService.getNewQuestion(null, null);
			educationType = systemService.getAllType();
		}
		newsByType1 = newsService.FindNewsByType(null,null,educationType.get(0).getId());
		newsByType2 = newsService.FindNewsByType(null,null,educationType.get(1).getId());
		newsByType3 = newsService.FindNewsByType(null,null,educationType.get(2).getId());
		this.addSession("hotNews", hotNews);
		this.addSession("hotVideos", hotVideos);
		this.addSession("newQuestion", newQuestion);
		this.addSession("educationType", educationType);
		this.addSession("newsByType1", newsByType1);
		this.addSession("newsByType2", newsByType2);
		this.addSession("newsByType3", newsByType3);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("home");
        return modelAndView;
    }
	
	@RequestMapping(value = "/get-news-resourse/{resourseTypeId}", method = RequestMethod.GET)
	@ResponseBody
    public List<News> getNewsResourseData(@PathVariable String resourseTypeId) {
		User user = (User)this.getSession("USER");
		List<News> hotNews = null;
		if (user != null) {
			List<Child> childs = user.getChilds();
			if(childs != null && childs.size() > 0) {
				hotNews = newsService.FindNewsByType(user,childs.get(0),Integer.parseInt(resourseTypeId));
			} else {
				hotNews = newsService.FindNewsByType(user,null,Integer.parseInt(resourseTypeId));
			}
		} else {
			hotNews = newsService.FindNewsByType(null,null,Integer.parseInt(resourseTypeId));
		}
		return hotNews;
    }
	
	@RequestMapping(value = "/get-video-resourse/{resourseTypeId}", method = RequestMethod.GET)
	@ResponseBody
    public List<Video> getVideosResourseData(@PathVariable String resourseTypeId) {
		User user = (User)this.getSession("USER");
		List<Video> hotVideos = null;
		if (user != null) {
			List<Child> childs = user.getChilds();
			if(childs != null && childs.size() > 0) {
				hotVideos = videoService.FindVideosByType(user,childs.get(0),Integer.parseInt(resourseTypeId));
			} else {
				hotVideos = videoService.FindVideosByType(user,null,Integer.parseInt(resourseTypeId));
			}
		} else {
			hotVideos = videoService.FindVideosByType(null,null,Integer.parseInt(resourseTypeId));
		}
		return hotVideos;
    }
	
	@RequestMapping(value = "/view-news-id", method = RequestMethod.GET)
    public ModelAndView getNewsById(@RequestParam(value="id", defaultValue = "0") String newsId) {
        ModelAndView modelAndView = new ModelAndView();
        News news = newsService.FindNewsById(Integer.parseInt(newsId));
        this.addSession("News", news);
        modelAndView.setViewName("news_by_id");
        return modelAndView;
    }
	
	@RequestMapping(value = "/view-news-type", method = RequestMethod.GET)
    public ModelAndView getNewsByType(@RequestParam(value="id", defaultValue = "0") String newsId) {
        ModelAndView modelAndView = new ModelAndView();
        List<News> newsListByType = newsService.FindNewsByType(null,null,Integer.parseInt(newsId));
        this.addSession("NewsByType", newsListByType);
        modelAndView.setViewName("news_by_types");
        return modelAndView;
    }
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
    public ModelAndView about() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("about");
        return modelAndView;
    }
	
	@RequestMapping(value = "/qa", method = RequestMethod.GET)
    public ModelAndView QA(@RequestParam(value = "key", defaultValue = "") String keyWord,
						   @RequestParam(value = "currentPage", defaultValue = "") String currentPageStr) {
		if (StringUtil.isEmpty(currentPageStr)) {
            currentPageStr = "1";
        }
        Integer currentPage = Integer.parseInt(currentPageStr);
        if (currentPage < 1) {
            currentPage = 1;
        }
        Pagination pagination = new Pagination();
        pagination.setKeyWord(keyWord);
        pagination.setCurrentPage(currentPage);
		List<Question> questionList = questionService.getQuestionList(pagination);
		this.addSession("questionList", questionList);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("qa");
        return modelAndView;
    }
}
