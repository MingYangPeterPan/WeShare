<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pdsu.education.Constant" %>
<%@ page import="com.pdsu.education.util.SystemPropertiesUtil" %>
<%@ page import="com.pdsu.education.util.PathUtil"%>
<%@ page import="com.pdsu.education.model.User"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/css/lib/bootstrap.min.css" rel="stylesheet">
    <title>top</title>
  </head>
  <body>
    <nav class="nav navbar-default navbar-fixed-top" role="navigation" style="margin-left: 122px;margin-right: 150px; background-color: #FFFFFF">
	        <div class="container-fluid">
		        <div class="navbar-header">
		            <a href="<%=PathUtil.getFullPath("home/init-data")%>" class="navbar-brand">
		                <img src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/images/logo.png" style="height: 50px;margin-top:-15px ">
		            </a>
		        </div>
		        <ul class="nav navbar-nav">
		            <li id="home"><a href="<%=PathUtil.getFullPath("home/init-data")%>">首页</a></li>
		            <li id="about"><a href="<%=PathUtil.getFullPath("home/about")%>">关于早教</a></li>
		            <li id="question"><a href="<%=PathUtil.getFullPath("home/qa")%>">在线问答</a></li>
		        </ul>
		        <ul class="nav navbar-nav navbar-right">
		            <% if(request.getSession().getAttribute("USER") == null){ %>
		                <div class="navbar-form navbar-right">
				            <button class="btn btn-primary" id="login">登录</button>
				        </div>
		            <% } else { %>
				    <li class="dropdown">
		        		<a href="#" class="dropdown-toggle avatar" data-toggle="dropdown" style="width: 50px;height: 50px;"><img style="width: 43px;height: 43px;margin-top: -11px;margin-left: -18px;" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/images/${USER.image}"></a>
		        		<ul class="dropdown-menu">
							<li class="m_2"><a href="#"><i class="fa fa-user"></i> 个人信息</a></li>
							<li class="m_2" ><a href="#"><i class="fa fa-wrench"></i> 修改密码</a></li>
							<li class="m_2"><a href="#"><i class="fa fa-wrench"></i> 我的问答</a></li>
							<li class="m_2"><a href="<%=PathUtil.getFullPath("user/logout")%>"><i class="fa fa-usd"></i> 退出登录 </a></li>
		        		</ul>
		      		</li>
		      		<%}%>
				</ul>
	        </div>
	    </nav>
	    <div style="height: 50px"></div>
  </body>
</html>