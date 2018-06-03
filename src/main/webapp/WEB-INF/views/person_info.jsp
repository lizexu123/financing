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
<link href="${ctp}/css/bstp.css" rel="stylesheet">
<link href="${ctp}/css/style.css" rel="stylesheet">
<script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="${ctp}/js/layer.js" type="text/javascript"></script>
<script src="${cp}/js/user.js" type="text/javascript"></script>

<body>
<div class="container-fluid">
    <h1 class="title center">修改个人信息</h1>
    <br/>
    <form id="formInfo" action="/doModifyUserInfo" method="post"
          enctype="multipart/form-data">
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
                        <input type="text" name="mobile" id="inputPhoneNumber" class="form-control"
                               value="${sessionScope.user.mobile}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputUserName" class="col-sm-2 col-md-2 control-label">用户名</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" name="username" class="form-control" id="inputUserName" placeholder="请输入用户名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 col-md-2 control-label">密码</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="password" class="form-control" id="inputPassword" name="password"
                               value=""${sessionScope.user.password}" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 col-md-2 control-label">邮箱</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="email" class="form-control" id="inputEmail" name="email"
                               placeholder="xxxxxx@xx.com">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputId" class="col-sm-2 col-md-2 control-label">身份证</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="inputId" name="ic"
                               placeholder="身份证">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputId" class="col-sm-2 col-md-2 control-label">真实姓名</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="inputRealName" name="realName"
                               placeholder="真实姓名" onblur="JudgeUserName()">
                    </div>
                </div>

                <div class="form-group">
                    <label for="man" class="col-sm-2 col-md-2 control-label">性别</label>
                    <div class="col-sm-6 col-md-6">
                        <label class="radio-inline">
                            <input type="radio" id="man" value="option1" name="gender"> male
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="woman" value="option2" name="gender"> female
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="InputAddress" class="col-sm-2 col-md-2 control-label">地址</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="inputAddress" name="zone"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputInformation" class="col-sm-2 col-md-2 control-label">个人简介</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" name="intro" id="inputInformation"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-6">
                        <button class="btn btn-lg btn-primary btn-block" type="button" onclick="modify()">确认修改</button>
                    </div>
                </div>
            </div>
            <br/>
        </div>
    </form>


</div>
<!--尾部-->

</body>
</html>
