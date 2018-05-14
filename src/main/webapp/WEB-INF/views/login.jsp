<%--
  Created by IntelliJ IDEA.
  User: Penny
  Date: 2018/5/14
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>登录</h2>
    <form action="${ctp}/doLogin" method="post">
        account:<input name="account" type="text">
        password:<input name="password" type="password">
        <input type="submit" value="提交">
    </form>

    <h2>注册</h2>
    <form action="${ctp}/doRegister" method="post">
        account:<input name="mobile" type="text">
        password:<input name="password" type="password">
        <input type="submit" value="提交">
    </form>
</body>
</html>
