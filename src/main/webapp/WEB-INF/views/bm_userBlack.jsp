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
            <h3 style="font-size: 2em;color: #999;margin: 0 0 0.5em 1em;">User Black </h3>
            <div class="user-black"  style="margin-top: 30px;">
                <div class="panel-head">
                    <h2>Black List</h2>
                </div>
                <div class="user-table">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>ID</th>
                            <th>MOBILE</th>
                            <th>AVATAR</th>
                            <th>USERNAME</th>
                            <th>EMAIL</th>
                            <th>GENDER</th>
                            <th>ZONE</th>
                            <th>ACTION</th>
                        </tr>
                        </thead>
                        <tbody id="users">
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
            getBlacks();
    });

    function getBlacks() {
        $.ajax({
            type:'GET',
            async : false,
            url : '${ctp}/doGetUserList',
            dataType : 'json',
            data:null,
            success:(function(result){
                var flag = parseInt(result.flag);
                var data = result.data;

                if(flag == 1) {
                    $("#users").empty();
                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            if (data[i].status==-1){
                                var str = "";
                                str+="<tr>"+
                                    "<th scope=\"row\">"+(i+1)+"</th> " +
                                    "<td>"+data[i].id+"</td> " +
                                    "<td>"+data[i].mobile+"</td> " +
                                    "<td><img src=\""+data[i].avatar+"\"></td> " +
                                    "<td>"+data[i].username+"</td> " +
                                    "<td>"+data[i].email+"</td> " +
                                    "<td>"+data[i].gender+"</td> " +
                                    "<td>"+data[i].zone+"</td> "
                                str+="<td class=\"dropdown\">" +
                                    "<a href=\"javascript:void(0);\" onclick=\"submenu(this)\">ACTION</a>" +
                                    "<ul class=\"dropdown-action\">" +
                                    "<li>" +
                                    "<a href=\"javascript:void(0);\" onclick='moveOutBlack("+data[i].id+")'>MOVE OUT</a>"+
                                    "</li>"+
                                    "</ul>"+
                                    "</td>";
                                str+="</tr>";
                                $("#users").append(str);
                            }
                        }
                    }
                } else if(flag == 0){
                    alert("error");
                }
            })
        })
    }

    function moveOutBlack(id) {
        $.ajax({
            type:'GET',
            async : false,
            url : '${ctp}/doUserOutBlack-'+id,
            dataType : 'json',
            data:null,
            success:(function(result) {
                var flag = parseInt(result.flag);
                var msg = result.msg;
                if(flag==1){
                    alert(msg);
                }else {
                    alert(msg);
                }
            })
        });

        getBlacks();
    }
</script>
</html>
