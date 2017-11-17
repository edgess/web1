<%@page import="com.sun.xml.internal.ws.client.RequestContext"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>pg2</h1>
	<li>（1）<c:out value="JSTL的out标签的使用" /></li>
	<li>（2）<c:out value="<a href='http://www.cnblogs.com/'>点击链接到博客园</a>" /></li>
	<li>（3）<c:out value="<a href='http://www.cnblogs.com/'>点击链接到博客园</a>" escapeXml="false"/></li>
	<li>（4）<c:out value="&lt未使用字符转义&gt" /></li>
	<li>（5）<c:out value="&lt使用字符转义&gt" escapeXml="false"></c:out></li>
	<li>（6）<c:out value="${null}">使用了默认值</c:out></li>
	<li>（7）<c:out value="${null}"></c:out></li>
	
	
	<%=(String) pageContext.getAttribute("name1")%><br>
	<%=(String) request.getAttribute("name2")%><br>
	<%=application.getAttribute("name3")%><br> ${name3}
	<li>（8）<c:out value="${name3}"></c:out></li>
</body>
</html>