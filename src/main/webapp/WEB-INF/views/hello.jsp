<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>책 정보 등록</title>
</head>
<body>
<%@ include file="headerBar.jsp" %>
<img src="/resources/images/spring.png"/>
<br/>
<a href="/book/list">책 목록 보기</a>
<sec:authorize access="isAuthenticated()">
    <a href="/user/userList">회원 리스트 보기</a>
    <a href="/book/register">책 등록</a>
</sec:authorize>


</body>
</html>
