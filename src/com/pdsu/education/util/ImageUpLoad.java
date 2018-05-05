package com.pdsu.education.util;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;


public class ImageUpLoad {

	public static String saveImage(MultipartFile file){
		String trueFileName = "";
		if (file!=null) {
	    	String types=null;
	    	String fileName=file.getOriginalFilename();
	    	types=fileName.indexOf(".")!=-1?fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()):null;
	    	if (types!=null) {
	    		if ("GIF".equals(types.toUpperCase())||"PNG".equals(types.toUpperCase())||"JPG".equals(types.toUpperCase())||"GIF".equals(types.toUpperCase())) {
	    			String realPath="E:\\FinalDesign\\WorkSpace\\EarlyEducation\\WebContent\\static\\news-image";
	    			trueFileName=String.valueOf(System.currentTimeMillis())+fileName;
	    			//path=realPath+/*System.getProperty("file.separator")+*/trueFileName;
	    			File targetFile = new File(realPath, trueFileName);  
	    	        if(!targetFile.exists()){  
	    	            targetFile.mkdirs();  
	    	        } 
	    			try {
						file.transferTo(targetFile);
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
