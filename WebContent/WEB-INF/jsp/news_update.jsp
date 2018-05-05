<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pdsu.education.Constant" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.pdsu.education.util.SystemPropertiesUtil" %>
<%@ page import="com.pdsu.education.util.PathUtil"%>
<%@ page import="com.pdsu.education.model.News" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/css/lib/style.css" rel='stylesheet' type='text/css' />
<link href="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/css/lib/lines.css" rel='stylesheet' type='text/css' />
<link href="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/fonts/lib/font-awesome.css" rel="stylesheet"> 
<link href="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/css/lib/custom.css" rel="stylesheet">
</head>
<body>
<div id="wrapper">
     <!-- Navigation -->
        <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">早教教育推广系统</a>
            </div>
            <ul class="nav navbar-nav navbar-right">
			    <li class="dropdown">
	        		<a href="#" class="dropdown-toggle avatar" data-toggle="dropdown"><img src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/images/1.png"><span class="badge">9</span></a>
	        		<ul class="dropdown-menu">
						<li class="m_2"><a href="#"><i class="fa fa-user"></i> 个人信息</a></li>
						<li class="m_2"><a href="#"><i class="fa fa-wrench"></i> 修改密码</a></li>
						<li class="m_2"><a href="#"><i class="fa fa-usd"></i> 退出登录 </a></li>
	        		</ul>
	      		</li>
			</ul>
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="<%=PathUtil.getFullPath("admin/init-data")%>"><i class="fa fa-dashboard fa-fw glyphicon glyphicon-adjust"></i>系统信息</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-laptop glyphicon glyphicon-user"></i>用户管理<span class="glyphicon glyphicon-menu-right arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="<%=PathUtil.getFullPath("user/all-users")%>">管理用户</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-indent glyphicon glyphicon-book"></i>资讯管理<span class="glyphicon glyphicon-menu-right arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="<%=PathUtil.getFullPath("news/news-manage")%>">管理资讯</a>
                                </li>
                                <li>
                                    <a href="<%=PathUtil.getFullPath("news/news-create")%>">发布资讯</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-envelope glyphicon glyphicon-film"></i>视频管理<span class="glyphicon glyphicon-menu-right arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="<%=PathUtil.getFullPath("video/video-manage")%>">管理视频</a>
                                </li>
                                <li>
                                    <a href="<%=PathUtil.getFullPath("video/video-create")%>">添加视频</a>
                                </li>
                            </ul>
                        </li>
                         <li>
                            <a href="#"><i class="fa fa-check-square-o glyphicon glyphicon-modal-window"></i>系统设置<span class="glyphicon glyphicon-menu-right arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="<%=PathUtil.getFullPath("system/type-setting")%>">资讯设置</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
	    <div id="page-wrapper">
	        <div class="graphs">
		        <div class="row" style="margin-top: -20px; margin-left: -25px;margin-right: -25px;">
		            <div class="col-md-12">
		                <ul class="breadcrumb" style="background-color: #FFFFFF">
		                    <li>当前位置： 资讯管理/修改资讯</li>
		                </ul>
		            </div>
		        </div>
		        <div class="row">
		        	<form class="form-horizontal" action="<%=PathUtil.getFullPath("news/submit-create")%>" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<label class="col-md-2 control-label">标题:</label>
							<div class="col-md-8">
								<div class="input-group">							
									<input id="news_title" name="news_title" value="${News.title }" type="text" class="form-control1" placeholder="news title">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">年龄段:</label>
							<div class="col-md-3">
								<select name="news_age" class="form-control1 ng-invalid ng-invalid-required" ng-model="model.select" required="">
				                <option value="1" ${News.age == 1 ? "selected": ""}>早教</option>
				                <option value="2" ${News.age == 2 ? "selected": ""}>0-1岁</option>
				                <option value="3" ${News.age == 3 ? "selected": ""}>1-3岁</option>
				                <option value="4" ${News.age == 4 ? "selected": ""}>3-6岁</option>
			              </select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">资讯类型:</label>
							<div class="col-md-3">
								<select name="news_type" class="form-control1 ng-invalid ng-invalid-required" ng-model="model.select" required="">
				                <option value="1" ${News.contentType == 1 ? "selected": ""}>饮食营养</option>
				                <option value="2" ${News.contentType == 2 ? "selected": ""}>健康疾病</option>
				                <option value="3" ${News.contentType == 3 ? "selected": ""}>孕妈必读</option>
				                <option value="4" ${News.contentType == 4 ? "selected": ""}>妈妈关注</option>
				                <option value="5" ${News.contentType == 5 ? "selected": ""}>亲子互动</option>
				                <option value="6" ${News.contentType == 6 ? "selected": ""}>智力开发</option>
				                <option value="7" ${News.contentType == 7 ? "selected": ""}>情商德育</option>
				                <option value="8" ${News.contentType == 8 ? "selected": ""}>行为习惯</option>
				                <option value="9" ${News.contentType == 9 ? "selected": ""}>家庭教育</option>
				                <option value="10" ${News.contentType == 10 ? "selected": ""}>幼儿园</option>
				              </select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">资讯图片:</label>
							<div class="col-md-3">
							    <img src="/static_img/${News.image }" alt="图片加载失败" style="width: 200px;height: 150px;">
							    <button type="button" onclick="exampleInputFile.click()">更改</button>
								<input name="news_image" type="file" id="exampleInputFile" style="visibility: hidden; position: absolute;">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">正文:</label>
							<div class="col-md-8">
								<textarea name="news_content" class="form-control" rows="12">${News.content }</textarea>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-8 col-sm-offset-2">
								<button class="btn-success btn">Submit</button>
								<button class="btn-default btn">Cancel</button>
							</div>
		                </div>
					</form>
		        </div>
		    </div>
       </div>
    </div>
    <script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/metisMenu.min.js"></script>
    <script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/custom.js"></script>
    <script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/d3.v3.js"></script>
    <script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/rickshaw.js"></script>
</body>
</html>
