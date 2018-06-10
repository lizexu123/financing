<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
    <%--<script src="${ctp}/js/user.js" type="text/javascript"></script>--%>
    <title>- 个人中心 -</title>
    <style>
        #save, #csave {
            position: relative;
            left: -250px;
        }
    </style>
</head>

<body class="personal">

<div class="wrap">
    <jsp:include page="person_left.jsp"/>
    <div class="r right_content">
        <div class="common minheight800">

            <div class="common_title fix">
                <span class="l">Personal Information</span>
                <a href="#" class="complete r"></a>
                </div>
            <div class="tab-menu">
                <ul>
                    <li><a class="tab-selected" href="#">Modify Person Information</a></li>
                    <li><a href="#">Certificate</a></li>
                </ul>
                </div>
            <div class="tab-box">
                <div class="user_info fix">
                    <form id="formInfo" action="/doModifyUserInfo" method="post"
                          enctype="multipart/form-data">
                        <ul class="user_info_ul">
                            <li class="user_info_img fix">
                                <p class="_title l">avatar</p>
                                <div class="l _img">
                                    <img src="${sessionScope.user.avatar}" alt="">
                                    <div class="am-form-group am-form-file">
                                        <input type="file" name="avatarUpload" id="pic"/>
                                    </div>
                                </div>
                                <div style="clear: both"></div>
                            </li>
                            <li class="fix">
                                <p class="_title l">username</p>
                                <p class="l">
                                    <input type="text" name="username" id="inputUserName"
                                           value="${sessionScope.user.username}" class="info_text">
                                </p>
                                <div style="clear: both"></div>
                            </li>
                            <li class="fix">
                                <p class="_title l">mobile</p>
                                <p class="l">
                                    <span>${sessionScope.user.mobile}</span>
                                </p>
                                <p>
                                    <span class="has_check">已验证</span>
                                </p>
                                <div style="clear: both"></div>
                            </li>
                            <li class="fix">
                                <p class="_title l">email</p>
                                <p class="l">
                                    <input type="email" class="info_text" id="inputEmail" name="email"
                                           placeholder="xxxxxx@xx.com" value="${sessionScope.user.email}">
                                </p>
                                <div style="clear: both"></div>
                            </li>
                            <li class="fix">
                                <p class="_title l">gender</p>
                                <p class="l">
                                    <label>
                                        <input type="radio" name="gender" value="female"> Female
                                    </label>
                                    <label>
                                        <input type="radio" name="gender" value="male"> Male
                                    </label>
                                    <label>
                                        <input type="radio" name="gender" value="secrecy"> Secrecy
                                    </label>
                                </p>
                                <div style="clear: both"></div>
                            </li>
                            <li class="fix">
                                <p class="_title l">zone</p>
                                <p class="l">
                                    <input type="text" class="info_text" value="${sessionScope.user.zone}"
                                           id="inputAddress"
                                           name="zone"/>
                                </p>
                                <div style="clear: both"></div>
                            </li>

                            <li class="fix">
                                <p class="_title l">intro</p>
                                <p class="l">
                                    <textarea class="info_text" name="intro" value="${sessionScope.user.intro}"
                                              id="inputInformation"></textarea>
                                </p>
                                <div style="clear: both"></div>
                            </li>
                        </ul>
                        <div class="tc">
                            <button type="button" id="save" class="button" onclick="modify()">SAVE</button>
                        </div>
                    </form>
                    </div>
                <div class="user_info fix tab-hide">
                    <form id="formCert" action="/doCertificate" method="post"
                          enctype="multipart/form-data">
                        <ul class="user_info_ul">
                            <li class="fix">
                                <p class="_title l">ic</p>
                                <p class="l">
                                    <input type="text" class="info_text" id="inputId" name="ic"
                                           value="${sessionScope.user.ic}">
                                </p>
                                <div style="clear: both"></div>
                            </li>
                            <li class="fix">
                                <p class="_title l">realName</p>
                                <p class="l">
                                    <input type="text" class="info_text" id="inputRealName" name="realName"
                                           placeholder="真实姓名" value="${sessionScope.user.realName}">
                                </p>
                                <div style="clear: both"></div>
                            </li>
                        </ul>
                        <div class="tc">
                            <button type="button" id="csave" class="button" onclick="certificate()">SAVE</button>
                        </div>
                    </form>

                </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    $(function () {

        var li_a = $(".tab-menu ul li a");
        li_a.click(function () {
            $(this).addClass("tab-selected");
            $(this).parent().siblings().children().removeClass("tab-selected");
            var index = li_a.index(this);
            $(".tab-box > div").eq(index).show().siblings().hide();
        });
    })

    function modify() {
        var user = {};
        user.userName = document.getElementById("inputUserName").value;
        user.email = document.getElementById("inputEmail").value;
        user.zone = document.getElementById("inputAddress").value;
        user.intro = document.getElementById("inputInformation").value;
        var aa = /^[a-zA-Z0-9]{6,12}$/;
        var bb = /^[a-z0-9]{18}$/;
        if (user.userName) {

        } else {
            layer.msg('用户名不能为空');
            return false;
        }
        if (user.userName.length >= 15) {
            layer.msg('用户名要小于等于15位');
            return false;
        }
        if (user.email) {

        } else {
            layer.msg('邮箱不能为空');
            return false;
        }
        if (user.intro) {

        } else {
            layer.msg('个人简介不能为空');
            return false;
        }
        if (user.zone) {

        } else {
            layer.msg('地址不能为空');
            return false;
        }


        var formData = new FormData($("#formInfo")[0]);
        $.ajax({
            type: 'POST',
            async: false,
            url: '${ctp}/doModifyUserInfo',
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

    function certificate() {
        var realName = document.getElementById("inputRealName").value;
        var ic = document.getElementById("inputId").value;
        var bb = /^[a-z0-9]{18}$/;
        if (ic) {

        } else {
            layer.msg('身份证不能为空');
            return false;
        }
        if (!bb.test(ic)) {
            layer.msg('身份证只能是18位');
            return false;
        }
        if (realName) {

        } else {
            layer.msg('真实姓名不能为空');
            return false;
        }
        console.log(realName);

        $.ajax({//调用ajax后台数据异步方法
            //提交的方式
            type: "Post",
            async: false,
            //数据的传送页面：要启动界面的地址/界面的后台的方法
            url: "${ctp}/doCertificate",
            // contentType:false,
            data: {
                "realName": realName,
                "ic": ic,
            },
            //传到服务器的参数类型
            dataType: "json",
            //重要的后台的回调函数（很重要）
            success: function (result) {
                if (result.flag == 1) {
                    layer.msg("验证成功");
                } else {
                    layer.msg("验证失败");
                }
            },
        });
    }




</script>
</html>