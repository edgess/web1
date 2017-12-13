<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
<jsp:include page="yz.jsp"></jsp:include>
<form action="./doedit" method="POST" >
	
	<label>设备编号</label><input type="text" name="p4" value="${page[0].equip_no}"/>
		<br>
		<label>使用者</label><input type="text" name="p5" value="${page[0].username}"/>
		<br>
		<label>SN编号</label><input type="text" name="p7" value="${page[0].sn}"/>
		<br>
		<label>部门</label>
		<select  name="p6">
			<option selected value="${page[0].dept_id}">${page[0].Dept_name}</option>
            <c:forEach items="${page2}" var="dep" varStatus="status">
                     <option value="${dep.id}">${dep.dept_name}</option>
            </c:forEach>
        </select>
		<br>
		<input type="hidden" name="p0" value="${page[0].id}"/>
		<label>设备状态</label>
		<select  name="p1">
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
		<br>
		<label>设备类型</label>
		<select  name="p2">
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
		<br>
		<label>设备归属</label>
		<select  name="p3">
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
		<br>
		<label>型号</label><input type="text" name="p8" value="${page[0].model}"/>
		<br>	
		<label>采购价格</label><input type="text" name="p9" value="${page[0].price}"/>
		<br>
		<label>备注</label><input type="text" name="p10" value="${page[0].memo}"/>
		<br>
		<label>启用日期</label><input type="text" name="p11" value="<fmt:formatDate value="${page[0].startuse}" pattern="yyyy-MM-dd"/>"/>
		<br>
			<input type="submit" value="提交" />
	</form>
</body>
</html>


