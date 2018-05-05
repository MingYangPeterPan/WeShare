<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pdsu.education.Constant" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.pdsu.education.util.SystemPropertiesUtil" %>
<%@ page import="com.pdsu.education.util.PathUtil"%>
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
	             <input class="form-control search-query" placeholder="搜索问题、话题" autocomplete="off" id="key_word" type="text">
	             <button class="btn btn-primary" id="keywordsearch">搜索</button>
	        </div>
        </div>
    </nav>
	<div style="height: 50px"></div>
    <div class="row">
        <div class="col-md-12" style="height: 40px;">
            <ul class="breadcrumb" style="background-color: #FF8040">
                <li><a href="<%=PathUtil.getFullPath("home/init-data")%>">首页</a></li>
                <li style="color: #FFF">在线问答</li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8">
            <ul class="nav nav-tabs aw-nav-tabs active hidden-xs">
				<h3 class="hidden-xs pull-left"><i class="glyphicon glyphicon-list"></i> 问答</h3>
				<h4 class="hidden-xs pull-right" style="margin-top: 14px;"><button id="${USER == null ? 'show_login': 'create_question'}" class="btn btn-primary">提问</button></h4>
			</ul>
			<div class="list-group">
			    <c:forEach items="${questionList}" var="n">
					<div class="list-group-item " data-topic-id="7901,">
					    <div class="activity-row">
		                 <div class="col-xs-2 activity-img"><img style="width: 39px;height: 36px;margin-top: 7px;margin-left: -6px;" src='<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/images/${n.userImage}' class="img-responsive"/><p>${n.userName }</p></div>
		                 <div class="col-xs-8 activity-desc">
		                 	<h5><a href="<%=PathUtil.getFullPath("question/view-question")%>?id=${n.id }">${n.title }</a></h5>
		                    <p>
								<span class="text-color-999">${n.answersCount } 个回复  
								</span>
							</p>
		                 </div>
		                 <div class="clearfix"> </div>
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
		
		<div id="newQuestion" class="modal">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close">x</button>
		                <h1 class="text-center text-primary">在线提问</h1>
		            </div>
		              <div class="modal-body">
		                <form action="<%=PathUtil.getFullPath("question/submit-question")%>" method="post" class="form col-md-12 center-block">
		                    <div class="form-group">
		                        <input type="text" name="question_title" id="question_title" class="form-control input-lg" placeholder="问题标题">
		                    </div>
		                    <div class="form-group">
		                        <input type="text" name="question_descripe" id="question_descripe" class="form-control input-lg" placeholder="问题描述">
		                    </div>
		                    <div class="form-group">
		                        <button class="btn btn-primary btn-lg btn-block">发出提问</button>
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
<script type="text/javascript">
          $(function() {
        	  $("#keywordsearch").click(function() {
        		  var word = $("#key_word").val();
        		  $.ajax({
 		             type: "GET",
 		             url: "/EarlyEducation/page/question/find-question-by-word/" + word,
 		             dataType:"json",  
 		             async:false,  
 		             cache:false,
 		             success: function(data){
 		            	 
 		             }
 		          }); 
        	  });
          });
</script>
</body>
</html>