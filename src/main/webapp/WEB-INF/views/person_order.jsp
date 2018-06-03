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
    <title>购物车</title>
    <link href="${ctp}/css/bstp.css" rel="stylesheet">
    <link href="${ctp}/css/style.css" rel="stylesheet">
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
</head>
<body>
<div class="container-fluid bigHead">
    <div class="row">
        <div class="col-sm-10  col-md-10 col-sm-offset-1 col-md-offset-1">
            <div class="jumbotron">
                <h1>欢迎来到订单页</h1>
                <p>您的购买清单为</p>
            </div>
        </div>
        <div class="col-sm-10  col-md-10 col-sm-offset-1 col-md-offset-1">
            <div class="row">
                <ul class="nav nav-tabs list-group-diy" role="tablist">
                    <li role="presentation" class="active list-group-item-diy"><a href="#unHandle" aria-controls="unHandle" role="tab" data-toggle="tab">待发货订单&nbsp;<span class="badge" id="unHandleCount">0</span></a></li>
                    <li role="presentation" class="list-group-item-diy"><a href="#transport" aria-controls="transport" role="tab" data-toggle="tab">运输中订单&nbsp;<span class="badge" id="transportCount">0</span></a></li>
                    <li role="presentation" class="list-group-item-diy"><a href="#receive" aria-controls="receive" role="tab" data-toggle="tab">已收货订单&nbsp;<span class="badge" id="receiveCount">0</span></a></li>
                    <li role="presentation" class="list-group-item-diy"><a href="#all" aria-controls="all" role="tab" data-toggle="tab">全部订单&nbsp;<span class="badge" id="allCount">0</span></a></li>
                </ul>

                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="unHandle">
                        <table class="table table-hover center" id="unHandleTable">
                        </table>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="transport">
                        <table class="table table-hover center" id="transportTable">
                        </table>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="receive">
                        <table class="table table-hover center" id="receiveTable">
                        </table>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="all">
                        <table class="table table-hover center" id="allTable">
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
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
