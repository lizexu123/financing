<%--
  Created by IntelliJ IDEA.
  User: Penny
  Date: 2018/5/31
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Financing Back Manage</title>
    <link href="${ctp}/css/bmmain.css" rel="stylesheet" type="text/css">
    <script src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script src="${ctp}/js/bm.js"></script>

</head>

<body>
<jsp:include page="bm_left.jsp"/>

<div class="main-content" style="max-height: 1200px;">
    <jsp:include page="bm_header.jsp"/>
    <div id="page-wrapper">
        <div class="page-wrapper-inner">
            <h3 style="font-size: 2em;color: #292929;margin: 0 0 0.5em 1em;">Order profile</h3>
            <div class="order-profile"  style="margin-top: 30px;">
                <div class="panel-head">
                    <h2>Order List</h2>
                </div>
                <div class="order-table">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>ID</th>
                            <th>USERID</th>
                            <th>PROJECTID</th>
                            <th>AMOUNT</th>
                            <th>BACK</th>
                            <th>PAID</th>
                            <th>POST</th>
                            <th>ADDRESS</th>
                            <th>CREATE</th>
                            <th class="dropdown">
                                <a href="javascript:void(0);" onclick="submenu(this)">STATUS</a>
                                <ul class="dropdown-action" style="left: 0;">
                                    <li> <a href="javascript:void(0);" onclick="getOrders()">ALL</a> </li>
                                    <li> <a href="javascript:void(0);" onclick="getOrdersByStatus(0)">SUBMITTED</a> </li>
                                    <li> <a href="javascript:void(0);" onclick="getOrdersByStatus(-1)">WITHDRAWN</a> </li>
                                    <li> <a href="javascript:void(0);" onclick="getOrdersByStatus(-2)">REFUND</a> </li>
                                </ul>
                            </th>
                        </tr>
                        </thead>
                        <tbody id="orders">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<footer>
    <p>Copyright &copy; 2018.Penny&nbsp;Wendy&nbsp;CoolLi&nbsp; All rights reserved.</p>
</footer>
</body>
<script>
    $(document).ready(function () {
        getOrders();
    });
    function getOrders() {
        $.ajax({
            type:'GET',
            async : true,
            url : '${ctp}/doGetOrderList',
            dataType : 'json',
            data:null,
            success:(function(result){
                var flag = parseInt(result.flag);
                var data = result.data;

                if(flag == 1) {
                    $("#orders").empty();
                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            var str = "";
                            str += "<tr>" +
                                "<th scope=\"row\">" + (i + 1) + "</th>" +
                                "<td>" + data[i].id + "</td>" +
                                "<td>" + data[i].user.id + "</td>" +
                                "<td>" + data[i].project.id + "</td>" +
                                "<td>" + data[i].amount + "</td>" +
                                "<td>" + data[i].projectBack.content + "</td>" +
                                "<td>" + (data[i].compensation==1 ? 'N':'Y')+ "</td>" +
                                "<td>" + (data[i].post==1 ? 'Y':'N' )+ "</td>" +
                                "<td>" + data[i].address.zone+'-'+data[i].address.detail + "</td>" +
                                "<td>" + data[i].createTime + "</td>"

                            switch (data[i].status){
                                case 0:
                                    str+="<td> submitted </td>";
                                    break;
                                case -1:
                                    str+="<td> withdrawn</td>";
                                    break;
                                case -2:
                                    str+="<td> refund </td>";
                                    break;
                            }

                            str+="</tr>";

                            $("#orders").append(str);
                        }
                    }
                } else if(flag == 0){
                    alert("error");
                }
            })
        })
    }

    function getOrdersByStatus(status) {
        $.ajax({
            type:'GET',
            async : true,
            url : '${ctp}/doGetOrderList',
            dataType : 'json',
            data:null,
            success:(function(result){
                var flag = parseInt(result.flag);
                var data = result.data;

                if(flag == 1) {
                    $("#orders").empty();
                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            if (data[i].status==status) {
                                var str = "";
                                str += "<tr>" +
                                    "<th scope=\"row\">" + (i + 1) + "</th>" +
                                    "<td>" + data[i].id + "</td>" +
                                    "<td>" + data[i].user.id + "</td>" +
                                    "<td>" + data[i].project.id + "</td>" +
                                    "<td>" + data[i].amount + "</td>" +
                                    "<td>" + data[i].projectBack.content + "</td>" +
                                    "<td>" + (data[i].compensation == 1 ? 'N' : 'Y') + "</td>" +
                                    "<td>" + (data[i].post == 1 ? 'Y' : 'N' ) + "</td>" +
                                    "<td>" + data[i].address.zone + '-' + data[i].address.detail + "</td>" +
                                    "<td>" + data[i].createTime + "</td>"

                                switch (data[i].status) {
                                    case 0:
                                        str += "<td> submitted </td>";
                                        break;
                                    case -1:
                                        str += "<td> withdrawn</td>";
                                        break;
                                    case -2:
                                        str += "<td> refund </td>";
                                        break;
                                }

                                str += "</tr>";

                                $("#orders").append(str);
                            }
                        }
                    }
                } else if(flag == 0){
                    alert("error");
                }
            })
        })
    }
</script>
</html>
