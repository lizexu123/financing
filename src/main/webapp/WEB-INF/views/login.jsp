<%--
  Created by IntelliJ IDEA.
  User: Penny
  Date: 2018/5/14
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8">
    <title>Welcome</title>
    <link rel="stylesheet" href="${ctp}/css/Login&Register.css"/>
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="${ctp}/js/loadClickChange.js"></script>
    <script type="text/javascript" src="${ctp}/js/layer.js"></script>
</head>
<body class="loaded">
<div id="particles-js"></div>
<ul class="cb-slideshow">
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
</ul>

<div id="LoginPart">
    <div class="container-fluid">
        <div class="row cb-slideshow-text-container ">
            <div class="tm-content col-xl-6 col-sm-8 col-xs-8 ml-auto section">
                <header class="mb-5"><h1>Quick Login</h1></header>
                <br/>
                <P class="mb-5">If you do not have an account, please
                    <a id="Register" rel="nofollow" target="_parent" href='#'>register</a>
                    immediately. Thank you for visiting our site!</P>
                <br>
                <form action="${ctp}/doLogin" method="post" class="subscribe-form" id="f2">
                    <div class="row form-section">
                        <div class="col-md-7 col-sm-7 col-xs-7">
                            <input name="mobile" type="text" class="form-control" id="username"
                                   placeholder="PhoneNumber" required/>
                            <br><br>
                            <input name="password" type="password" class="form-control" id="password"
                                   placeholder="Password" required/>
                            <br><br>
                        </div>
                        <br>
                        <div class="col-md-5 col-sm-5 col-xs-5">
                            <button type="button" class="tm-btn-subscribe" onclick="kf()">Login</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="RegisterPart">
    <div class="container-fluid">
        <div class="row cb-slideshow-text-container ">
            <div class="tm-content col-xl-6 col-sm-8 col-xs-8 ml-auto section">
                <header class="mb-5"><h1>Simple Sign Up</h1></header>
                <br/>
                <P class="mb-5">If you already have an account, please
                    <a id="Login" rel="nofollow" href='javascript:back();' target="_parent">click and log in </a>
                    immediately. Thank you for visiting our site!</P>
                <br>
                <form action="/doRegister" method="post" class="subscribe-form" id="f1">
                    <div class="row form-section">
                        <div class="col-md-7 col-sm-7 col-xs-7">

                            <input id="phone" name="mobile" type="tel" placeholder="telephone"
                                   required pattern="[0-9]{11}$" class="form-control"/>
                            <br><br>
                            <input name="password" type="password" class="form-control" id="newpassword"
                                   placeholder="Password" pattern="^[a-zA-Z0-9]{6,12}$" required/>
                            <br><br>
                            <input name="ispassword" type="password" class="form-control" id="ispassword"
                                   placeholder="ispassword"/>
                            <br><br>

                            <input type="text" id="input1" class="form-control" placeholder="validate"/>
                            <p id="at"></p>
                            <br><br>
                            <input type="button" id="checkCode" class="form-control" style="width:100px"
                                   onClick="createCode()"/>
                            <a href="#" onClick="createCode()">看不清楚</a>
                        </div>
                        <br>
                        <div class="col-md-5 col-sm-5 col-xs-5">
                            <button type="button" class="tm-btn-subscribe" onclick="cf()">Sign Up</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script type="text/javascript" src="${ctp}/js/Login&Register.js"></script>
</body>
</html>
