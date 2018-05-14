<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<body>
<h2>Hello World!</h2>

<a href="${ctp}/login">登录/注册</a>
<a href="#">个人中心-${sessionScope.user.id}</a>
</body>
</html>
