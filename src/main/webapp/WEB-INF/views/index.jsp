<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8"/>
    <title>Funding</title>
    <link rel="stylesheet" href="${ctp}/css/main.css" type="text/css"/>
    <link rel="stylesheet" href="${ctp}/css/model.css" type="text/css"/>
    <link rel="stylesheet" href="${ctp}/css/jquery.slideBox.css" type="text/css"/>
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="${ctp}/js/responsiveslides.min.js"></script>
    <script type="text/javascript">
        //背景切换图
        $(function () {
            $("#slider").responsiveSlides({
                auto: true,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                pager: false,
            });
        });
        //AboutProject输出关于本网站总体的数据
        $(window).load(
            function showAboutObject() {
                $.get('doProjectCount', function (result) {
                    document.getElementById("pjPosted").innerHTML = result.data;
                });
                $.get('doSupportCount', function (result) {
                    document.getElementById("backers").innerHTML = result.data;
                });
                $.get('doProjectFinished', function (result) {
                    document.getElementById("pjCompleted").innerHTML = result.data;
                });
            }
        );
        $(document).ready(function () {
            $('ul.nav > li').click(function () {
                $('ul.nav > li').removeClass('active');
                $(this).addClass('active');
            });
        });
        $(document).ready(function () {
            $('ul.top > li').click(function () {
                $('ul.top > li').removeClass('currentLi');
                $(this).addClass('currentLi');
            });
        });
    </script>
    <script type="text/javascript">
        $('#showNP').onloadstart(
            showTopFiveOfNH('doNewProjectTop')
        );
        // 展示前五条最热最新记录
        function showTopFiveOfNH(url) {
            $.ajax({
                type: 'GET',
                url: url,
                dataType: "json",
                success: function (data) {
                    if (updateSearchResults) {
                        updateSearchResults(data);
                    }
                }
            });
        }
    </script>
    <script type="text/javascript" src="${ctp}/js/responsiveslides.min.js"></script>
    <script type="text/javascript">
        //背景切换图
        $(function () {
            $("#slider").responsiveSlides({
                auto: true,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                pager: false,
            });
        });
        //AboutProject输出关于本网站总体的数据
        $(window).load(
            function showAboutObject() {
                $.get('doProjectCount', function (result) {
                    document.getElementById("pjPosted").innerHTML = result.data;
                });
                $.get('doSupportCount', function (result) {
                    document.getElementById("backers").innerHTML = result.data;
                });
                $.get('doProjectFinished', function (result) {
                    document.getElementById("pjCompleted").innerHTML = result.data;
                });
            }
        );
        $(document).ready(function () {
            $('ul.nav > li').click(function () {
                $('ul.nav > li').removeClass('active');
                $(this).addClass('active');
            });
        });
        $(document).ready(function () {
            $('ul.top > li').click(function () {
                $('ul.top > li').removeClass('currentLi');
                $(this).addClass('currentLi');
            });
        });
    </script>
    <script type="text/javascript">
        $('#showNP').onloadstart(
            showTopFiveOfNH('doNewProjectTop')
        );

        // 展示前五条最热最新记录
        function showTopFiveOfNH(url) {
            $.ajax({
                type: 'GET',
                url: url,
                dataType: "json",
                success: function (data) {
                    if (updateSearchResults) {
                        updateSearchResults(data);
                    }
                }
            });
        }
    </script>
</head>
<body>
<jsp:include page="header.jsp"/>
<!--背景大图轮播-->
<div class="slider">
    <div class="callbacks_container">
        <ul class="rslides" id="slider">
            <li>
                <div class="banner1">
                    <div class="banner-info">
                        <h3>Investment</h3>
                        <p>Investment in fixed assets is an important vehicle for ensuring that the latest technology is
                            available to business.</p>
                        <%--固定资产投资是确保企业获得最新技术的重要手段--%>
                    </div>
                </div>
            </li>
            <li>
                <div class="banner2">
                    <div class="banner-info">
                        <h3>Achieve the goal</h3>
                        <p> One option is to tap existing limited partners for co-investments. </p>
                        <%--寻求现有有限合伙人共同投资是一个选择--%>
                    </div>
                </div>
            </li>
            <li>
                <div class="banner3">
                    <div class="banner-info">
                        <h3>Gain wealth</h3>
                        <p>Wise investing is the surest path to financial independence and its something everyone can
                            work on.</p>
                        <%--明智的投资是经济独立最可靠的道路，而且每个人都可以做到。--%>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>
<%--第一个固定的背景大图--%>
<div class="firstBackground">
    <%--三个显示数据--%>
    <div class="aboutProject" id="about">
        <div class="showMember" id="pricing">
            <div class="Center">
                <span class="AboutObject">Total Number of</span>
                <div class="members">
                    <ul>
                        <li>
                            <div class="numOMember">
                                <h5>First</h5>
                            </div>
                            <div class="nameOMember">
                                <h2>Projects Posted</h2>
                            </div>
                            <div class="amountOMember">
                                <h2 id="pjPosted"></h2>
                            </div>
                            <div class="bigNumOMember">
                                <h5>First</h5>
                            </div>
                        </li>
                    </ul>
                    <ul>
                        <li>
                            <div class="numOMember">
                                <h5>Second</h5>
                            </div>
                            <div class="nameOMember">
                                <h2>Backers</h2>
                            </div>
                            <div class="amountOMember">
                                <h2 id="backers"></h2>
                            </div>
                            <div class="bigNumOMember">
                                <h5>Second</h5>
                            </div>
                        </li>
                    </ul>
                    <ul>
                        <li>
                            <div class="numOMember">
                                <h5>Third</h5>
                            </div>
                            <div class="nameOMember">
                                <h2>Projects Completed</h2>
                            </div>
                            <div class="amountOMember">
                                <h2 id="pjCompleted"></h2>
                            </div>
                            <div class="bigNumOMember">
                                <h5>Third</h5>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<%--第二个固定的背景大图--%>
<div class="secondBackground">
    <%--用于展示前五记录--%>
    <div id="aboutNP">
        <div class="typeOfProject">
            <ul class="top">
                <li class="currentLi"><a href="javascript:;" onclick="showTopFiveOfNH('doNewProjectTop')">New &
                    Noteworthy</a></li>
                <li><a href="javascript:;" onclick="showTopFiveOfNH('doHotProjectTop')">Hot</a></li>
            </ul>
        </div>
        <div id="showNP" class="showNP">
            <jsp:include page="model.jsp"/>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
