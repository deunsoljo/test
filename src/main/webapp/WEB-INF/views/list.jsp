<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<html>
<head>
  <title>Book list</title>
  <style>
    table, tr, td {
      border: 1px solid black;
      text-align:center;
    }
  </style>
</head>
<body>
<sec:authorize access="isAuthenticated()">
<a href="/book/register">책 등록</a>
</sec:authorize>
<a href="/">메인 화면으로 가기</a>
<br/>
<table>
  <thead>
  <tr>
    <td>ID</td>
    <td>Title</td>
    <td>Author</td>
    <td>Page</td>
    <td>UserId</td>
    <td>Delete</td>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="u" items="${books}">
    <tr>
      <td>${u.id}</td>
      <td>${u.title}</td>
      <td>${u.author}</td>
      <td>${u.page}</td>
      <td>${u.userId}</td>
      <td><a href="/book/delete?id=${u.id}">삭제</a></td>
    </tr>
  </c:forEach>
  </tbody>
</table>

</body>
</html>
