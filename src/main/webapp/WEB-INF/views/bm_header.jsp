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
<!-- header-starts -->
<div class="header-section">
    <div class="menu-right">
        <div class="user-panel-top">
            <%--<div class="profile_details_left">--%>
                <%--<!--<p>Welcome Administrator! </p>-->--%>
            <%--</div>--%>
            <div class="profile_details">
                <ul>
                    <li class="dropdown profile_details_drop">
                        <a href="javascript:void(0);" onclick="submenu(this)">
                            <div class="profile_img">
                                <span style="background:url('${ctp}/image/admin/1.jpg') no-repeat center"> </span>
                                <div class="user-name">
                                    <p>
                                        ${sessionScope.admin.username}
                                        <span>Administrator</span>
                                    </p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                        <ul class="dropdown-menu">
                            <li> <a href="${ctp}/doAdminLogout">Logout</a> </li>
                        </ul>
                    </li>
                    <div class="clearfix"> </div>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- //header-ends -->

