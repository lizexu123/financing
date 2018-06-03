<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link href="${ctp}/css/style.css" rel="stylesheet">
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
    <script src="${cp}/js/personAddress.js" type="text/javascript"></script>
</head>
<body>
<div class="container-fluid">
    <h1 class="title center">添加收货地址</h1>
    <br/>
    <form id="formAddress" action="/doAddAddress" method="post"
          enctype="multipart/form-data">
        <div class="col-sm-offset-2 col-md-offest-2">
            <!-- 表单输入 -->
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="inputAddressId" class="col-sm-2 col-md-2 control-label">收货地址id</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" name="id" id="inputAddressId" class="form-control" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputUserId" class="col-sm-2 col-md-2 control-label">用户名id</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" name="userId" class="form-control" id="inputUserId"
                              value="${sessionScope.user.id}"  readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputRepcipient" class="col-sm-2 col-md-2 control-label">repcipient</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="inputRepcipient" name="recipient"
                               value="${sessionScope.user.realName}" readonly />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputZone" class="col-sm-2 col-md-2 control-label">地址</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="inputZone" name="zone">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPostCode" class="col-sm-2 col-md-2 control-label">postcode</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="inputPostCode" name="postcode">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputTextarea" class="col-sm-2 col-md-2 control-label">detail</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="" id="inputTextarea" cols="30" rows="10" name="detail"
                               class="form-control"></textarea>"
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPhone" class="col-sm-2 col-md-2 control-label">电话号码</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" name="phone" id="inputPhone"
                        value="${sessionScope.user.mobile}" readonly />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-6">
                        <button class="btn btn-lg btn-primary btn-block" type="button" onclick="dizhi()">添加地址</button>
                    </div>
                </div>
            </div>
            <br/>
        </div>
    </form>


</div>
</body>
</html>