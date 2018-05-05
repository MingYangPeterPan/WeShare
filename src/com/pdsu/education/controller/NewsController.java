package com.pdsu.education.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pdsu.education.model.AgeRange;
import com.pdsu.education.model.Child;
import com.pdsu.education.model.EducationType;
import com.pdsu.education.model.News;
import com.pdsu.education.model.Pagination;
import com.pdsu.education.model.User;
import com.pdsu.education.service.NewsService;
import com.pdsu.education.service.SystemService;
import com.pdsu.education.util.ImageUpLoad;
import com.pdsu.education.util.StringUtil;


/**
 * The class is used to deal with exam logic,
 * such as create exam,find exam list.
 * */
@Controller
@RequestMapping("/page/news")
public class NewsController extends BaseController{
	
	
	@Autowired
    private NewsService newsService;

    public void setNewsService(NewsService newsService) {
        this.newsService = newsService;
    }
    
    @Autowired
    private SystemService systemService;

    public void setSystemService(SystemService systemService) {
        this.systemService = systemService;
    }

    @RequestMapping(value = "/news-manage", method = RequestMethod.GET)
    public ModelAndView getNewsList(@RequestParam(value = "key", defaultValue = "") String keyWord,
            						@RequestParam(value = "currentPage", defaultValue = "") String currentPageStr) {
    	
        ModelAndView modelAndView = new ModelAndView();
        
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
        
        List<AgeRange> allAgeRange = systemService.getAllAgeRange();
		this.addSession("all_ageRange", allAgeRange);
		List<EducationType> selectType = systemService.getSelectType(allAgeRange.get(0).getId());
		this.addSession("selectType", selectType);
        List<News> newsList = newsService.getNewsList(pagination);
        this.addSession("new_list", newsList);
        this.addSession("pagination", pagination);
        modelAndView.setViewName("news_manage");
        return modelAndView;
    }

    /**
     * The method is used to create a new exam.
     * @param The map of session.
     * @param The map of request.
     * @return ModelAndView object.
     * */
    @RequestMapping(value = "/news-create", method = RequestMethod.GET)
    public ModelAndView createNews(Map<String, Object> session, Map<String, Object> request) {
    	List<AgeRange> allAgeRange = systemService.getAllAgeRange();
		this.addSession("all_ageRange", allAgeRange);
		List<EducationType> selectType = systemService.getSelectType(allAgeRange.get(0).getId());
		this.addSession("selectType", selectType);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("news_create");
        return modelAndView;
    }
    
    @RequestMapping(value = "/submit-create", method = RequestMethod.POST)
    public ModelAndView submitNews(@RequestParam(value = "news_title", defaultValue = "") String title,
						           @RequestParam(value = "news_age", defaultValue = "") String age,
						           @RequestParam(value = "news_type", defaultValue = "") String type,
						           @RequestParam(value = "news_image", required = false) MultipartFile file,
						           @RequestParam(value = "news_content", defaultValue = "") String content) {
    	String imagePath = ImageUpLoad.saveImage(file);
    	if (!StringUtil.isEmpty(imagePath)){
    		News news=new News();
    		news.setTitle(title);
    		news.setAge(Integer.parseInt(age));
    		news.setContentType(Integer.parseInt(type));
    		news.setImage(imagePath);
    		news.setContent(content);
    		newsService.saveNews(news);
    		ModelAndView modelAndView = new ModelAndView();
    		modelAndView.setView(this.getRedirectView("page/news/news-manage"));
    		return modelAndView;
    	} else {
    		return null;
    	}
    }
    
    @RequestMapping(value = "/get-news", method = RequestMethod.GET)
    public ModelAndView getNewsById(@RequestParam(value="id", defaultValue = "0") String newsId) {
        ModelAndView modelAndView = new ModelAndView();
        News news = newsService.FindNewsById(Integer.parseInt(newsId));
        this.addSession("News", news);
        modelAndView.setViewName("news_update");
        return modelAndView;
    }
    
    @RequestMapping(value = "/get-news-by-type-id/{resourseTypeId}", method = RequestMethod.GET)
    public ModelAndView getNewsByTypeId(@PathVariable String resourseTypeId) {
		List<News> newsByType = null;
		newsByType = newsService.FindNewsByType(null,null,Integer.parseInt(resourseTypeId));
		this.addSession("NewsByType", newsByType);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("news_type_list");
		return modelAndView;
    }
    
}
