package com.pdsu.education.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pdsu.education.model.AgeRange;
import com.pdsu.education.model.EducationType;
import com.pdsu.education.model.Pagination;
import com.pdsu.education.model.Video;
import com.pdsu.education.service.SystemService;
import com.pdsu.education.service.VideoService;
import com.pdsu.education.util.ImageUpLoad;
import com.pdsu.education.util.StringUtil;
import com.pdsu.education.util.VideoUpLoad;
/**
 * The class is used to deal with question logic,
 * such as create question,find question,update question check.
 * */
@Controller
@RequestMapping("/page/video")
public class VideoController extends BaseController{

    @Autowired
    private VideoService videoService;

    public void setVideoService(VideoService videoService) {
        this.videoService = videoService;
    }
    
    @Autowired
    private SystemService systemService;

    public void setSystemService(SystemService systemService) {
        this.systemService = systemService;
    }

    @RequestMapping(value = "/video-manage", method = RequestMethod.GET)
    public ModelAndView videoList(@RequestParam(value = "key", defaultValue = "") String keyWord,
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
        List<Video> videoList = videoService.getVideoList(pagination,1,0);
        this.addSession("video_list", videoList);
        this.addSession("pagination", pagination);
        modelAndView.setViewName("video_manage");
        return modelAndView;
    }
    
    @RequestMapping(value = "/video-list/{rangeId}/{typeId}", method = RequestMethod.GET)
    @ResponseBody
    public List<Video> getVideoList(@PathVariable String rangeId,
    		                        @PathVariable String typeId) {
    	String keyWord="";
    	String currentPageStr="";
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
        List<Video> videoList = videoService.getVideoList(pagination,Integer.parseInt(rangeId),Integer.parseInt(typeId));
        return videoList;
    }
    
    @RequestMapping(value = "/video-create", method = RequestMethod.GET)
    public ModelAndView createVideo() {
    	List<AgeRange> allAgeRange = systemService.getAllAgeRange();
		this.addSession("all_ageRange", allAgeRange);
		List<EducationType> selectType = systemService.getSelectType(allAgeRange.get(0).getId());
		this.addSession("selectType", selectType);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("video_create");
        return modelAndView;
    }
    
    @RequestMapping(value = "/video-submit", method = RequestMethod.POST)
    public ModelAndView submitVideo(@RequestParam(value = "video_title", defaultValue = "") String title,
						           @RequestParam(value = "video_age", defaultValue = "") String age,
						           @RequestParam(value = "video_type", defaultValue = "") String type,
						           @RequestParam(value = "news_image", required = false) MultipartFile imageFile,
						           @RequestParam(value = "news_video", required = false) MultipartFile videoFile,
						           @RequestParam(value = "video_descripe", defaultValue = "") String discripe) {
	    
		String imagePath = ImageUpLoad.saveImage(imageFile);
		String videoPath = VideoUpLoad.saveVideo(videoFile);
		if(!StringUtil.isEmpty(imagePath) && !StringUtil.isEmpty(videoPath)){
			Video video=new Video();
			video.setTitle(title);
			video.setAge(Integer.parseInt(age));
			video.setContentType((Integer.parseInt(type)));
			video.setImage(imagePath);
			video.setVideo(videoPath);
			video.setDiscripe(discripe);
			videoService.saveVideo(video);
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setView(this.getRedirectView("page/video/video-manage"));
			return modelAndView;
		} else {
			return null;
		}
    }
    
    @RequestMapping(value = "/get-video", method = RequestMethod.GET)
    public ModelAndView getVideos(@RequestParam(value="id", defaultValue = "0") String videoId) {
        ModelAndView modelAndView = new ModelAndView();
        Video video = videoService.FindVideoById(Integer.parseInt(videoId));
        this.addSession("Video", video);
        modelAndView.setViewName("video_update");
        return modelAndView;
    }
    
    @RequestMapping(value = "/view-video", method = RequestMethod.GET)
    public ModelAndView viewVideo(@RequestParam(value="id", defaultValue = "0") String videoId) {
        ModelAndView modelAndView = new ModelAndView();
        Video video = videoService.FindVideoById(Integer.parseInt(videoId));
        this.addSession("Video", video);
        modelAndView.setViewName("view_video");
        return modelAndView;
    }
    
    @RequestMapping(value = "/video-load", method = RequestMethod.GET)
    public ResponseEntity<byte[]> downLoadVideo(@RequestParam(value = "name", defaultValue = "") String name) throws IOException {
    	//得到要下载的文件名
    	String fileName = new String(name.getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题  ;
    	//通过文件名找出文件的所在目录
    	String path = "E:\\FinalDesign\\WorkSpace\\EarlyEducation\\WebContent\\static\\news-video";
    	//得到要下载的文件
    	File file = new File(path + "\\" + fileName);
    	//如果文件不存在
    	if(!file.exists()){
    		return null;
    	}
    	HttpHeaders headers = new HttpHeaders();    
        headers.setContentDispositionFormData("attachment", fileName);   
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);   
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
                                          headers, HttpStatus.CREATED); 
    }
    
}
