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
            <h3 style="font-size: 2em;color: #292929;margin: 0 0 0.5em 1em;">User Profile </h3>
            <div class="user-profile"  style="margin-top: 30px;">
                <div style="height: 60px">
                    <div class="user-add">
                        <a href="javascript:void(0)" onclick="addUserBox()"><img src="${ctp}/image/admin/add.png"></a>
                    </div>
                    <div class="user-add-form">
                        <h3 style="font-size: 1.5em;color: #999;margin: 0 auto; text-align: center">Add User</h3>
                        <form id="addUserForm">
                            <input name="mobile" type="text" class="user" value="mobile" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'mobile:';}"/>
                            <input name="password" type="password" class="lock" value="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password:';}"/>
                            <input id="addUserBtn" type="button" value="add new user">
                        </form>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="panel-head">
                    <h2>User List</h2>
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
                            <th>BALANCE</th>
                            <th class="dropdown">
                                <a href="javascript:void(0);" onclick="submenu(this)">STATUS</a>
                                <ul class="dropdown-action" style="left: 0">
                                    <li> <a href="javascript:void(0);" onclick="getUsers()">ALL</a> </li>
                                    <li> <a href="javascript:void(0);" onclick="getUsersByStatus(1)">VERIFY</a> </li>
                                    <li> <a href="javascript:void(0);" onclick="getUsersByStatus(0)">NOT VERIFY</a> </li>
                                </ul>
                            </th>
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
        getUsers();

        $("#addUserBtn").click(function () {
            $.ajax({
                type:'POST',
                async : false,
                url : '${ctp}/doAddUser',
                dataType : 'json',
                data:$("#addUserForm").serialize(),
                success:(function(result) {
                    var flag = parseInt(result.flag);
                    var msg = result.msg;
                    if(flag==1){
                        alert(msg);
                    }else {
                        alert(msg);
                    }
                })
            })

            getUsers();
        })
    });
    function getUsers() {
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
                                    continue;
                                }
                                var str = "";
                                str+="<tr>"+
                                    "<th scope=\"row\">"+(i+1)+"</th> " +
                                    "<td>"+data[i].id+"</td> " +
                                    "<td>"+data[i].mobile+"</td> " +
                                    "<td><img src=\""+data[i].avatar+"\"></td> " +
                                    "<td>"+data[i].username+"</td> " +
                                    "<td>"+data[i].email+"</td> " +
                                    "<td>"+data[i].gender+"</td> " +
                                    "<td>"+data[i].zone+"</td> " +
                                    "<td>"+data[i].balance+"</td> "
                                if (data[i].status == 0) {
                                    str+="<td>not verify</td>";
                                }else if(data[i].status == 1){
                                    str+="<td>verify</td>";
                                }
                                str+="<td class=\"dropdown\">" +
                                    "<a href=\"javascript:void(0);\" onclick=\"submenu(this)\">ACTION</a>" +
                                    "<ul class=\"dropdown-action\">" +
                                    "<li>" +
                                    "<a href=\"javascript:void(0);\" onclick='moveBlack("+data[i].id+")'>MOVE TO BLACK</a>"+
                                    "</li>"+
                                    "</ul>"+
                                    "</td>";
                                str+="</tr>";
                                $("#users").append(str);
                        }
                    }
                } else if(flag == 0){
                    alert("error");
                }
            })
        })
    }
    function moveBlack(id) {
        $.ajax({
            type:'GET',
            async : false,
            url : '${ctp}/doUserBlack-'+id,
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
        getUsers();
    }
    function getUsersByStatus(status) {
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
                            if (data[i].status==status){
                                var str = "";
                                str+="<tr>"+
                                    "<th scope=\"row\">"+(i+1)+"</th> " +
                                    "<td>"+data[i].id+"</td> " +
                                    "<td>"+data[i].mobile+"</td> " +
                                    "<td><img src=\""+data[i].avatar+"\"></td> " +
                                    "<td>"+data[i].username+"</td> " +
                                    "<td>"+data[i].email+"</td> " +
                                    "<td>"+data[i].gender+"</td> " +
                                    "<td>"+data[i].zone+"</td> " +
                                    "<td>"+data[i].balance+"</td> "
                                if (data[i].status == 0) {
                                    str+="<td>not verify</td>";
                                }else if(data[i].status == 1){
                                    str+="<td>verify</td>";
                                }
                                str+="<td class=\"dropdown\">" +
                                    "<a href=\"javascript:void(0);\" onclick=\"submenu(this)\">ACTION</a>" +
                                    "<ul class=\"dropdown-action\">" +
                                    "<li>" +
                                    "<a href=\"javascript:void(0);\" onclick='moveBlack("+data[i].id+")'>MOVE TO BLACK</a>"+
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
</script>
</html>
