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
<link href="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/css/lib/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="all" href="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/css/lib/daterangepicker-bs3.css" />
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
	        		<a href="#" class="dropdown-toggle avatar" data-toggle="dropdown"><img src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/images/${USER.image}"></a>
	        		<ul class="dropdown-menu">
						<li class="m_2"><a href="#"><i class="fa fa-user"></i> 个人信息</a></li>
						<li class="m_2"><a href="#"><i class="fa fa-wrench"></i> 修改密码</a></li>
						<li class="m_2"><a href="<%=PathUtil.getFullPath("user/logout")%>"><i class="fa fa-usd"></i> 退出登录 </a></li>
	        		</ul>
	      		</li>
			</ul>
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="<%=PathUtil.getFullPath("admin/init-data")%>"><i class="glyphicon glyphicon-adjust"></i>系统信息</a>
                        </li>
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-user"></i>用户管理<span class="glyphicon glyphicon-menu-right arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="<%=PathUtil.getFullPath("user/all-users")%>">管理用户</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-book"></i>资讯管理<span class="glyphicon glyphicon-menu-right arrow"></span></a>
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
                            <a href="#"><i class="glyphicon glyphicon-film"></i>视频管理<span class="glyphicon glyphicon-menu-right arrow"></span></a>
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
                            <a href="#"><i class="glyphicon glyphicon-modal-window"></i>系统设置<span class="glyphicon glyphicon-menu-right arrow"></span></a>
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
		                    <li>当前位置： 系统信息/</li>
		                </ul>
		            </div>
		        </div>
		        <div class="row">
	               <form class="form-horizontal">
	                 <fieldset>
	                  <div class="control-group">
	                    <div class="controls">
	                     <div class="input-prepend input-group">
	                       <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span><input type="text" readonly style="width: 200px" name="reservation" id="reservation" class="form-control" value="2014-5-21 - 2014-6-21" /> 
	                     </div>
	                    </div>
	                  </div>
	                 </fieldset>
	               </form>
		        </div>
		        <div class="row">
		            <p style="margin-left: 20px;">系统名称：早教教育推广系统</p><br>
		            <p style="margin-left: 20px;">在线会员：18人</p><br>
		            <p style="margin-left: 20px;">资讯信息：23条</p><br>
		            <p style="margin-left: 20px;">视频资源：14部</p><br>
		            <p style="margin-left: 20px;">平均日流量：12</p><br>
		            <p style="margin-left: 20px;">当前在线人数：1</p><br>
		            <p style="margin-left: 20px;">今日访客：3</p>
		            <br><br><br><br><br><br><br><br><br>
		            
		            
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
    <script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/moment.js"></script>
    <script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/daterangepicker.js"></script>
    <script type="text/javascript">
       $(document).ready(function() {
          $('#reservation').daterangepicker(null, function(start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
          });
       });
    </script>
</body>
</html>
