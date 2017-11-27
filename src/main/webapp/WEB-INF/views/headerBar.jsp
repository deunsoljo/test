<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>

<sec:authorize access="isAnonymous()">
    <a href="/user/signup">회원가입</a>
    <a href="/user/signin">로그인</a>
    <br/>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
${user.name}님 로그인하셨습니다.<br/>
<a href="/user/signout">로그아웃</a>
</sec:authorize>

<br/><br/><br/>
<hr/>