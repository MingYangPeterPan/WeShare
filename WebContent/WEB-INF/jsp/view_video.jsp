<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pdsu.education.Constant" %>
<%@ page import="com.pdsu.education.util.SystemPropertiesUtil" %>
<%@ page import="com.pdsu.education.util.PathUtil"%>
<%@ page import="com.pdsu.education.model.Video"%>
<!DOCTYPE html>
<html>
<head>
<title>about</title>
<link href="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/css/lib/video-js.css" rel="stylesheet">
</head>
	<body style="margin-left: 150px;margin-right: 150px;">
	    <jsp:include page="top.jsp"></jsp:include>
	    <div class="row">
	        <div class="col-md-12" style="height: 40px;">
	            <ul class="breadcrumb" style="background-color: #FF8040">
	                <li><a href="<%=PathUtil.getFullPath("home/init-data")%>">首页</a></li>
	                <li style="color: #FFF">当前正在播放：${Video.title }</li>
	                <li class="pull-right"><a href="<%=PathUtil.getFullPath("video/video-load")%>?name=${Video.video }" class="text-muted">下载</a></li>
	            </ul>
	        </div>
	    </div>
	    <div class="row" style="margin-left: 3px;">
               <video id="example_video_1" class="video-js vjs-default-skin vjs-big-play-centered" controls preload="none" width="1061" height="606"
		       poster="http://video-js.zencoder.com/oceans-clip.png"
		       data-setup="{}">
		     <source src="/static_video/${Video.video }" type="video/mp4">
		    </video>
        </div>
	    <script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/video.js"></script>
	    <script> 
	        videojs.options.flash.swf = "<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/css/video-js.swf";
        </script> 
	</body>
</html>