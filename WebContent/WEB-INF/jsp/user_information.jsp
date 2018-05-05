<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pdsu.education.Constant" %>
<%@ page import="com.pdsu.education.util.SystemPropertiesUtil" %>
<%@ page import="com.pdsu.education.util.PathUtil"%>
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
		                    <li>当前位置： 用户管理/管理用户/用户信息</li>
		                </ul>
		            </div>
		        </div>
		        <div class="row">
		            <div class="widget_4">
					   	 <div class="col-md-4 widget_1_box1">
					   	 	<div class="coffee">
							<div class="coffee-top">
								<a href="#"><img class="img-responsive" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/images/pic4.jpg" alt="">
								<div class="doe">
									<h6>Lorem Ipusm</h6>
									<p>Web Designer</p>
								</div>
								<i></i></a>
							</div>
							<div class="follow">
								<div class="col-xs-4 two">
									<p>活跃度</p>
									<span>1,367</span>
								</div>
								<div class="col-xs-4 two">
									<p>提问</p>
									<span>967</span>
								</div>
								<div class="col-xs-4 two">
									<p>回答</p>
									<span>367</span>
								</div>
								<div class="clearfix"> </div>
							</div>
					       </div>
					   	 </div>
					   	 <div class="col-md-8">
					   	    <h4 style="color: #02F78E;margin-left: 10px;">基本信息</h4>
				            <p style="margin-left: 20px;">姓名：simon</p>
				            <p style="margin-left: 20px;">性别：男</p>
				            <p style="margin-left: 20px;">联系电话：17010282173</p>
				            <p style="margin-left: 20px;">地址：河南信阳</p>
				            <br>
				            <div class="media">
				                 <h4 style="color: #02F78E;margin-left: 10px;">宝贝信息</h4>
								  <div class="media-left">
								    <a href="#">
								      <img class="media-object" data-src="holder.js/64x64" alt="64x64" 
								      src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/images/baobei.jpg" data-holder-rendered="true" style="width: 201px; height: 237px;">
								    </a>
								  </div>
								  <div class="media-body">
						            <p style="margin-left: 20px;">宝贝名字：panpan</p>
						            <p style="margin-left: 20px;">性别：小王子</p>
						            <p style="margin-left: 20px;">年龄：8个月</p>
						            <p style="margin-left: 20px;">生日：2016-8-1</p>
								  </div>
								  <div class="clearfix"> </div>
							</div>
							<div class="media">
								  <div class="media-left">
								    <a href="#">
								      <img class="media-object" data-src="holder.js/64x64" alt="64x64" 
								      src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/images/baobei.jpg" data-holder-rendered="true" style="width: 201px; height: 237px;">
								    </a>
								  </div>
								  <div class="media-body">
						            <p style="margin-left: 20px;">宝贝名字：panpan</p>
						            <p style="margin-left: 20px;">性别：小王子</p>
						            <p style="margin-left: 20px;">年龄：8个月</p>
						            <p style="margin-left: 20px;">生日：2016-8-1</p>
								  </div>
								  <div class="clearfix"> </div>
							</div>
					   	 </div>
		        </div>
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
