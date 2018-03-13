<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="bookmark" href="images/favicon.ico" />
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
        <ul class="nav navbar-nav">
            <li><a href="javascript:void(0)" onclick="if(confirm('确定生成电子台账吗 ？')){document.getElementById('search_form').setAttribute('action','./getfile');document.getElementById('search_form').submit();document.getElementById('search_form').setAttribute('action','./dolist');}">
            <span class="glyphicon glyphicon-file"></span>&nbsp;生成电子台账</a></li>
            <li><a href="./gettagpaper.jsp"><span class="glyphicon glyphicon-qrcode"></span>&nbsp;生成标签贴纸</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
        		<li><a  style="pointer-events: none">您好:${name}</a></li>
        		<li><a href="./logout"><span class="glyphicon glyphicon-log-out"></span>&nbsp;退出</a></li>
        </ul>
        
    </div>
    </div>
</nav>

<!-- <div class="pull-right"><button class="btn btn-warning" onclick="javascript:window.location.href='./logout'"><span class="glyphicon glyphicon-log-out"></span>&nbsp;退出</button></div>

<div class="row">
	<div class="col-sm-offset-1  col-sm-3">
	<button class="btn btn-block btn-info" 
		onclick="if(confirm('确定生成电子台账吗 ？')){document.getElementById('search_form').setAttribute('action','./getfile');document.getElementById('search_form').submit();document.getElementById('search_form').setAttribute('action','./list');}"><span class="glyphicon glyphicon-file"></span>&nbsp;生成电子台账</button>
	</div>
	<div  class="col-sm-3">
	<button class="btn btn-block btn-info" onclick="javascript:window.location.href='./gettagpaper.jsp'"><span class="glyphicon glyphicon-qrcode"></span>&nbsp;生成标签贴纸</button>
	</div>
</div> -->
		
	<form id="search_form"  class="form-horizontal" action="./dolist" method="POST">

		<!-- 隐藏input -->
		<input id="pgset" type="hidden" name="pageNo" value="" />
		<input id="pgdel" type="hidden" name="pagedel" value="" />

		<div class="form-group">
			<label class="col-sm-2 control-label">设备编号</label>
			<div class="col-sm-3">
			<input class="form-control input-sm" type="text" name="p4" value="${page3.p4}" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">使用人</label>
			<div class="col-sm-3">
			<input class="form-control input-sm" type="text" name="p5" value="${page3.p5}" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">出厂编号</label>
			<div class="col-sm-3">
			<input class="form-control input-sm" type="text" name="p7" value="${page3.p7}" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">归属部门</label>
			<div class="col-sm-3" >
			<select class="col-sm-4 form-control" name="p6">
				<option selected value="${page3.p6}">
					<!-- 回显只有部门号，遍历取名字 -->
					<c:forEach items="${page2}" var="dep" varStatus="status">
						<c:if test="${page3.p6 == dep.id}">${dep.dept_name}</c:if>
					</c:forEach>
					<c:if test="${page3.p6 == '999'}">管理部门</c:if>
					<c:if test="${page3.p6 == ''}">全部</c:if>
				</option>
				<option value="">全部</option>
				<option value="999">管理部门</option>
				<c:forEach items="${page2}" var="dep" varStatus="status">
					<option value="${dep.id}">${dep.dept_name}</option>
				</c:forEach>
			</select>
			</div>
			<label class="col-sm-2 control-label">设备归属</label>
			<div class="col-sm-3" >
			<select class="col-sm-4 form-control"  name="p3">
				<option selected value="${page3.p3}">
					<c:choose>
						<c:when test="${page3.p3 == 'Y'}">国旅资产</c:when>
						<c:when test="${page3.p3 == 'G'}">挂靠设备</c:when>
						<c:when test="${page3.p3 == 'N'}">自有设备</c:when>
						<c:when test="${page3.p3 == 'Z'}">获赠资产</c:when>
						<c:otherwise>全部</c:otherwise>
					</c:choose>
				</option>
				<option value="">全部</option>
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
				<option selected value="${page3.p1}">
					<c:choose>
						<c:when test="${page3.p1 == 'A'}">正常</c:when>
						<c:when test="${page3.p1 == 'W'}">已报废</c:when>
						<c:when test="${page3.p1 == 'C'}">将过时</c:when>
						<c:otherwise>全部</c:otherwise>
					</c:choose>
				</option>
				<option value="A">正常</option>
				<option value="">全部</option>
				<option value="W">已报废</option>
				<option value="C">将过时</option>
			</select>
			</div>
			<label class="col-sm-2 control-label">设备类型</label> 
			<div class="col-sm-3" >
			<select class="form-control" name="p2">
				<option selected value="${page3.p2}">
					<c:choose>
						<c:when test="${page3.p2 == 'C'}">台式机</c:when>
						<c:when test="${page3.p2 == 'N'}">笔记本</c:when>
						<c:when test="${page3.p2 == 'S'}">服务器</c:when>
						<c:when test="${page3.p2 == 'L'}">激光打</c:when>
						<c:when test="${page3.p2 == 'P'}">针式打</c:when>
						<c:when test="${page3.p2 == 'M'}">喷墨打</c:when>
						<c:otherwise>全部</c:otherwise>
					</c:choose>
				</option>
				<option value="">全部</option>
				<option value="C">台式机</option>
				<option value="N">笔记本</option>
				<option value="S">服务器</option>
				<option value="L">激光打</option>
				<option value="P">针式打</option>
				<option value="M">喷墨打</option>
			</select>
			</div>
		</div>

	</form>
		<div  class="row">
			<div class="col-sm-offset-2 col-sm-2">
				<button class="btn btn-primary btn-sm" onclick="document.getElementById('search_form').setAttribute('action','./dolist');document.getElementById('search_form').submit();"><span class="glyphicon glyphicon-search"></span>查询记录</button>
			</div>
			<div class="col-sm-offset-3 col-sm-2">
				<button class="btn btn-info btn-sm" onclick="javascript:window.location.href='./add'"><span class="glyphicon glyphicon glyphicon-plus"></span>添加记录</button>
			</div>
		</div>		
		<div style="padding: 20px;"></div>
	<c:if test="${!empty page}">
		
		<!--a标签设定隐藏input的value，并且提交表单 -->
		<a href="javascript:void(0)"
			onclick="document.getElementById('pgset').setAttribute('value',${page3.pageNo-1==0 ? 1 : page3.pageNo-1});document.getElementById('search_form').submit();">&lt;上一页</a> 
		 	
		 	--共 ${page3.resultCount} 条记录-
		 	
		<c:forEach var="i" begin="1" end="${page3.pageCount}" step="1">
			<a href="javascript:void(0)"
				onclick="document.getElementById('pgset').setAttribute('value',${i});document.getElementById('search_form').submit();">
				${i}</a>
		</c:forEach> 
		 	
		 	-当前第${page3.pageNo } 页--
		 	
		<a href="javascript:void(0)" onclick="document.getElementById('pgset').setAttribute('value',${page3.pageNo==page3.pageCount ? page3.pageNo : page3.pageNo+1});document.getElementById('search_form').submit();">
			下一页&gt;</a>
	
		<table class="table table-striped table-bordered table-condensed">
			<tr>
				<th>设备编号</th>
				<th>使用人</th>
				<th>归属部门</th>
				<th>出厂编号</th>
				<th>设备状态</th>
				<th>设备类型</th>
				<th>设备归属</th>
				<th>操作</th>
			</tr>
			<c:forEach var="iteq" items="${page}">
				<tr>
					<td><c:out value="${iteq.equip_no}" /></td>
					<td><c:out value="${iteq.username}" /></td>
					<td><c:out value="${iteq.Dept_name}" /></td>
					<td><c:out value="${iteq.sn}" /></td>
					<td><c:choose>
							<c:when test="${iteq.status == 'A'}">正常</c:when>
							<c:when test="${iteq.status == 'W'}">已报废</c:when>
							<c:when test="${iteq.status == 'C'}">将过时</c:when>
							<c:otherwise>未知</c:otherwise>
						</c:choose></td>
					<td><c:choose>
							<c:when test="${iteq.type == 'C'}">台式机</c:when>
							<c:when test="${iteq.type == 'N'}">笔记本</c:when>
							<c:when test="${iteq.type == 'S'}">服务器</c:when>
							<c:when test="${iteq.type == 'L'}">激光打</c:when>
							<c:when test="${iteq.type == 'P'}">针式打</c:when>
							<c:when test="${iteq.type == 'M'}">喷墨打</c:when>
							<c:otherwise>未知</c:otherwise>
						</c:choose></td>
					<td><c:choose>
							<c:when test="${iteq.belong == 'Y'}">国旅资产</c:when>
							<c:when test="${iteq.belong == 'G'}">挂靠设备</c:when>
							<c:when test="${iteq.belong == 'N'}">自有设备</c:when>
							<c:when test="${iteq.belong == 'Z'}">获赠资产</c:when>
							<c:otherwise>未知</c:otherwise>
						</c:choose></td>
					<td>
						<!-- 添加修改按钮 -->
						<a href="./edit?id=${iteq.id}"><span title="修改" class="glyphicon glyphicon-edit"></span></a>
						<!-- 添加删除按钮 -->
						<!-- 修改form的action，插入id和pageNo到隐藏input，提交到del，为了删除后的回现问题 -->
						<a href="javascript:void(0)" onclick="if(confirm('确定删除吗 ？')){document.getElementById('search_form').setAttribute('action','./del');
									 document.getElementById('pgset').setAttribute('value',${page3.pageNo});
									 document.getElementById('pgdel').setAttribute('value',${iteq.id});
									 document.getElementById('search_form').submit();}"><span title="删除" class="glyphicon glyphicon-remove"></span></a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>
</body>
</html>