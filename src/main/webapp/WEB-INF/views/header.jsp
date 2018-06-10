<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Header(导航栏，统一头部)</title>
    <link rel="stylesheet" href="${ctp}/css/header.css" type="text/css"/>
    <link rel="stylesheet" href="${ctp}/css/icon.css" type="text/css"/>
    <script type="text/javascript" src="${ctp}/js/memenu.js"></script>
    <script type="text/javascript" src="${ctp}/js/responsiveslides.min.js"></script>
</head>
<body>
<div id="Head">
    <div class="logo">
        <h1><a href="${ctp}/index">Fun<span>d</span>ing</a></h1>
    </div>
    <div class="top-nav">
        <ul class="memenu skyblue">
            <li id="Home" class="active"><a href="${ctp}/index">Home</a></li>
            <li id="Hot" class="grid"><a href="${ctp}/browse/hot">Hot</a></li>
            <li id="New" class="grid"><a href="${ctp}/browse/new">New</a></li>
            <li id="All" class="grid"><a href="${ctp}/browse/all">All</a>
                <div class="mepanel">
                    <div class="row">
                        <div class="col1 me-one">
                            <h4>Type</h4>
                            <ul>
                                <li><a href="${ctp}/browse/sort-1">Agriculture</a></li>
                                <li><a href="${ctp}/browse/sort-2">Publish</a></li>
                                <li><a href="${ctp}/browse/sort-3">Entertainment</a></li>
                                <li><a href="${ctp}/browse/sort-4">Technology</a></li>
                                <li><a href="${ctp}/browse/sort-5">Public Welfare</a></li>
                                <li><a href="${ctp}/browse/sort-6">Other</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <div class="search-bar">
        <input onfocus="this.value = '';"
               placeholder="Search"
               type="text" id="searchByKeyWord">
        <a href="javascript:;" id="searchImg"></a>
    </div>
    <c:choose>
        <c:when test="${empty sessionScope.user}">
            <%--未登录，提示登录按钮--%>
            <div id="defaultShow">
                <button id="promptLogin" type="submit" onclick="window.location.href='login'"
                        onmouseover="this.style.cursor='pointer'">
                    <a href='javascript:;'>Login/Register</a>
                </button>
            </div>
        </c:when>
        <c:otherwise>
            <%--<c:if test="${sessionScope.user.role == 1}">--%>
                <div class="self-Page">
                    <ul class="memenu skyblue">
                        <li>
                                <%--已登录，存放头像与id--%>
                            <div id="self_image">
                                <c:if test="${not empty sessionScope.user.avatar}">
                                    <%--成功获取头像数据并加载--%>
                                    <img id="showSelfImage" src="${sessionScope.user.avatar}"/>
                                </c:if>
                                <c:if test="${empty sessionScope.user.avatar}">
                                    <%--未得头像数据默认返回--%>
                                    <a href="${ctp}/image/bnr2.jpg">${sessionScope.user.id}</a>
                                </c:if>
                            </div>
                            <div class="mepanel">
                                <div class="row">
                                    <div class="col1 me-one">
                                        <ul>
                                            <li><a href="${ctp}/personCenter"><span class="icon_profile"></span>My
                                                Profile</a></li>
                                            <li><a href="${ctp}/personCenter/personProject"><span
                                                    class="icon_clipboard"></span>My
                                                Project</a>
                                            </li>
                                            <li><a href="${ctp}/doLogout"><span class="icon_key"></span>Log Out</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            <%--</c:if>--%>
        </c:otherwise>
    </c:choose>
</div>
<script type="text/javascript">
    /*
    * 部分1：头部
    * */
    //加载头部Header
    $(document).ready(
        function () {
            $(".memenu").memenu();
            //搜索框实现，并删除字符串开始和末尾的空格
            $('#searchImg').click(function () {
                    var $input = $('#searchByKeyWord');
                window.location.href = '${ctp}/browse/search-' + $.trim($input.val());
                }
            );
            window.onload = function changeBarFocus() {
                var url = window.location.pathname;
                $('.top-nav>ul>li').removeClass("active").addClass("grid");
                if (url.indexOf('hot') > 0) {
                    $('#Hot').addClass("active");
                } else if (url.indexOf('new') > 0) {
                    $('#New').addClass("active");
                } else if (url.indexOf('index') > 0) {
                    $('#Home').addClass("active");
                } else {
                    $('#All').addClass("active");
                }
            };
        }
    );
</script>
<script type="text/javascript">

</script>
</body>
</html>
