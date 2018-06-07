<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="css/pc.css">
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
    <link href="${ctp}/css/style.css" rel="stylesheet">

</head>
<body>
<div class="wrap">
    <jsp:include page="person_left.jsp"/>
    <ul class="ul_left_nav">
        <li class="active">
            <a href="personCenter">
                <i class="left_nav_icon dib">
                    <img class="icon_img" src="image/personal_icon04.png" alt="">
                </i>
                <span class="left_nav_name dib">Person Center</span>
            </a>
        </li>
        <li>
            <a href="personInfo">
                <i class="left_nav_icon dib">
                    <img class="icon_img" src="image/personal_icon09.png" alt="">
                </i>
                <span class="left_nav_name dib">Person Info</span>
            </a>
        </li>
        <li>
            <a href="personCenter/projectCreate">
                <i class="left_nav_icon dib">
                    <img class="icon_img" src="image/personal_icon08.png" alt="">
                </i>
                <span class="left_nav_name dib">Project Publish</span>
            </a>
        </li>
        <li>
            <a href="personCenter/personProject">
                <i class="left_nav_icon dib">
                    <img class="icon_img" src="image/personal_icon07.png" alt="">
                </i>
                <span class="left_nav_name dib">My Project</span>
            </a>
        </li>
        <li>
            <a href="person_order">
                <i class="left_nav_icon dib">
                    <img class="icon_img" src="image/personal_icon02.png" alt="">
                </i>
                <span class="left_nav_name dib">My Order</span>
            </a>
        </li>
        <li>
            <a href="person_address.html">
                <i class="left_nav_icon dib">
                    <img class="icon_img" src="image/personal_icon06.png" alt="">
                </i>
                <span class="left_nav_name dib">My Address</span>
            </a>
        </li>
        <li>
            <a href="person_comment.html">
                <i class="left_nav_icon dib">
                    <img class="icon_img" src="image/personal_icon01.png" alt="">
                </i>
                <span class="left_nav_name dib">My Comment</span>
            </a>
        </li>
    </ul>
    </div>

</div>
</body>
</html>