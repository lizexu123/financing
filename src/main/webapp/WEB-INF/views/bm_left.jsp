
<%--
  Created by IntelliJ IDEA.
  User: Penny
  Date: 2018/5/31
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!--left side starts-->
<div class="left-side" style="overflow: hidden;">
    <div class="logo">
        <h1><a href="${ctp}/admin">Financing <span>Admin</span></a></h1>
    </div>
    <div class="left-side-inner">
        <ul class="left-side-inner-nav">
            <li class="menu-list"><a href="javascript:void(0);" onclick="submenu(this)"><span>User</span></a>
                <ul class="sub-menu-list">
                    <li><a href="${ctp}/admin/userProfile">User Profile</a> </li>
                    <li><a href="${ctp}/admin/userBlack">Black List</a></li>
                </ul>
            </li>
            <li class="menu-list"><a href="javascript:void(0);" onclick="submenu(this)"><span>Project</span></a>
                <ul class="sub-menu-list">
                    <li><a href="${ctp}/admin/category">Category Manage</a> </li>
                    <li><a href="${ctp}/admin/projectProfile">Project Profile</a> </li>
                </ul>
            </li>
            <li><a href="${ctp}/admin/order"><span>Order</span></a></li>
            <li class="menu-list"><a href="javascript:void(0);"><span>Data Analysis</span></a>
                <ul class="sub-menu-list">
                    <li><a href="">Sign In</a> </li>
                    <li><a href="">Sign Up</a></li>
                    <li><a href="">Blank Page</a></li>
                </ul>
            </li>
        </ul>
        <!--sidebar nav end-->
    </div>
</div>
<!-- left side end-->