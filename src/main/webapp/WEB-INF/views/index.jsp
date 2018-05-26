<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Funding</title>
    <link rel="stylesheet" href="${ctp}/css/main.css" type="text/css"/>
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="${ctp}/js/jquery.sudoSlider.min.js"></script>
    <script type="text/javascript" src="${ctp}/js/globals.js"></script>
</head>
<body class="loaded">
<div class="DesignHolder">
    <div class="LayoutFrame">
        <jsp:include page="header.jsp"/>
        <div class="firstBackground">
            <br/><br/><br/><br/><br/><br/><br/><br/><br/>
            <h1 style="color: white;">用于填写各个部件</h1>
            <br/><br/><br/><br/><br/><br/><br/><br/><br/>
            <jsp:include page="aboutProject.jsp"/>
        </div>
        <div class="secondBackground">
            <br/><br/><br/><br/><br/>
            <div class="Container">
                <!--装载各种显示数据-->
                <jsp:include page="aboutProject.jsp"/>
            </div>
            <br/><br/><br/><br/><br/><br/><br/><br/><br/>
            <jsp:include page="footer.jsp"/>
        </div>
    </div>
</div>
</body>
</html>
