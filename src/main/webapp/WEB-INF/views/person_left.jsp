<%--
  Created by IntelliJ IDEA.
  User: 26942
  Date: 2018/6/7
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<div class="left_nav l">
    <ul class="ul_left_nav">
        <li class="active">
            <a href="${ctp}/personCenter">
                <i class="left_nav_icon dib">
                    <img class="icon_img" src="${ctp}/image/personal_icon04.png" alt="">
                </i>
                <span class="left_nav_name dib">Person Center</span>
            </a>
        </li>
        <li>
            <a href="${ctp}/personCenter/personInfo">
                <i class="left_nav_icon dib">
                    <img class="icon_img" src="${ctp}/image/personal_icon09.png" alt="">
                </i>
                <span class="left_nav_name dib">Person Info</span>
            </a>
        </li>
        <li>
            <a href="${ctp}/personCenter/projectCreate">
                <i class="left_nav_icon dib">
                    <img class="icon_img" src="${ctp}/image/personal_icon08.png" alt="">
                </i>
                <span class="left_nav_name dib">Project Publish</span>
            </a>
        </li>
        <li>
            <a href="${ctp}/personCenter/personProject">
                <i class="left_nav_icon dib">
                    <img class="icon_img" src="${ctp}/image/personal_icon07.png" alt="">
                </i>
                <span class="left_nav_name dib">My Project</span>
            </a>
        </li>
        <li>
            <a href="${ctp}/personCenter/personOrder">
                <i class="left_nav_icon dib">
                    <img class="icon_img" src="${ctp}/image/personal_icon02.png" alt="">
                </i>
                <span class="left_nav_name dib">My Order</span>
            </a>
        </li>
        <li>
            <a href="${ctp}/personCenter/personAddress">
                <i class="left_nav_icon dib">
                    <img class="icon_img" src="${ctp}/image/personal_icon06.png" alt="">
                </i>
                <span class="left_nav_name dib">My Address</span>
            </a>
        </li>
        <li>
            <a href="${ctp}/personCenter/personComment">
                <i class="left_nav_icon dib">
                    <img class="icon_img" src="${ctp}/image/personal_icon01.png" alt="">
                </i>
                <span class="left_nav_name dib">My Comment</span>
            </a>
        </li>
        <li>
            <a href="${ctp}/personCenter/personEditor">
                <i class="left_nav_icon dib">
                    <img class="icon_img" src="${ctp}/image/personal_icon01.png" alt="">
                </i>
                <span class="left_nav_name dib">projectEditor</span>
            </a>
        </li>
    </ul>
</div>
