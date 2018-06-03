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
            <h3 style="font-size: 2em;color: #999;margin: 0 0 0.5em 1em;">Welcome<br> Administrator </h3>
            <div style="margin-top: 50px;">
                <div class="col-3">
                    <div class="counter_box">
                        <img src="${ctp}/image/admin/growth.png">
                        <div class="stats">
                            <h5 id="project-total"></h5>
                            <div class="grow">
                                <p>Projects</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div class="counter_box">
                        <img src="${ctp}/image/admin/users.png">
                        <div class="stats">
                            <h5 id="user-total"></h5>
                            <div class="grow" style="background: #00BCD4;">
                                <p>Users</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div class="counter_box">
                        <img src="${ctp}/image/admin/profits.png">
                        <div class="stats">
                            <h5 id="order-total"></h5>
                            <div class="grow" style="background: #FFCA28;">
                                <p>Orders</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"> </div>
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
        $.ajax({
            type:'GET',
            async : true,
            url : '${ctp}/doTotal',
            dataType : 'json',
            data:null,
            success:(function (result) {
                var flag = parseInt(result.flag);
                var data = result.data;
                if(flag==1){
                    $("#project-total").append(data.project);
                    $("#user-total").append(data.user);
                    $("#order-total").append(data.order);
                }else {
                    alert("error");
                }
            })
        })
    })
</script>
</html>
