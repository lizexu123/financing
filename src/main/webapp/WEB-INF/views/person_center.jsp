<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="${ctp}/js/user.js"></script>
    <script type="text/javascript" src="${ctp}/js/projectCreate.js"></script>
    <script type="text/javascript" src="${ctp}/js/personAddress.js"></script>
    <!--/*<script src="${ctp}/js/layer.js" type="text/javascript"></script>*/-->
    <title>- 个人中心 -</title>
    <style type="text/css">
        #logi {
            position: relative;
            text-decoration: none;
            font-size: 18px;
            font-weight: bold;
            color: yellowgreen;
            left: 100px;
            top: 50px;
        }

        #Logout {

            position: relative;
            text-decoration: none;
            left: 1200px;
            top: 60px;
            font-size: 18px;
            font-weight: bold;
            color: yellowgreen;

        }
    </style>
</head>

<body class="personal">
<a id="logi" href="index">index</a>
<a id="Logout" href="doLogout">Log out</a>
<div class="wrap">
    <jsp:include page="person_left.jsp"/>
    <div class="r right_content">
        <div class="personal_info fix">
            <div class="personal_info_left l">
                <div class="head_portrait l">
                    <img src="${sessionScope.user.avatar}" alt="">
                </div>
                <div class="nickname l">
                    <p>
                        username
                        <span style="font-size: 14px;color: gray;">
                            <i>
                            <c:if test="${sessionScope.user.status==1}">Certified</c:if>
                            <c:if test="${sessionScope.user.status==0}">Uncertified</c:if>
                            <c:if test="${sessionScope.user.status==-1}">Blacklist User</c:if>
                            </i>
                        </span>
                    </p>
                    <span>mobile &nbsp; : &nbsp; ${sessionScope.user.mobile}</span>
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
<script>
    $(document).ready(function () {
        $.ajax({
            type: "GET",
            async: false,
            //数据的传送页面：要启动界面的地址/界面的后台的方法
            url: "${ctp}/doUserInfo",
            // contentType:false,
            data: null,
            //传到服务器的参数类型
            dataType: "json",
            //重要的后台的回调函数（很重要）
            success: function (result) {
                console.log(result.msg);
            },
        })
    })
</script>
</html>