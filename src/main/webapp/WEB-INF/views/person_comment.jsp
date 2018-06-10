<%--
  Created by IntelliJ IDEA.
  User: 26942
  Date: 2018/6/6
  Time: 0:19
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>用户评论页</title>
    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <style type="text/css">
        #customer {
            position: relative;
            top: 150px;
            left: -120px;
        }

        #getO {
            position: relative;
            top: 100px;
            left: -50px;
        }

        #customerI th {
            padding-right: 30px;
        }

        #getI {
            position: relative;
            top: 150px;
            left: 230px;
        }

        #customerI {
            position: relative;
            top: 200px;
            left: 170px;
        }
    </style>
</head>
<body class="personal">

<div class="wrap">
    <jsp:include page="person_left.jsp"/>
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
    <h3 id="getO">GetOwnerComment</h3>
    <table id="customer">

    </table>
    <h3 id="getI">GetReceiveComment</h3>
    <table id="customerI">

    </table>

</div>
<script>
    $.ajax({//调用ajax后台数据异步方法
        //提交的方式
        type: "get",
        async: false,
        //数据的传送页面：要启动界面的地址/界面的后台的方法
        url: "${ctp}/doGetOwnerComment",
        // contentType:false,
        //重要的后台的回调函数（很重要）
        success: function (result) {
            console.log(result.data);
            if (result.flag == 1) {
                console.log(result.flag);
                // var d = eval('(' + result.data+ ')');
                var d = result.data;
                console.log(d);
                $("#customer").append('<th>content</th><th>createTime</th><th>from_user_id</th><th>to_user_id</th>');
                for (var i = 0; i < d.length; i++) {
                    if ($("#customer tr").length <= d.length) {
                        if (d[i].toUser == null) {
                            d[i].toUser = new Object();
                            d[i].toUser.id = "";
                        }
                        $("#customer").append(
                            "<tr>" +
                            "<td>" + d[i]["content"] + "</td>" +
                            "<td>" + d[i]["createTime"] + "</td>" +
                            "<td>" + d[i].fromUser.id + "</td>" +
                            "<td>" + d[i].toUser.id + "</td>" +
                            +"</tr>");

                    } else {
                        layer.msg("拿不到数据");
                    }

                }
            }
        }
    });
    $.ajax({//调用ajax后台数据异步方法
        //提交的方式
        type: "get",
        async: false,
        //数据的传送页面：要启动界面的地址/界面的后台的方法
        url: "${ctp}/doGetReceiveComment",
        // contentType:false,
        //重要的后台的回调函数（很重要）
        success: function (result) {
            console.log(result.data);
            if (result.flag == 1) {
                console.log(result.flag);
                // var d = eval('(' + result.data+ ')');
                var d = result.data;
                console.log(d);
                $("#customerI").append('<th>content</th><th>createTime</th><th>from_user_id</th>');
                for (var i = 0; i < d.length; i++) {
                    if ($("#customerI tr").length <= d.length) {
                        $("#customerI").append(
                            "<tr>" +
                            "<td>" + d[i]["content"] + "</td>" +
                            "<td>" + d[i]["createTime"] + "</td>" +
                            "<td>" + d[i].fromUser.id + "</td>" +
                            +"</tr>");

                    } else {
                        layer.msg("拿不到数据");
                    }

                }
            }
        }
    });
</script>

</body>
</html>
