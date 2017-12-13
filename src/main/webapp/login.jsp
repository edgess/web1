<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script language="javascript">
function codefans(){
var box=document.getElementById("divbox");
box.style.display="none"; 
}
setTimeout("codefans()",2000);//2秒，可以改动
</script>
<body>
	<form action="./login" method="POST">
		<label>USER</label> <input type="text" name="user" />
		<br> <label>PAWD</label> <input type="password" name="pawd" /> <br>
		<input type="submit" value="提交" />
		<c:if test="${flag == 'err'}">
			<div id="divbox" style="color:#FF0000">login error</div>
		</c:if>
	</form>
</body>
</html>


