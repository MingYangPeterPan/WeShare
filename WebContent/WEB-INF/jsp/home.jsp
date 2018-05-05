<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pdsu.education.Constant" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.pdsu.education.util.SystemPropertiesUtil" %>
<%@ page import="com.pdsu.education.util.PathUtil"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>爱育幼童</title>
        <script> 
            $(document).ready(function() {
            $("#test").carousel({
             interval: 2000
            })
        	});
        </script> 
    </head>
    <body style="margin-left: 150px;margin-right: 150px;">
        <jsp:include page="top.jsp"></jsp:include>
        <div class="row">
            <div class="col-md-12" style="height: 40px;">
                <ul class="breadcrumb" style="background-color: #FF8040">
                    <li style="color: #FFF">${USER == null ? '欢迎进入早教教育推广系统':USER.userName}</li>
                </ul>
            </div>
        </div>
        <div class="row">
        <div class="col-md-5">
            <div class="list-group">
                <div class="panel panel-primary">
                <div class="panel-heading" style="background-color: #FF8040;">
	                                                今日推荐
	                <button id="news_video" value="1" class="text-danger pull-right" style="background-color: #FF8040;border: none;color: #FFF">>>视频</button>
	            </div>
	            
                <div class="list-group-item" style="height: 131px;" id="test1">
                    <c:forEach items="${hotNews}" var="m" begin="0" step="1" varStatus="status">
                        <c:if test="${status.index==0}">
					          <div class="media-left">
					            <img src="/static_img/${m.image}" class="media-object" style="height: 100px;width: 100px;">
					          </div>
			                  <div class="media-body">
			                    <strong class="media-heading"><a href="<%=PathUtil.getFullPath("home/view-news-id")%>?id=${m.id }">${m.title}</a></strong>
			                    <p style="position:relative;line-height:1.4em;height:4.2em;overflow:hidden;">${m.content }</p>
			                  </div>
					   </c:if>
                    </c:forEach>
                </div>
                <div class="list-group-item" style="height: 171px;" id="test2">
                    <c:forEach items="${hotNews}" var="n" begin="1" end="5" step="1">
                    	<p><a href="<%=PathUtil.getFullPath("news/get-news-by-type-id/")%>${n.contentType }" style="color: red;">[${n.typeName}]</a><a href="<%=PathUtil.getFullPath("home/view-news-id")%>?id=${n.id }">${n.title}</a></p>
                    </c:forEach>
                </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div id="test" class="carousel slide">
			   <ol class="carousel-indicators">
			      <li data-target="#test" data-slide-to="0" class="active"></li>
			      <li data-target="#test" data-slide-to="1"></li>
			      <li data-target="#test" data-slide-to="2"></li>
			   </ol>  
			   <div class="carousel-inner">
			      <c:forEach items="${hotVideos}" var="n" begin="0" end="2" step="1" varStatus="status">
			         <c:if test="${status.index==0}">
			           <div class="item active" style="height: 343px;">
				         <img src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/news-image/${n.image}" alt="First slide">
				       <div class="carousel-caption" style="margin-top: 100px;">
						 <h3><a href="<%=PathUtil.getFullPath("video/view-video")%>?id=${n.id }">${n.title }</a></h3>
						 <p>${n.discripe }</p>
					   </div>
					   </div>
			         </c:if>
			         <c:if test="${status.index==1}">
			           <div class="item" style="height: 343px;">
					     <img src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/news-image/${n.image}" alt="Second slide">
					   <div class="carousel-caption">
						 <h3><a href="<%=PathUtil.getFullPath("video/view-video")%>?id=${n.id }">${n.title }</a></h3>
						 <p>${n.discripe }</p>
					   </div>
					   </div>
			         </c:if>
			         <c:if test="${status.index==2}">
			           <div class="item" style="height: 343px;">
					     <img src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/news-image/${n.image}" alt="Third slide">
					   <div class="carousel-caption">
						 <h3><a href="<%=PathUtil.getFullPath("video/view-video")%>?id=${n.id }">${n.title }</a></h3>
						 <p>${n.discripe }</p>
					   </div>
					   </div>
			         </c:if>
                  </c:forEach>
			   </div>
			</div> 
        </div>
        <div class="col-md-3">
            <div class="list-group">
                <div class="panel panel-primary">
                <div class="panel-heading" style="background-color: #FF8040;">
	                                                最新提问
	                <a href="<%=PathUtil.getFullPath("home/qa")%>" class="text-danger pull-right">>></a>
	            </div>
                <div class="list-group-item" style="height: 300px;">
                    <c:if test="${newQuestion == null}">
                       <a href="#">暂无问题，马上提问吧</a>
                    </c:if>
                    <c:if test="${newQuestion != null}">
                       <c:forEach items="${newQuestion}" var="n" begin="0" end="5"step="1">
                    	 <p><a href="<%=PathUtil.getFullPath("question/view-question")%>?id=${n.id }">${n.title }</a></p>
                       </c:forEach>
                    </c:if>
                </div>
                </div>
            </div>
        </div>
	    </div>
	    <div class="row">
	        <c:forEach items="${educationType}" var="n" begin="0" end="2" step="1" varStatus="st">
	            <div class="col-md-4">
	              <div class="list-group">
                    <div class="panel panel-primary">
                      
	                  <c:if test="${st.index==0}">
	                      <div class="panel-heading" style="background-color: #FF8040;">
		                    ${n.name }
		                    <button id="resourse1" value="1" class="text-danger pull-right" style="background-color: #FF8040;border: none;color: #FFF">>>视频</button>
		                  </div>
		                  <input type="hidden" id="va1" value="${n.id }">
			              <div class="list-group-item" id="test3">
			                <c:forEach items="${newsByType1}" var="m" begin="0" step="1" varStatus="status">
			                  <c:if test="${status.index==0}">
							    <div class="media-left">
								  <img src="/static_img/${m.image}" class="media-object" style="height: 100px;width: 100px;">
								</div>
						        <div class="media-body">
						          <strong class="media-heading"><a href="<%=PathUtil.getFullPath("home/view-news-id")%>?id=${m.id }">${m.title}</a></strong>
						          <p style="position:relative;line-height:1.4em;height:4.2em;overflow:hidden;">${m.content }</p>
						        </div>
							  </c:if>
			                </c:forEach>
			              </div>
			              <div class="list-group-item" style="height: 171px;" id=test4>
			                <c:forEach items="${newsByType1}" var="z" begin="1" end="5" step="1">
			                  <p><a href="<%=PathUtil.getFullPath("news/get-news-by-type-id/")%>${z.contentType }" style="color: red;">[${z.typeName}]</a><a href="<%=PathUtil.getFullPath("home/view-news-id")%>?id=${z.id }">${z.title}</a></p>
			                </c:forEach>
			              </div>
	                  </c:if>
	                  <c:if test="${st.index==1}">
	                      <div class="panel-heading" style="background-color: #FF8040;">
		                    ${n.name }
		                    <button id="resourse2" value="1" class="text-danger pull-right" style="background-color: #FF8040;border: none;color: #FFF">>>视频</button>
		                  </div>
		                  <input type="hidden" id="va2" value="${n.id }">
			              <div class="list-group-item" id="test5">
			                <c:forEach items="${newsByType2}" var="m" begin="0" step="1" varStatus="status">
			                  <c:if test="${status.index==0}">
							    <div class="media-left">
								  <img src="/static_img/${m.image}" class="media-object" style="height: 100px;width: 100px;">
								</div>
						        <div class="media-body">
						          <strong class="media-heading"><a href="<%=PathUtil.getFullPath("home/view-news-id")%>?id=${m.id }">${m.title}</a></strong>
						          <p style="position:relative;line-height:1.4em;height:4.2em;overflow:hidden;">${m.content }</p>
						        </div>
							  </c:if>
			                </c:forEach>
			              </div>
			              <div class="list-group-item" style="height: 171px;" id="test6">
			                <c:forEach items="${newsByType2}" var="z" begin="1" end="4" step="1">
			                  <p><a href="<%=PathUtil.getFullPath("news/get-news-by-type-id/")%>${z.contentType }" style="color: red;">[${z.typeName}]</a><a href="<%=PathUtil.getFullPath("home/view-news-id")%>?id=${z.id }">${z.title}</a></p>
			                </c:forEach>
			              </div>
	                  </c:if>
	                  <c:if test="${st.index==2}">
	                      <div class="panel-heading" style="background-color: #FF8040;">
		                    ${n.name }
		                    <button id="resourse3" value="1" class="text-danger pull-right" style="background-color: #FF8040;border: none;color: #FFF">>>视频</button>
		                  </div>
		                  <input type="hidden" id="va3" value="${n.id }">
			              <div class="list-group-item" id="test7">
			                <c:forEach items="${newsByType3}" var="m" begin="0" step="1" varStatus="status">
			                  <c:if test="${status.index==0}">
							    <div class="media-left">
								  <img src="/static_img/${m.image}" class="media-object" style="height: 100px;width: 100px;">
								</div>
						        <div class="media-body">
						          <strong class="media-heading"><a href="<%=PathUtil.getFullPath("home/view-news-id")%>?id=${m.id }">${m.title}</a></strong>
						          <p style="position:relative;line-height:1.4em;height:4.2em;overflow:hidden;">${m.content }</p>
						        </div>
							  </c:if>
			                </c:forEach>
			              </div>
			              <div class="list-group-item" style="height: 171px;" id="test8">
			                <c:forEach items="${newsByType3}" var="z" begin="1" end="4" step="1">
			                  <p><a href="<%=PathUtil.getFullPath("news/get-news-by-type-id/")%>${z.contentType }" style="color: red;">[${z.typeName}]</a><a href="<%=PathUtil.getFullPath("home/view-news-id")%>?id=${z.id }">${z.title}</a></p>
			                </c:forEach>
			              </div>
	                  </c:if>
                </div>
            </div>
            </div>
            </c:forEach>
	    </div>
	    <div id="loginModal" class="modal">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close">x</button>
		                <h1 class="text-center text-primary">登录</h1>
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
		                        <span><a href="#"></a></span>
		                        <span><a href="<%=PathUtil.getFullPath("user/register")%>" class="pull-right">注册</a></span>
		                    </div>
		                </form>
		                <input type="hidden" value="${hiddens == null?0:1 }" id="isHidd">
		            </div>
		            <div class="modal-footer">
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
            $("#news_video").click(function() {
            	var a="";
            	if($("#news_video").val()==1){
            		$("#news_video").text(">>资讯");
            		$("#news_video").val("0");
            		a = "/EarlyEducation/page/home/get-video-resourse/0";
            	}else{
            		$("#news_video").text(">>视频");
            		$("#news_video").val("1");
            		a = "/EarlyEducation/page/home/get-news-resourse/0";
            	}
            	$.ajax({
		             type: "GET",
		             url: a,
		             dataType:"json",
		             async:false,  
		             cache:false,
		             success: function(data){
		            	 $('#test1').empty();
		            	 $('#test2').empty();
		            	 var tbody1='';
		            	 var tbody2='';
		            	 if($("#news_video").val()==1){
			            	 for(var i in data) {
			            		  if(i==0){
			            			  tbody1+='<div class="media-left">';
			            			  tbody1+='<img src="/static_img/'+data[i].image+'" class="media-object" style="height: 100px;width: 100px;">';
			            			  tbody1+='</div>';
			            			  tbody1+='<div class="media-body">';
			            			  tbody1+='<strong class="media-heading"><a href="<%=PathUtil.getFullPath("home/view-news-id")%>?id='+data[i].id+'">'+data[i].title+'</a></strong>';
			            			  tbody1+='<p style="position:relative;line-height:1.4em;height:4.2em;overflow:hidden;">'+data[i].content+'</p>';
			            			  tbody1+='</div>';
			            		  }else if(i<=5){
			            			  tbody2+='<p><a href="<%=PathUtil.getFullPath("news/get-news-by-type-id/")%>'+data[i].contentType+'" style="color: red;">['+data[i].typeName+']</a><a href="<%=PathUtil.getFullPath("home/view-news-id")%>?id='+data[i].id+'">'+data[i].title+'</a></p>';
			            		  }
			            	 }
		            	 }else{
		            		 for(var i in data) {
			            		  if(i==0){
			            			  tbody1+='<div class="media-left">';
			            			  tbody1+='<img src="/static_img/'+data[i].image+'" class="media-object" style="height: 100px;width: 100px;">';
			            			  tbody1+='</div>';
			            			  tbody1+='<div class="media-body">';
			            			  tbody1+='<strong class="media-heading"><a href="<%=PathUtil.getFullPath("video/view-video")%>?id='+data[i].id+'">'+data[i].title+'</a></strong>';
			            			  tbody1+='<p style="position:relative;line-height:1.4em;height:4.2em;overflow:hidden;">'+data[i].discripe+'</p>';
			            			  tbody1+='</div>';
			            		  }else if(i<=5){
			            			  tbody2+='<p><a href="<%=PathUtil.getFullPath("video/view-video")%>?id='+data[i].id+'">'+data[i].title+'</a></p>';
			            		  }
			            	 }
		            	 }
		            	 $('#test1').html(tbody1);
		            	 $('#test2').html(tbody2);
		            }
		        });
            });
            
            $("#resourse1").click(function() {
            	var a="";
            	var id=$("#va1").val();
            	if($("#resourse1").val()==1){
            		$("#resourse1").text(">>资讯");
            		$("#resourse1").val("0");
            		a = "/EarlyEducation/page/home/get-video-resourse/"+id;
            	}else{
            		$("#resourse1").text(">>视频");
            		$("#resourse1").val("1");
            		a = "/EarlyEducation/page/home/get-news-resourse/"+id;
            	}
            	$.ajax({
		             type: "GET",
		             url: a,
		             dataType:"json",
		             async:false,  
		             cache:false,
		             success: function(data){
		            	 $('#test3').empty();
		            	 $('#test4').empty();
		            	 var tbody1='';
		            	 var tbody2='';
		            	 if($("#resourse1").val()==1){
			            	 for(var i in data) {
			            		  if(i==0){
			            			  tbody1+='<div class="media-left">';
			            			  tbody1+='<img src="/static_img/'+data[i].image+'" class="media-object" style="height: 100px;width: 100px;">';
			            			  tbody1+='</div>';
			            			  tbody1+='<div class="media-body">';
			            			  tbody1+='<strong class="media-heading"><a href="<%=PathUtil.getFullPath("home/view-news-id")%>?id='+data[i].id+'">'+data[i].title+'</a></strong>';
			            			  tbody1+='<p style="position:relative;line-height:1.4em;height:4.2em;overflow:hidden;">'+data[i].content+'</p>';
			            			  tbody1+='</div>';
			            		  }else if(i<=5){
			            			  tbody2+='<p><a href="<%=PathUtil.getFullPath("news/get-news-by-type-id/")%>'+data[i].contentType+'" style="color: red;">['+data[i].typeName+']</a><a href="<%=PathUtil.getFullPath("home/view-news-id")%>?id='+data[i].id+'">'+data[i].title+'</a></p>';
			            		  }
			            	 }
		            	 }else{
		            		 for(var i in data) {
			            		  if(i==0){
			            			  tbody1+='<div class="media-left">';
			            			  tbody1+='<img src="/static_img/'+data[i].image+'" class="media-object" style="height: 100px;width: 100px;">';
			            			  tbody1+='</div>';
			            			  tbody1+='<div class="media-body">';
			            			  tbody1+='<strong class="media-heading"><a href="<%=PathUtil.getFullPath("video/view-video")%>?id='+data[i].id+'">'+data[i].title+'</a></strong>';
			            			  tbody1+='<p style="position:relative;line-height:1.4em;height:4.2em;overflow:hidden;">'+data[i].discripe+'</p>';
			            			  tbody1+='</div>';
			            		  }else if(i<=4){
			            			  tbody2+='<p><a href="<%=PathUtil.getFullPath("video/view-video")%>?id='+data[i].id+'">'+data[i].title+'</a></p>';
			            		  }
			            	 }
		            	 }
		            	 $('#test3').html(tbody1);
		            	 $('#test4').html(tbody2);
		            }
		        });
            });
            
            $("#resourse2").click(function() {
            	var a="";
            	var id=$("#va2").val();
            	if($("#resourse2").val()==1){
            		$("#resourse2").text(">>资讯");
            		$("#resourse2").val("0");
            		a = "/EarlyEducation/page/home/get-video-resourse/"+id;
            	}else{
            		$("#resourse2").text(">>视频");
            		$("#resourse2").val("1");
            		a = "/EarlyEducation/page/home/get-news-resourse/"+id;
            	}
            	$.ajax({
		             type: "GET",
		             url: a,
		             dataType:"json",
		             async:false,  
		             cache:false,
		             success: function(data){
		            	 $('#test5').empty();
		            	 $('#test6').empty();
		            	 var tbody1='';
		            	 var tbody2='';
		            	 if($("#resourse2").val()==1){
			            	 for(var i in data) {
			            		  if(i==0){
			            			  tbody1+='<div class="media-left">';
			            			  tbody1+='<img src="/static_img/'+data[i].image+'" class="media-object" style="height: 100px;width: 100px;">';
			            			  tbody1+='</div>';
			            			  tbody1+='<div class="media-body">';
			            			  tbody1+='<strong class="media-heading"><a href="<%=PathUtil.getFullPath("video/view-video")%>?id='+data[i].id+'">'+data[i].title+'</a></strong>';
			            			  tbody1+='<p style="position:relative;line-height:1.4em;height:4.2em;overflow:hidden;">'+data[i].content+'</p>';
			            			  tbody1+='</div>';
			            		  }else if(i<=4){
			            			  tbody2+='<p><a href="<%=PathUtil.getFullPath("news/get-news-by-type-id/")%>'+data[i].contentType+'" style="color: red;">['+data[i].typeName+']</a><a href="<%=PathUtil.getFullPath("home/view-news-id")%>?id='+data[i].id+'">'+data[i].title+'</a></p>';
			            		  }
			            	 }
		            	 }else{
		            		 for(var i in data) {
			            		  if(i==0){
			            			  tbody1+='<div class="media-left">';
			            			  tbody1+='<img src="/static_img/'+data[i].image+'" class="media-object" style="height: 100px;width: 100px;">';
			            			  tbody1+='</div>';
			            			  tbody1+='<div class="media-body">';
			            			  tbody1+='<strong class="media-heading"><a href="<%=PathUtil.getFullPath("video/view-video")%>?id='+data[i].id+'">'+data[i].title+'</a></strong>';
			            			  tbody1+='<p style="position:relative;line-height:1.4em;height:4.2em;overflow:hidden;">'+data[i].discripe+'</p>';
			            			  tbody1+='</div>';
			            		  }else if(i<=4){
			            			  tbody2+='<p><a href="<%=PathUtil.getFullPath("video/view-video")%>?id='+data[i].id+'">'+data[i].title+'</a></p>';
			            		  }
			            	 }
		            	 }
		            	 $('#test5').html(tbody1);
		            	 $('#test6').html(tbody2);
		            }
		        });
            });
            
            $("#resourse3").click(function() {
            	var a="";
            	var id=$("#va3").val();
            	if($("#resourse3").val()==1){
            		$("#resourse3").text(">>资讯");
            		$("#resourse3").val("0");
            		a = "/EarlyEducation/page/home/get-video-resourse/"+id;
            	}else{
            		$("#resourse3").text(">>视频");
            		$("#resourse3").val("1");
            		a = "/EarlyEducation/page/home/get-news-resourse/"+id;
            	}
            	$.ajax({
		             type: "GET",
		             url: a,
		             dataType:"json",
		             async:false,  
		             cache:false,
		             success: function(data){
		            	 $('#test7').empty();
		            	 $('#test8').empty();
		            	 var tbody1='';
		            	 var tbody2='';
		            	 if($("#resourse3").val()==1){
			            	 for(var i in data) {
			            		  if(i==0){
			            			  tbody1+='<div class="media-left">';
			            			  tbody1+='<img src="/static_img/'+data[i].image+'" class="media-object" style="height: 100px;width: 100px;">';
			            			  tbody1+='</div>';
			            			  tbody1+='<div class="media-body">';
			            			  tbody1+='<strong class="media-heading"><a href="<%=PathUtil.getFullPath("video/view-video")%>?id='+data[i].id+'">'+data[i].title+'</a></strong>';
			            			  tbody1+='<p style="position:relative;line-height:1.4em;height:4.2em;overflow:hidden;">'+data[i].content+'</p>';
			            			  tbody1+='</div>';
			            		  }else if(i<=4){
			            			  tbody2+='<p><a href="<%=PathUtil.getFullPath("home/view-news-type")%>?id='+data[i].contentType+'" style="color: red;">['+data[i].typeName+']</a><a href="<%=PathUtil.getFullPath("home/view-news-id")%>?id='+data[i].id+'">'+data[i].title+'</a></p>';
			            		  }
			            	 }
		            	 }else{
		            		 for(var i in data) {
			            		  if(i==0){
			            			  tbody1+='<div class="media-left">';
			            			  tbody1+='<img src="/static_img/'+data[i].image+'" class="media-object" style="height: 100px;width: 100px;">';
			            			  tbody1+='</div>';
			            			  tbody1+='<div class="media-body">';
			            			  tbody1+='<strong class="media-heading"><a href="<%=PathUtil.getFullPath("video/view-video")%>?id='+data[i].id+'">'+data[i].title+'</a></strong>';
			            			  tbody1+='<p style="position:relative;line-height:1.4em;height:4.2em;overflow:hidden;">'+data[i].discripe+'</p>';
			            			  tbody1+='</div>';
			            		  }else if(i<=4){
			            			  tbody2+='<p><a href="<%=PathUtil.getFullPath("video/view-video")%>?id='+data[i].id+'">'+data[i].title+'</a></p>';
			            		  }
			            	 }
		            	 }
		            	 $('#test7').html(tbody1);
		            	 $('#test8').html(tbody2);
		            }
		        });
            });
            
          });
          
        </script>
    </body>
</html>