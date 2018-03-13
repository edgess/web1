<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="images/favicon.ico"/>
<link rel="bookmark" href="images/favicon.ico"/>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css">  
<script src="https://cdn.bootcss.com/jquery/2.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>IT设备管理</title>
</head>
<body>
<div class="container">
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target="#example-navbar-collapse">
            <span class="sr-only">切换导航</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="./dolist">设备查询</a>
    </div>
    <div class="collapse navbar-collapse" id="example-navbar-collapse">
        <ul class="nav navbar-nav navbar-right">
			<li><a href="./logout"><span class="glyphicon glyphicon-log-out"></span>&nbsp;退出</a></li>
        </ul>
    </div>
    </div>
</nav>

<form class="form-horizontal" action="./doedit" method="POST" >
	<input type="hidden" name="p0" value="${page[0].id}"/>
	<div class="form-group">
		<label class="col-sm-2 control-label">设备编号</label>
		<div class="col-sm-3">
		<input class="form-control input-sm" type="text" name="p4" value="${page[0].equip_no}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">使用人</label>
		<div class="col-sm-3">
		<input class="form-control input-sm" type="text" name="p5" value="${page[0].username}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">出厂编号</label>
		<div class="col-sm-3">
		<input class="form-control input-sm" type="text" name="p7" value="${page[0].sn}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">财务编号</label>
		<div class="col-sm-3">
		<input class="form-control input-sm" type="text" name="cwstr" value="${page[0].cwstr}"/>
		</div>
	</div>
			
	<div class="form-group">
       	<label class="col-sm-2 control-label">归属部门</label>
		<div class="col-sm-3" >
			<select class="col-sm-4 form-control" name="p6">
				<option selected value="${page[0].dept_id}">${page[0].Dept_name}</option>
	            <c:forEach items="${page2}" var="dep" varStatus="status">
	                     <option value="${dep.id}">${dep.dept_name}</option>
	            </c:forEach>
			</select>
		</div>
		
		<label class="col-sm-2 control-label">设备归属</label>
		<div class="col-sm-3" >
		<select class="col-sm-4 form-control"  name="p3">
			<option selected value="${page[0].belong}">
				<c:choose>
				    <c:when test="${page[0].belong == 'Y'}">国旅资产</c:when>
				    <c:when test="${page[0].belong == 'G'}">挂靠设备</c:when>
				    <c:when test="${page[0].belong == 'N'}">自有设备</c:when>
				    <c:when test="${page[0].belong == 'Z'}">获赠资产</c:when>
					<c:otherwise>未知</c:otherwise>
				</c:choose>
			</option>
			<option value="Y">国旅资产</option>
			<option value="G">挂靠设备</option>
			<option value="N">自有设备</option>
			<option value="Z">获赠资产</option>
		</select> 
		</div>
	</div>		
	
	<div class="form-group">
		<label class="col-sm-2 control-label">设备状态</label>
		<div class="col-sm-3" >
		<select class="form-control" name="p1">
			<option selected value="${page[0].status}">
				<c:choose>
					    <c:when test="${page[0].status == 'A'}">正常</c:when>
					    <c:when test="${page[0].status == 'W'}">已报废</c:when>
					    <c:when test="${page[0].status == 'C'}">将过时</c:when>
					    <c:otherwise>未知</c:otherwise>
				</c:choose>	
			</option>
			<option value="A">正常</option>
			<option value="W">已报废</option>
			<option value="C">将过时</option>
		</select>
		</div>
		<label class="col-sm-2 control-label">设备类型</label> 
		<div class="col-sm-3" >
		<select class="form-control" name="p2">
			<option selected value="${page[0].type}">
				<c:choose>
					    <c:when test="${page[0].type == 'C'}">台式机</c:when>
					    <c:when test="${page[0].type == 'N'}">笔记本</c:when>
					    <c:when test="${page[0].type == 'S'}">服务器</c:when>
					    <c:when test="${page[0].type == 'L'}">激光打</c:when>
					    <c:when test="${page[0].type == 'P'}">针式打</c:when>
					    <c:when test="${page[0].type == 'M'}">喷墨打</c:when>
					    <c:otherwise>未知</c:otherwise>
				</c:choose>
			</option>
			<option value="C">台式机</option>
			<option value="N">笔记本</option>
			<option value="S">服务器</option>
			<option value="L">激光打</option>
			<option value="P">针式打</option>
			<option value="M">喷墨打</option>
		</select>
		</div>
	</div>

	<div class="form-group">
		<label class="col-sm-2 control-label">型号</label>
		<div class="col-sm-3" >
			<input class="form-control input-sm" type="text" name="p8" value="${page[0].model}"/>
		</div>
		<label class="col-sm-2 control-label">采购价格</label>
		<div class="col-sm-3" >
		<input class="form-control input-sm" type="text" name="p9" value="${page[0].price}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">备注</label>
		<div class="col-sm-3" >
			<input class="form-control input-sm" type="text" name="p10" value="${page[0].memo}"/>
		</div>
		<label class="col-sm-2 control-label">启用日期</label>
		<div class="col-sm-3" >
			<input class="form-control input-sm" type="text" name="p11" value="<fmt:formatDate value="${page[0].startuse}" pattern="yyyy-MM-dd"/>"/>
		</div>
	</div>
	<button class="col-sm-offset-2 btn btn-primary" type="submit" >修改</button>
</form>
</div>
</body>
</html>


