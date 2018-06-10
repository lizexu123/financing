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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
    <style type="text/css">
        #unHandleTable th {
            padding-right: 25px;
        }

        #unHandleTable {
            margin-top: 50px;
        }

    </style>
</head>
<body class="personal">

<div class="wrap">
    <jsp:include page="person_left.jsp"/>
    <table id="unHandleTable">

    </table>

    <script type="text/javascript">
        $.ajax({//调用ajax后台数据异步方法
            //提交的方式
            type: "get",
            async: false,
            //数据的传送页面：要启动界面的地址/界面的后台的方法
            url: "${ctp}/doGetOrder",
            // contentType:false,
            //重要的后台的回调函数（很重要）
            success: function (result) {
                console.log(result.data);
                if (result.flag == 1) {
                    console.log(result.flag);
                    // var d = eval('(' + result.data+ ')');
                    var d = result.data;
                    console.log(d);
                    $("#unHandleTable").append('<th>id</th><th>address</th><th>status</th><th>create_time</th><th>project_id</th><th>project_back</th><th>post</th><th>operate</th>');
                    for (var i = 0; i < d.length; i++) {
                        if ($("#unHandleTable tr").length <= d.length) {
                            if (d[i].status == 0) {
                                d[i].status = new Object();
                                d[i].status = "Raising money";
                            } else {
                                d[i].status = "End the fundraising";
                            }
                            if (d[i]["projectBack"].compensation == 0) {
                                d[i]["projectBack"] = new Object();
                                d[i]["projectBack"].compensation = "无私回报";
                                d[i]["projectBack"].post = new Object();
                                d[i]["projectBack"].post = "";
                            } else {
                                d[i]["projectBack"].compensation = "有偿回报";
                                if (d[i]["projectBack"].post == 0) {
                                    d[i]["projectBack"].post = "虚拟回报";
                                } else {
                                    d[i]["projectBack"].post = "实体回报";
                                }
                            }

                            $("#unHandleTable").append(
                                "<tr>" +
                                "<td>" + d[i]["id"] + "</td>" +
                                "<td>" + d[i]["address"].zone + "</td>" +
                                "<td>" + d[i]["status"] + "</td>" +
                                "<td>" + d[i]["createTime"] + "</td>" +
                                "<td>" + d[i]["project"].id + "</td>" +
                                "<td>" + d[i]["projectBack"].compensation + "</td>" +
                                "<td>" + d[i]["projectBack"].post + "</td>" +
                                "<td>" + "<input id='or' class=\"button\" type='button' value='submit order'> " + "</td>" +

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
