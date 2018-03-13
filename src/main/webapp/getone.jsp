<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="images/favicon.ico"/>
<link rel="bookmark" href="images/favicon.ico"/>

<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css">  
<script src="https://cdn.bootcss.com/jquery/2.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>设备信息</title>
</head>
<body>
<div class="container">
	<div class="jumbotron">
		<h1>设备信息</h1>
		<p>系统测试中，如信息有误，请与信息部联系</p> 
	</div>
		
	<c:choose>
		<c:when test="${empty page}">
			<h3>无此设备记录</h3>
		</c:when>
		<c:otherwise>	
			<div class="row">
				<div class="col-sm-4">
					<h3>设备编号</h3>
					<p class="text-primary">${page[0].equip_no}</p>
		
				</div>
				<div class="col-sm-4">
					<h3>归属部门</h3>        
					<p class="text-primary">${page[0].Dept_name}</p>
		
				</div>
				<div class="col-sm-4">
					<h3>使用人</h3>
					<p class="text-primary">${page[0].username}</p>
		
				</div>
				<div class="col-sm-4">
					<h3>设备状态</h3>
					<p class="text-primary">
						<c:choose>
							<c:when test="${page[0].status == 'A'}">正常</c:when>
							<c:when test="${page[0].status == 'W'}">已报废</c:when>
							<c:when test="${page[0].status == 'C'}">将过时</c:when>
							<c:otherwise>未知</c:otherwise>
						</c:choose>	
					</p>
				</div>
				<div class="col-sm-4">
					<h3>设备类型</h3>
					<p class="text-primary">
						<c:choose>
						    <c:when test="${page[0].type == 'C'}">台式机</c:when>
						    <c:when test="${page[0].type == 'N'}">笔记本</c:when>
						    <c:when test="${page[0].type == 'S'}">服务器</c:when>
						    <c:when test="${page[0].type == 'L'}">激光打</c:when>
						    <c:when test="${page[0].type == 'P'}">针式打</c:when>
						    <c:when test="${page[0].type == 'M'}">喷墨打</c:when>
						    <c:otherwise>未知</c:otherwise>
						</c:choose>
					</p>
				</div>
				<div class="col-sm-4">
					<h3>设备归属</h3>
					<p class="text-primary">
						<c:choose>
						    <c:when test="${page[0].belong == 'Y'}">国旅资产</c:when>
						    <c:when test="${page[0].belong == 'G'}">挂靠设备</c:when>
						    <c:when test="${page[0].belong == 'N'}">自有设备</c:when>
						    <c:when test="${page[0].belong == 'Z'}">获赠资产</c:when>
						    <c:otherwise>未知</c:otherwise>
						</c:choose>	
					</p>
				</div>
				<div class="col-sm-4">
					<h3>出厂编号</h3>
					<p class="text-primary">${page[0].sn}</p>
				</div>
				<div class="col-sm-4">
					<h3>设备型号</h3>
					<p class="text-primary">${page[0].model}</p>
				</div>
				<div class="col-sm-4">
					<h3>采购价格</h3>
					<p class="text-primary">${page[0].price}</p>
				</div>
				<div class="col-sm-4">
					<h3>启用日起</h3>
					<p class="text-primary"><fmt:formatDate value="${page[0].startuse}" pattern="yyyy-MM-dd"/></p>
				</div>
				<div class="col-sm-4">
					<h3>备注</h3>
					<p class="text-primary">${page[0].memo}</p>
				</div>
				<div class="col-sm-4">
					<h3>财务编号</h3>
				<p class="text-primary">${page[0].cwstr}</p>
				</div>         
			</div>
		</c:otherwise>
	</c:choose>

</div>
</body>
</html>


