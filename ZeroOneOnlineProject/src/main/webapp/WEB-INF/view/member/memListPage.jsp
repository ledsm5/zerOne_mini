<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	회원리스트
	<table border="1">
	<tr><td>아이디</td><td>이름</td><td>성별</td></tr>
		<c:forEach items="${list }" var="mem">
			<tr>
				<td><a href="memDetail?memId=${mem.memId }">${mem.memId } </a></td>
				<td>${mem.memName } </td>
				<td>${mem.memGender } </td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>