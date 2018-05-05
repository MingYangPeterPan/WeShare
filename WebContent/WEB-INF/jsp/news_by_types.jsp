<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pdsu.education.Constant" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.pdsu.education.util.SystemPropertiesUtil" %>
<%@ page import="com.pdsu.education.util.PathUtil"%>
<!DOCTYPE html>
<html>
<head>
    <title>教育类型</title>
    <link href="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/css/lib/bootstrap.min.css" rel="stylesheet">
</head>
<body style="margin-left: 150px;margin-right: 150px;">
    <nav class="nav navbar-default navbar-fixed-top" role="navigation" style="margin-left: 122px;margin-right: 150px; background-color: #FFFFFF">
        <div class="container-fluid">
	        <div class="navbar-header">
	            <a href="<%=PathUtil.getFullPath("home/init-data")%>" class="navbar-brand">
	                <img src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/images/logo.png" style="height: 50px;margin-top:-15px ">
	            </a>
	        </div>
	        <ul class="nav navbar-nav">
	            <li class="active"><a href="<%=PathUtil.getFullPath("home/init-data")%>">首页</a></li>
	            <li><a href="<%=PathUtil.getFullPath("home/about")%>">关于早教</a></li>
	            <li><a href="<%=PathUtil.getFullPath("home/qa")%>">在线问答</a></li>
	        </ul>
        </div>
    </nav>
	<div style="height: 50px"></div>
    <div class="row">
        <div class="col-md-12" style="height: 40px;">
            <ul class="breadcrumb" style="background-color: #FF8040">
                <li><a href="#">首页</a></li>
                <li><a href="#" class="text-muted">类型</a></li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8">
			<div class="list-group">
			        <c:forEach items="${NewsByType}" var="n">
						<div class="list-group-item " data-topic-id="7901,">
	                       	<div class="aw-question-content">
		                        <h4>
						            <a href="<%=PathUtil.getFullPath("home/view-news-id")%>?id=${n.id }">${n.title}</a>
					            </h4>
								<p>
							    	${n.content }
								</p>
						    </div>
						</div>
			        </c:forEach>
				</div>
			</div>
			<div class="col-md-4">
            <div class="list-group">
                <div class="panel panel-primary">
                <div class="panel-heading" style="background-color: #FF8040;">
	                                                热门话题
	                <a href="#" class="text-danger pull-right">>></a>
	            </div>
                <div class="list-group-item">
                    <p><a href="#" style="color: red;">[幼儿园]</a><a href="#">如何预防孩子在幼儿园受侵犯呢</a></p>
                    <p><a href="#" style="color: red;">[家庭教育]</a><a href="#">哪些父亲会影响孩子的前程呢</a></p>
                    <p><a href="#" style="color: red;">[情商德育]</a><a href="#">宝宝学说话的几点专家建议</a></p>
                    <p><a href="#" style="color: red;">[行为习惯]</a><a href="#">迎接二孩家庭社会共努力 </a></p>
                    <p><a href="#" style="color: red;">[家庭教育]</a><a href="#">哪些父亲会影响孩子的前程呢</a></p>
                    <p><a href="#" style="color: red;">[家庭教育]</a><a href="#">哪些父亲会影响孩子的前程呢</a></p>
                </div>
                </div>
            </div>
        </div>
        </div>
<script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/login.js"></script>
</body>
</html>