<%--
  Created by IntelliJ IDEA.
  User: 26942
  Date: 2018/6/10
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>orderDetail</title>
    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
    <style type="text/css">
        #unHandleTable {
            position: relative;
            top: 50px;
        }

        #unHandleTable th {
            padding-right: 15px;
        }

    </style>
</head>
<body class="personal">

<div class="wrap">
    <jsp:include page="person_left.jsp"/>
    <table id="unHandleTable">
        <tr>
            <th>id</th>
            <th>address</th>
            <th>status</th>
            <th>create_time</th>
            <th>project_id</th>
            <th>project_back</th>
            <th>post</th>
            <th>amount</th>
            <th>opertate</th>
        </tr>
        <tr>
            <td>${data.id}</td>
            <td>${data.address.zone}</td>
            <td>${data.status}</td>
            <td>${data.createTime}</td>
            <td>${data.project.id}</td>
            <td><c:if test="${data.projectBack.compensation eq '0'}">无私回报</c:if>
                <c:if test="${data.projectBack.compensation eq '1'}">有偿回报</c:if>
            </td>
            <td>
                <c:if test="${data.projectBack.post eq '0'}">虚拟回报</c:if>
                <c:if test="${data.projectBack.post eq '1'}">实物回报</c:if>
            </td>
            <td>${data.amount}</td>
            <td><input type="button" value="cancelOrder" class="button" id="cancel" onclick="cac()"></td>

        </tr>


    </table>
</div>
</body>
<script type="text/javascript">
    $.ajax({//调用ajax后台数据异步方法
        //提交的方式
        type: "get",
        async: false,
        //数据的传送页面：要启动界面的地址/界面的后台的方法
        url: "${ctp}/doGetOrderDetail-${data.id}",
        // contentType:false,
        //重要的后台的回调函数（很重要）
        success: function (result) {
            console.log(result.data);
            if (result.flag == 1) {

            } else {

            }

        }
    });

    function cac() {
        $.ajax({
            url: "${ctp}/doCancelOrder-${data.id}",
            // data:
            // dataType:"TEXT",
            type: "POST",
            success: function (result) {
                if (result.flag == 1) {
                    window.location.href = "${ctp}/personCenter/personOrder/detail-\"+${data.id}+\"'"
                }
                else {
                    alert("删除失败");
                }
            }
        });
    }


</script>
</html>
