<%--
  Created by IntelliJ IDEA.
  User: Lizexu
  Date: 2018/6/3
  Time: 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <table id="unHandleTable">

    </table>
</head>
<body>

<script type="text/javascript">
    $.ajax({//调用ajax后台数据异步方法
        //提交的方式
        type: "get",
        async: false,
        //数据的传送页面：要启动界面的地址/界面的后台的方法
        url: "doGetOrder",
        // contentType:false,
        //重要的后台的回调函数（很重要）
        success: function (result) {
            console.log(result.data);
            if (result.flag == 1) {
                console.log(result.flag);
                // var d = eval('(' + result.data+ ')');
                var d = result.data;
                $("#unHandleTable").append('<th>项目标题</th><th>收货地址</th><th>投资金额</th>');
                for (var i = 0; i < d.length; i++) {
                    if ($("#unHandleTable tr").length <= d.length) {

                        $("#unHandleTable").append(
                            "<tr>" +
                            "<td>" + d[i]["project"].title + "</td>" +
                            "<td>" + d[i]["project"].zone + "</td>" +
                            "<td>" + d[i].amount+ "</td>" +
                            "</tr>");
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
