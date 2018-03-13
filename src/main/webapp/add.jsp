<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE>
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


<form class="form-horizontal" action="./doadd" method="POST" >
	
		<div class="form-group">
			<label class="col-sm-2 control-label">设备编号</label>
			<div class="col-sm-3">
			<input class="form-control input-sm" type="text" name="p4" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">使用人</label>
			<div class="col-sm-3">
			<input class="form-control input-sm" type="text" name="p5" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">出厂编号</label>
			<div class="col-sm-3">
			<input class="form-control input-sm" type="text" name="p7" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">财务编号</label>
			<div class="col-sm-3">
			<input class="form-control input-sm" type="text" name="cwstr" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">归属部门</label>
			<div class="col-sm-3" >
			<select class="col-sm-4 form-control" name="p6">
				<c:forEach items="${page2}" var="dep" varStatus="status">
					<option value="${dep.id}">${dep.dept_name}</option>
				</c:forEach>
			</select>
			</div>
			<label class="col-sm-2 control-label">设备归属</label>
			<div class="col-sm-3" >
			<select class="col-sm-4 form-control"  name="p3">
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
				<option value="A">正常</option>
				<option value="W">已报废</option>
				<option value="C">将过时</option>
			</select>
			</div>
			<label class="col-sm-2 control-label">设备类型</label> 
			<div class="col-sm-3" >
			<select class="form-control" name="p2">
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
			<input class="form-control input-sm" type="text" name="p8"/>
		</div>
		<label class="col-sm-2 control-label">采购价格</label>
		<div class="col-sm-3" >
		<input class="form-control input-sm" type="text" name="p9"/>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">备注</label>
		<div class="col-sm-3" >
			<input class="form-control input-sm" type="text" name="p10"/>
		</div>
		<label class="col-sm-2 control-label">启用日期</label>
		<div class="col-sm-3" >
			<input class="form-control input-sm" type="text" name="p11"/>
		</div>
	</div>
		<button class="col-sm-offset-2 btn btn-primary" type="submit" >添加</button>
	</form>
</div>
</body>
</html>


