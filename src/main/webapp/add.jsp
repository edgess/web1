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
<form action="./doadd" method="POST" >
	
	<label>设备编号</label><input type="text" name="p4" />
		<br>
		<label>使用者</label><input type="text" name="p5" />
		<br>
		<label>SN编号</label><input type="text" name="p7" />
		<br>
		<label>部门</label>
		<select  name="p6">
            <c:forEach items="${page2}" var="dep" varStatus="status">
                     <option value="${dep.id}">${dep.dept_name}</option>
            </c:forEach>
        </select>
		<br>
		<label>设备状态</label>
		<select  name="p1">
			<option selected value="A">正常</option>
			<option value="W">已报废</option>
			<option value="C">将过时</option>
        </select>
		<br>
		<label>设备类型</label>
		<select  name="p2">
			<option selected value="C">台式机</option>
			<option value="N">笔记本</option>
			<option value="S">服务器</option>
			<option value="L">激光打</option>
			<option value="P">针式打</option>
			<option value="M">喷墨打</option>
        </select>
		<br>
		<label>设备归属</label>
		<select  name="p3">
			<option selected value="Y">国旅资产</option>
			<option value="G">挂靠资产</option>
			<option value="N">自有设备</option>
			<option value="Z">获赠资产</option>
        </select>
		<br>
		<label>型号</label><input type="text" name="p8"/>
		<br>	
		<label>采购价格</label><input type="text" name="p9"/>
		<br>
		<label>备注</label><input type="text" name="p10"/>
		<br>
		<label>启用日期</label><input type="text" name="p11"/>
		<br>
			<input type="submit" value="提交" />
	</form>
</body>
</html>


