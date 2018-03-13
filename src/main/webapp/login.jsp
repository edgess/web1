<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css">
<script src="https://cdn.bootcss.com/jquery/2.2.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdn.bootcss.com/jquery-validate/1.17.0/jquery.validate.js"></script>
<title>IT设备管理</title>
</head>
<script>
	function chageCode() {
		$('#codeImage').attr('src', 'authCode?abc=' + Math.random());//链接后添加Math.random，确保每次产生新的验证码，避免缓存问题。
	}
	$().ready(
			function() {
				//让当前表单调用validate方法，实现表单验证功能
				$("#ff")
						.validate(
								{
									debug : true, //调试模式，即使验证成功也不会跳转到目标页面
									rules : {
										user : "required",
										pawd : "required",
										authCode : "required"
									},
									messages : {
										user : "不能为空",
										pawd : "不能为空",
										authCode : "不能为空"
									},
									errorClass : "error",
									success : 'valid',
									unhighlight : function(element, errorClass,validClass) { //验证通过
										$(element).tooltip('destroy').removeClass(errorClass);
									},
									//highlight: function (element, errorClass, validClass) { //未通过验证
									//TODO
									//},
									errorPlacement : function(error, element) {
										if ($(element).next("div").hasClass(
												"tooltip")) {
											$(element).attr(
													"data-original-title",
													$(error).text()).tooltip(
													"show");
										} else {
											$(element).attr("title",
													$(error).text()).tooltip(
													"show");
										}
									},
									submitHandler : function(form) {
										form.submit();
									}
								})
			});
</script>
<body>
	<div class="container">
		<div class="jumbotron">
			<div class="row">
				<div class="col-sm-10">
					<h1>IT设备管理系统</h1>
					<p>系统测试中，如信息有误，请与信息部联系</p>
				</div>
				<div class="col-sm-2">
					<br> <label>备份查看</label><br> <a
						href="http://192.168.10.30/">by py+php</a><br> <a
						href="http://192.168.10.183:8888/dbbak/">by java</a><br> <a
						href="http://192.168.10.137:7788">by .net</a>
				</div>
			</div>

		</div>
		<div class="col-sm-offset-3 col-sm-4">
			<form id="ff" class="form-horizontal" action="./login" method="POST">
				<div class="form-group">
					<div id="loginerr1" class="row">
						<label class="control-label col-sm-4">用户名</label>
						<div class="col-sm-8">
							<input class="form-control" type="text" name="user"
								placeholder="请输入用户名" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<div id="loginerr2" class="row">
						<label class="control-label col-sm-4">密码</label>
						<div class="col-sm-8">
							<input class="form-control" type="password" name="pawd"
								placeholder="请输入密码" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<div id="codeerr" class="row">
						<label class="control-label col-sm-4">验证码</label>
						<div class="col-sm-8">
							<input class="form-control" name="authCode" type="text"
								placeholder="请输入验证码" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<!--这里img标签的src属性的值为后台实现图片验证码方法的请求地址-->
						<label class="control-label col-sm-4"></label>
						<div class="col-sm-8">
							<label class="control-label"> <img src="authCode"
								id="codeImage" onclick="chageCode()" title="图片看不清？点击重新得到验证码"
								style="cursor: pointer;" />
							</label> <label class="control-label">&nbsp;&nbsp;</label> <label
								class="control-label"> <a onclick="chageCode()"><span
									class="glyphicon glyphicon-refresh"></span></a>
							</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label class="control-label col-sm-4"></label>
						<div class="col-sm-8">
							<button class="control-label btn btn-primary" type="submit">登录</button>
							<c:if test="${flag == 'codeerr'}">
								<script>
									$("#codeerr").addClass("has-error");
									setTimeout(function() {
										$("#codeerr").removeClass('has-error')
									}, 2000);
								</script>
							</c:if>
							<c:if test="${flag == 'loginerr'}">
								<script>
									$("#loginerr1").addClass("has-error");
									$("#loginerr2").addClass("has-error");
									setTimeout(function() {
										$("#loginerr1")
												.removeClass('has-error')
									}, 2000);
									setTimeout(function() {
										$("#loginerr2")
												.removeClass('has-error')
									}, 2000);
								</script>
							</c:if>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>


