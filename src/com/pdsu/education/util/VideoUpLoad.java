package com.pdsu.education.util;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class VideoUpLoad {

	public static String saveVideo(MultipartFile videoFile){
		String trueFileName = "";
		if (videoFile!=null) {
	    	String types=null;
	    	String fileName=videoFile.getOriginalFilename();
	    	types=fileName.indexOf(".")!=-1?fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()):null;
	    	if (types!=null) {
	    		if ("MP4".equals(types.toUpperCase())) {
	    			String realPath="E:\\FinalDesign\\WorkSpace\\EarlyEducation\\WebContent\\static\\news-video";
	    			trueFileName=String.valueOf(System.currentTimeMillis())+fileName;
	    			File targetFile = new File(realPath, trueFileName);  
	    	        if(!targetFile.exists()){  
	    	            targetFile.mkdirs();  
	    	        } 
	    			try {
	    				videoFile.transferTo(targetFile);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
	    		}else {
	    			System.out.println("不是我们想要的文件类型,请按要求重新上传");
	    		}
	    		}else {
	    			System.out.println("文件类型为空");
	    		}
	      }
		return trueFileName;
	}
}
