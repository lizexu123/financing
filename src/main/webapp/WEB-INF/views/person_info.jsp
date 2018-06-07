<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
    <script src="${ctp}/js/user.js" type="text/javascript"></script>
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
                                           placeholder="真实姓名" value="${sessionScope.user.realName}"
                                           onblur="JudgeUserName()">
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
</script>
</html>