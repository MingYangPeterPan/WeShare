<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pdsu.education.Constant" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.pdsu.education.util.SystemPropertiesUtil" %>
<%@ page import="com.pdsu.education.util.PathUtil"%>
<!DOCTYPE html>
<html>
<head>
    <title>早教资讯</title>
    <link href="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/css/lib/bootstrap.min.css" rel="stylesheet">
</head>
<body style="margin-left: 150px;margin-right: 150px;">
    <jsp:include page="top.jsp"></jsp:include>
    <div class="row">
        <div class="col-md-12" style="height: 40px;">
            <ul class="breadcrumb" style="background-color: #FF8040">
                <li><a href="<%=PathUtil.getFullPath("home/init-data")%>">首页</a></li>
                <li style="color: #FFF">资讯列表</li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="list-group">
		    <c:forEach items="${NewsByType}" var="n">
				<div class="list-group-item " data-topic-id="7901," style="margin-left: 15px;margin-right: 15px;">
				    <div class="activity-row">
	                 <div class="col-xs-12 activity-desc">
	                 	<h5><a href="<%=PathUtil.getFullPath("home/view-news-id")%>?id=${n.id }">${n.title }</a></h5>
	                    <p>
							<span class="text-color-999"> ${n.updateTime }发布  
							</span>
						</p>
	                 </div>
	                 <div class="clearfix"> </div>
                    </div>
				</div>
		    </c:forEach>
		</div>
    </div>
<script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/login.js"></script>
<script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/common.js"></script>
</body>
</html>