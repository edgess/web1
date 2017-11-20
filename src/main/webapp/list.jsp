<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

</head>
<body>
<%-- ${page }<br>

${page3 }<br> --%>
	<form id="search_form" action="./list" method="POST" >
		<c:if test="${!empty page}">
<!-- 				a标签设定隐藏input的value，并且提交表单 -->
				<a href="javascript:void(0)" onclick="document.getElementById('pgset').setAttribute('value',${page3.pageNo-1==0?1:page3.pageNo-1});document.getElementById('search_form').submit();" >&lt;上一页</a> 
			 	--共 ${page3.resultCount} 条记录--共${page3.pageCount} 页--当前${page3.pageNo } 页--
				<a href="javascript:void(0)" onclick="document.getElementById('pgset').setAttribute('value',${page3.pageNo==page3.pageCount?page3.pageNo:page3.pageNo+1});document.getElementById('search_form').submit();"> 下一页&gt;</a>
		</c:if>

<!-- 			隐藏input -->
			<input id="pgset" type="hidden" name="pageNo" value="" /><input id="pgdel" type="hidden" name="pagedel" value="" />
			<br>
			<label>设备编号</label><input type="text" name="p4" value="${page3.p4}" />
			<br>
			<label>使用者</label><input type="text" name="p5" value="${page3.p5}" />
			<br>
			<label>SN编号</label><input type="text" name="p7" value="${page3.p7}" />
			<br>
			<label>部门</label>
				<select  name="p6">
					<option selected value="${page3.p6}">
<!-- 						回显只有部门号，遍历取名字 -->
						<c:forEach items="${page2}" var="dep" varStatus="status">
							<c:if test="${page3.p6 == dep.id}" >${dep.dept_name}</c:if>
	               		</c:forEach>
	               		<c:if test="${page3.p6 == ''}" >全部</c:if>
					</option>
					<option value="">全部</option>
	                <c:forEach items="${page2}" var="dep" varStatus="status">
	                         <option value="${dep.id}">${dep.dept_name}</option>
	                </c:forEach>
	            </select>
			<br>
			<label>设备状态</label>
				<select  name="p1">
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
			<br>
			<label>设备类型</label>
				<select  name="p2">
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
					<option value="">全部</option>
					<option value="C">台式机</option>
					<option value="N">笔记本</option>
					<option value="S">服务器</option>
					<option value="L">激光打</option>
					<option value="P">针式打</option>
					<option value="M">喷墨打</option>
	            </select>
			<br>
			<label>设备归属</label>
				<select  name="p3">
				<option selected value="${page3.p3}">
						<c:choose>
						    <c:when test="${page3.p3 == 'Y'}">国旅资产</c:when>
						    <c:when test="${page3.p3 == 'G'}">挂靠设备</c:when>
						    <c:when test="${page3.p3 == 'N'}">自有设备</c:when>
						    <c:when test="${page3.p3 == 'Z'}">获赠资产</c:when>
						    <c:otherwise>全部</c:otherwise>
						</c:choose>
					</option>
					<option value="Y">国旅资产</option>
					<option value="">全部</option>
					<option value="G">挂靠设备</option>
					<option value="N">自有设备</option>
					<option value="Z">获赠资产</option>
	            </select>
			<br>
			<input type="submit" value="查询" />
	</form>
<!-- 	去add的control -->
	<button onclick="javascript:window.location.href='./add'" >添加</button>
	<c:if test="${!empty page}">
	<table border=1px>
		<tr>
			<th>删除</th>
			<th>设备编号</th>
			<th>使用着</th>
			<th>部门</th>
			<th>SN编号</th>
			<th>设备状态</th>
			<th>设备类型</th>
			<th>设备归属</th>
		</tr>
		<c:forEach var="iteq" items="${page}">
			<tr>
<!-- 				添加删除按钮 -->
				<td>
<%-- 					<button onclick="javascript:window.location.href='./del?id=${iteq.id}'" >删除</button> --%>
<!-- 					修改form的action，插入id和pageNo到隐藏input，提交到del，为了删除后的回现问题 -->
					<button onclick="document.getElementById('search_form').setAttribute('action','./del');
									 document.getElementById('pgset').setAttribute('value',${page3.pageNo});
									 document.getElementById('pgdel').setAttribute('value',${iteq.id});
									 document.getElementById('search_form').submit();" >删除</button>
				</td>
<!-- 				添加修改按钮 -->
				<td><a href="./edit?id=${iteq.id}"><c:out value="${iteq.equip_no}" /></a></td>
				<td><c:out value="${iteq.username}" /></td>
				<td><c:out value="${iteq.Dept_name}" /></td>
				<td><c:out value="${iteq.sn}" /></td>
				<td>
					<c:choose>
					    <c:when test="${iteq.status == 'A'}">正常</c:when>
					    <c:when test="${iteq.status == 'W'}">已报废</c:when>
					    <c:when test="${iteq.status == 'C'}">将过时</c:when>
					    <c:otherwise>未知</c:otherwise>
					</c:choose>				
				</td>
				<td>
					<c:choose>
					    <c:when test="${iteq.type == 'C'}">台式机</c:when>
					    <c:when test="${iteq.type == 'N'}">笔记本</c:when>
					    <c:when test="${iteq.type == 'S'}">服务器</c:when>
					    <c:when test="${iteq.type == 'L'}">激光打</c:when>
					    <c:when test="${iteq.type == 'P'}">针式打</c:when>
					    <c:when test="${iteq.type == 'M'}">喷墨打</c:when>
					    <c:otherwise>未知</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
					    <c:when test="${iteq.belong == 'Y'}">国旅资产</c:when>
					    <c:when test="${iteq.belong == 'G'}">挂靠设备</c:when>
					    <c:when test="${iteq.belong == 'N'}">自有设备</c:when>
					    <c:when test="${iteq.belong == 'Z'}">获赠资产</c:when>
					    <c:otherwise>未知</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
</body>
</html>