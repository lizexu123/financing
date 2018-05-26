<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/5/24
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>个人中心</title>
</head>
<link href="${cp}/css/bstp.css" rel="stylesheet">
<link href="${cp}/css/style.css" rel="stylesheet">
<script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="${cp}/js/layer.js" type="text/javascript"></script>
<body>
<div class="container-fluid">
    <h1 class="title center">修改个人信息</h1>
    <br/>
    <form id="formInfo" action="/doModifyUserInfo" method="post" enctype="multipart/form-data">
        <div class="col-sm-offset-2 col-md-offest-2">
            <!-- 表单输入 -->
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 col-md-2 control-label">上传头像</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="file" name="avatarUpload" id="pic"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 col-md-2 control-label">手机号</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" value="${sessionScope.user.mobile}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputUserName" class="col-sm-2 col-md-2 control-label">用户名</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="inputUserName" placeholder="请输入用户名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 col-md-2 control-label">密码</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="password" class="form-control" id="inputPassword"
                               value=""${sessionScope.user.password}" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 col-md-2 control-label">邮箱</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="email" class="form-control" id="inputEmail" placeholder="xxxxxx@xx.com">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputId" class="col-sm-2 col-md-2 control-label">身份证</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="email" class="form-control" id="inputId" placeholder="身份证">
                    </div>
                </div>

                <div class="form-group">
                    <label for="man" class="col-sm-2 col-md-2 control-label">性别</label>
                    <div class="col-sm-6 col-md-6">
                        <label class="radio-inline">
                            <input type="radio" name="sex" id="man" value="option1"> male
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="woman" name="sex" value="option2"> female
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="InputAddress" class="col-sm-2 col-md-2 control-label">地址</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="inputAddress"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputInformation" class="col-sm-2 col-md-2 control-label">个人简介</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="inputInformation"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-6">
                        <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="modify()">确认修改</button>
                    </div>
                </div>
            </div>
            <br/>
        </div>
    </form>
</div>
<!--尾部-->

<script type="text/javascript">
    function modify() {
        var user = {};
        user.userName = document.getElementById("inputUserName").value;
        user.email = document.getElementById("inputEmail").value;
        user.password = document.getElementById("inputPassword").value;
        user.phoneNumber = document.getElementById("inputPhoneNumber").value;
        user.address = document.getElementById("inputAddress").value;
        user.information = document.getElementById("inputInformation").value;
        user.inputId = document.getElementById("inputId").value;
        user.sex = 0;

        if (document.getElementById("woman").checked)
            user.sex = 1;
        if (user.userName == '') {
            layer.msg('用户名不能为空');
            return false;
        }
        else if (user.nickName.length >= 15) {
            layer.msg('用户名长度不能超过15个字符');
            return false;
        }
        else if (user.password == '') {
            layer.msg('密码不能为空');
            return false;
        }
        else if (user.password.length >= 20) {
            layer.msg('密码长度不能超过20个字符');
            return false;
        }
        else if (user.email == '') {
            layer.msg("邮箱不能为空");
            return false;
        }
        else if (user.information == '') {
            layer.msg("身份证不能为空");
            return false;
        }
        else if (user.information.length != 18) {
            layer.msg("身份证长度只能为18位");
        }
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/doModifyUserInfo",//url
            data: $('#formInfo').serialize(),
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                if (result.flag == 1) {
                    layer.msg("修改成功");
                } else {
                    layer.msg(result.msg);
                }

            }
        });


    }


    <%--function getUserById(id) {--%>
    <%--var userResult = "";--%>
    <%--var user = {};--%>
    <%--user.id = id;--%>
    <%--$.ajax({--%>
    <%--async : false, //设置同步--%>
    <%--type : 'POST',--%>
    <%--url : '${cp}/getUserById',--%>
    <%--data : user,--%>
    <%--dataType : 'json',--%>
    <%--success : function(result) {--%>
    <%--userResult = result.result;--%>
    <%--},--%>
    <%--error : function(result) {--%>
    <%--layer.alert('查询错误');--%>
    <%--}--%>
    <%--});--%>
    <%--userResult = JSON.parse(userResult);--%>
    <%--return userResult;--%>
    <%--}--%>

    <%--function getUserDetailById(id) {--%>
    <%--var userDetailResult = "";--%>
    <%--var user = {};--%>
    <%--user.id = id;--%>
    <%--$.ajax({--%>
    <%--async : false, //设置同步--%>
    <%--type : 'POST',--%>
    <%--url : '${cp}/getUserDetailById',--%>
    <%--data : user,--%>
    <%--dataType : 'json',--%>
    <%--success : function(result) {--%>
    <%--userDetailResult = result.result;--%>
    <%--},--%>
    <%--error : function(result) {--%>
    <%--layer.alert('查询错误');--%>
    <%--}--%>
    <%--});--%>
    <%--userDetailResult = JSON.parse(userDetailResult);--%>
    <%--return userDetailResult;--%>
    // }
</script>

</body>
</html>
