<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
    <style type="text/css ">
        #aad {
            width: 150px;
            height: 38px;
            line-height: 38px;
            font-size: 14px;
            background-color: #ff9e19;
            color: #fff;
            border: none;
            border-radius: 3px;
            transition: all 0.2s;
            outline: none;
            position: relative;
            left: -220px;
            cursor: pointer;
        }
    </style>
</head>

<body class="personal">

<div class="wrap">
    <jsp:include page="person_left.jsp"/>
    <div class="r right_content">
        <div class="common minheight800">
            <form action="/doAddAddress" id="formAddress" enctype="multipart/form-data">
                <div class="user_info fix">
                    <ul class="user_info_ul">
                        <li class="fix">
                            <p class="_title l">user_id</p>
                            <p class="l">
                                <input type="text" name="userId" class="form-control" id="inputUserId"
                                       value="${sessionScope.user.id}" readonly>
                            </p>
                            <div style="clear: both"></div>
                        <li class="fix">
                            <p class="_title l">recipient</p>
                            <p class="l">
                                <input type="text" class="form-control" id="inputRepcipient" name="recipient"
                                       value="${sessionScope.user.realName}" readonly/>
                            </p>
                            <div style="clear: both"></div>
                        </li>
                        <div style="clear: both"></div>
                        <li class="fix">
                            <p class="_title l">zone</p>
                            <p class="l">
                                <input type="text" class="form-control" id="inputZone" name="zone">
                            </p>
                            <div style="clear: both"></div>
                        </li>
                        <li class="fix">
                            <p class="_title l">postcode</p>
                            <p class="l">
                                <input type="text" class="form-control" id="inputPostCode" name="postcode">
                            </p>
                            <div style="clear: both"></div>
                        </li>
                        <li class="fix">
                            <p class="_title l">detail</p>
                            <p class="l">
                                <input type="" id="inputTextarea" cols="30" rows="10" name="detail"
                                       class="form-control">
                            </p>
                            <div style="clear: both"></div>
                        </li>
                        <li class="user_info_img fix">
                            <p class="_title l">phone</p>
                            <div class="l _img">
                                <div class="am-form-group am-form-file">
                                    <input type="text" class="form-control" name="phone" id="inputPhone"
                                           value="${sessionScope.user.mobile}" readonly/>
                                </div>
                            </div>
                            <div style="clear: both"></div>
                        </li>
                    </ul>
                    <div class="tc">
                        <input type="button" class="button" onclick="dizhi()" id="aad" value="Add the address">
                        </input>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    function dizhi() {
        var address = {};
        address.userId = document.getElementById("inputUserId").value;
        address.zone = document.getElementById("inputZone").value;
        address.postcode = document.getElementById("inputPostCode").value;
        address.detail = document.getElementById("inputTextarea").value;
        address.phone = document.getElementById("inputPhone").value;
        var bb = /^[0-9]{6}$/;


        if (address.userId) {

        } else {
            layer.msg('用户Id不能为空');
            return false;
        }

        if (address.detail) {

        } else {
            layer.msg('描述不能为空');
            return false;
        }
        if (address.postcode) {

        } else {
            layer.msg('邮政编码不能为空');
            return false;
        }
        if (!bb.test(address.postcode)) {
            layer.msg('邮政编码只能是6位数字');
            return false;
        }

        if (address.zone) {

        } else {
            layer.msg('地址不能为空');
            return false;
        }
        if (address.phone) {

        } else {
            layer.msg('电话号码不能为空');
            return false;
        }

        console.log(address);
        var formData = new FormData($("#formAddress")[0]);
        console.log(formData);
        $.ajax({
            type: 'POST',
            async: false,
            url: '${ctp}/doAddAddress',
            dataType: 'json',
            contentType: false,
            processData: false,
            data: formData,
            success: (function (result) {
                if (result.flag == 1) {
                    layer.msg("修改成功");
                } else {
                    layer.msg("修改失败");
                }
            })
        })
    }


</script>
</html>