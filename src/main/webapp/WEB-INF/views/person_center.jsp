<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" href="css/pc.css">
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="${ctp}/js/user.js"></script>
    <script type="text/javascript" src="${ctp}/js/projectCreate.js"></script>
    <script type="text/javascript" src="${ctp}/js/personAddress.js"></script>
    <!--/*<script src="${ctp}/js/layer.js" type="text/javascript"></script>*/-->
    <title>- 个人中心 -</title>
</head>

<body class="personal">
<div class="wrap">
    <jsp:include page="person_left.jsp"/>
    <div class="r right_content">
        <div class="personal_info fix">
            <div class="personal_info_left l">
                <div class="head_portrait l">
                    <a href="index">index</a>
                    <img src="${sessionScope.user.avatar}" alt="">
                </div>
                <div class="nickname l">
                    <p>username <span style="font-size: 14px;color: gray;"><i>V</i>未认证</span></p>
                    <span>mobile:${sessionScope.user.mobile}</span>
                </div>
            </div>
            <div class="personal_info_right l">
                <div class="personal_info_right_asset">
                    <div class="tit">
                        Property
                    </div>
                    <div class="mub">
                        <div class="mub_com l">
                            <span>BALANCE</span>
                            <p><i>$</i>${sessionScope.user.balance}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>