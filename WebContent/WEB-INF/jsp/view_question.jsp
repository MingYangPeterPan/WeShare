<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pdsu.education.Constant" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.pdsu.education.util.SystemPropertiesUtil" %>
<%@ page import="com.pdsu.education.util.PathUtil"%>
<%@ page import="com.pdsu.education.model.Question" %>
<!DOCTYPE html>
<html>
<head>
    <title>在线问答</title>
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
	            <li id="home"><a href="<%=PathUtil.getFullPath("home/init-data")%>">首页</a></li>
	            <li id="about"><a href="<%=PathUtil.getFullPath("home/about")%>">关于早教</a></li>
	            <li id="question"><a href="<%=PathUtil.getFullPath("home/qa")%>">在线问答</a></li>
	        </ul>
	        <div class="navbar-form navbar-right">
	             <input class="form-control search-query" placeholder="搜索问题、话题或人" autocomplete="off" name="q" id="aw-search-query" type="text">
	            <button class="btn btn-primary">搜索</button>
	        </div>
        </div>
    </nav>
	<div style="height: 50px"></div>
    <div class="row">
        <div class="col-md-12" style="height: 40px;">
            <ul class="breadcrumb" style="background-color: #FF8040">
                <li><a href="#">首页</a></li>
                <li><a href="#" class="text-muted">在线问答</a></li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8">
            <ul class="nav nav-tabs aw-nav-tabs active hidden-xs">
				<h3 class="hidden-xs pull-left"><i class="glyphicon glyphicon-list"></i> 问答</h3>
				<h4 class="hidden-xs pull-right" style="margin-top: 14px;"><button id="${USER == null ? 'show_login': 'answer_question'}" class="btn btn-primary">快速回答</button></h4>
			</ul>
			<div class="list-group">
				<div class="list-group-item " data-topic-id="7901,">
                    <div class="aw-question-content">
			    		<div class="activity-row">
		                 <div class="col-xs-8 activity-desc">
		                 	<h5><a>问题</a>：${Question.title}</h5>
		                    <p>
								<span class="text-color-999"><a>描述</a>：${Question.content }
								</span>
							</p>
		                 </div>
		                 <div class="clearfix"> </div>
	                    </div>
				    </div>
				</div>
				<c:if test="${Question.answers!= null || fn:length(Question.answers) > 0}">
				    <c:forEach items="${Question.answers}" var="n">
						<div class="list-group-item " data-topic-id="7901,">
	                       	<div class="aw-question-content">
								<div class="activity-row">
				                 <div class="col-xs-2 activity-img"><img style="width: 39px;height: 36px;margin-top: 7px;margin-left: -6px;" src='<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/images/${n.uImage}' class="img-responsive"/><p>${n.userName }</p></div>
				                 <div class="col-xs-8 activity-desc">
				                    <p style="margin-top: 24px;">
										<span class="text-color-999">${n.answer }</span>
									</p>
				                 </div>
				                 <div class="clearfix"> </div>
			                    </div>
						    </div>
						</div>
				    </c:forEach>
				</c:if>
				<c:if test="${Question.answers == null || fn:length(Question.answers) == 0}">
				    <div class="list-group-item " data-topic-id="7901,">
                       	<div class="aw-question-content">
							<p>
						    	暂无答复
							</p>
					    </div>
					</div>
				</c:if>
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
        
        <div id="loginModal" class="modal">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close">x</button>
		                <h1 class="text-center text-primary">请先登录</h1>
		            </div>
		              <div class="modal-body">
		                <form action="<%=PathUtil.getFullPath(Constant.LOGIN_URL_PAGE)%>" method="post" class="form col-md-12 center-block">
		                    <div class="form-group">
		                        <input type="text" name="userName" id="userName" class="form-control input-lg" placeholder="用户名">
		                    </div>
		                    <div class="form-group">
		                        <input type="password" name="password" id="password" class="form-control input-lg" placeholder="密码">
		                    </div>
		                    <div class="form-group">
		                        <button class="btn btn-primary btn-lg btn-block">立刻登录</button>
		                        <span><a href="#">找回密码</a></span>
		                        <span><a href="<%=PathUtil.getFullPath("user/register")%>" class="pull-right">注册</a></span>
		                    </div>
		                </form>
		            </div>
		            <div class="modal-footer">
        		    </div>
		        </div>
		    </div>
		</div>

        <div id="answerModal" class="modal">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close">x</button>
		                <h1 class="text-center text-primary">在线提问</h1>
		            </div>
		              <div class="modal-body">
		                <form action="<%=PathUtil.getFullPath("question/answer-question")%>" method="post" class="form col-md-12 center-block">
		                    <div class="form-group">
		                        <input type="text" name="answer" id="answer" class="form-control input-lg" placeholder="答案">
		                    </div>
		                    <input type="hidden" name="questionId" value="${Question.id }">
		                    <div class="form-group">
		                        <button class="btn btn-primary btn-lg btn-block">提交</button>
		                    </div>
		                </form>
		            </div>
		            <div class="modal-footer">
        		    </div>
		        </div>
		    </div>
		</div>
        </div>
<script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/login.js"></script>
<script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/common.js"></script>
</body>
</html>