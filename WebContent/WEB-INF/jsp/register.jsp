<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pdsu.education.Constant" %>
<%@ page import="com.pdsu.education.util.SystemPropertiesUtil" %>
<%@ page import="com.pdsu.education.util.PathUtil"%>
<!DOCTYPE html>
<html>
<head>
<title>register</title>
<link href="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL)%>/static/css/lib/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-left: 150px;margin-right: 150px;">
    <jsp:include page="top.jsp"></jsp:include>
    <div class="row">
        <div class="col-md-12" style="height: 40px;">
            <ul class="breadcrumb" style="background-color: #FF8040">
                <li><a href="#">首页</a></li>
                <li><a href="#" class="text-muted">注册</a></li>
            </ul>
        </div>
    </div>
    <div id="signup-box" class="signup-box widget-box no-border">
		<div class="widget-body">
			<div class="widget-main">
				<h4 class="header green lighter bigger">
					<i class="ace-icon fa fa-users blue"></i>
					用户注册
				</h4>
				<div class="space-6"></div>
				<p>填写信息: </p>
				<form action="<%=PathUtil.getFullPath("user/submit-user")%>" method="post">
					<fieldset>
					    <label class="block clearfix">
							<span class="block input-icon input-icon-right">
								<input name="userName" type="text" class="form-control" placeholder="姓名" />
								<i class="ace-icon fa fa-envelope"></i>
							</span>
						</label>
						<br>
						<label class="block clearfix" style="margin-bottom: 10px;">
							<span class="block input-icon input-icon-right">
								<input  name ="userSex" value="man" type="radio"/>男
								<input  name ="userSex" value="woman" type="radio"/>女
							</span>
						</label>
						<br>
						<label class="block clearfix">
							<span class="block input-icon input-icon-right">
								<input name="loginName" type="text" class="form-control" placeholder="登陆名" />
								<i class="ace-icon fa fa-envelope"></i>
							</span>
						</label>
						<br>
						<label class="block clearfix">
							<span class="block input-icon input-icon-right">
								<input name="password" type="password" class="form-control" placeholder="登陆密码" />
								<i class="ace-icon fa fa-user"></i>
							</span>
						</label>
						<br>
						<label class="block clearfix">
							<span class="block input-icon input-icon-right">
								<input name="repassword" type="password" class="form-control" placeholder="确认密码" />
								<i class="ace-icon fa fa-lock"></i>
							</span>
						</label>
						<br>
						<label class="block clearfix">
							<span class="block input-icon input-icon-right">
								<input name="phone" type="text" class="form-control" placeholder="电话" />
								<i class="ace-icon fa fa-retweet"></i>
							</span>
						</label>
						<br>
						<label class="block clearfix">
							<span class="block input-icon input-icon-right">
								<input name="address" type="text" class="form-control" placeholder="地址" />
								<i class="ace-icon fa fa-retweet"></i>
							</span>
						</label>
						<br>
						<label class="block">
							<a href="#">添加宝贝</a>
						</label>
						<br>
						<label class="block clearfix">
							<span class="block input-icon input-icon-right">
								<input name="childName" type="text" class="form-control" placeholder="宝贝爱称" />
								<i class="ace-icon fa fa-envelope"></i>
							</span>
						</label>
						<br>
						<label class="block clearfix" style="margin-bottom: 10px;">
							<span class="block input-icon input-icon-right">
								<input name="childSex" value="w" type="radio"/>王子
								<input name="childSex" value="m" type="radio"/>公主
								<i class="ace-icon fa fa-envelope"></i>
							</span>
						</label>
						<br>
						<div class="form-group" style="height: 20px;">
			                <label for="dtp_input2" class="col-md-1 control-label" style="margin-left: -15px;">宝贝生日</label>
			                <div class="input-group date form_date col-md-5" data-date="" data-date-format="" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
			                    <input name="birthday" class="form-control" size="16" type="text" value="" readonly>
			                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
								<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
			                </div>
							<input type="hidden" id="dtp_input2" value="" /><br/>
			            </div>
						<br>
						<div class="space-24"></div>
						<div class="clearfix">
							<button type="reset" class="width-30 pull-left btn btn-sm">
								<i class="ace-icon fa fa-refresh"></i>
								<span class="bigger-110">重置</span>
							</button>

							<button class="width-65 pull-left btn btn-sm btn-success" style="margin-left: 15px;">
								<span class="bigger-110">注册</span>
								<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
							</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/login.js"></script>
<script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=SystemPropertiesUtil.getPropetiesValueByKey(Constant.STATIC_URL) %>/static/js/lib/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript">
    $('.form_date').datetimepicker({
        language: 'zh-CN',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
  		todayHighlight: 1,
  		startView: 2,
  		minView: 2,
  		forceParse: 0
    });
</script>
</body>
</html>