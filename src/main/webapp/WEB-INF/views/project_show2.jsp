<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>project_show</title>
    <link rel="stylesheet" href="${ctp}/css/project_show.css" type="text/css"/>
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <%--<script type="text/javascript">--%>
    <%--window.onload = function changeBarFocus() {--%>
    <%--var url = window.location.pathname;--%>
    <%--$('.top-nav>ul>li').removeClass("active").addClass("grid");--%>
    <%--if (url.indexOf('hot') > 0) {--%>
    <%--$('#Hot').addClass("active");--%>
    <%--} else {--%>
    <%--$('#New').addClass("active");--%>
    <%--}--%>
    <%--}--%>
    <%--</script>--%>
</head>
<%--用于加载各种搜索结果--%>
<body>
<jsp:include page="header.jsp"/>
<div class="ContainEverything">
    <div class="AllSearchResults">
        <c:choose>
            <c:when test="${empty data}">
                <div class="alert alert-danger alert-dismissable">
                    <button aria-hidden="true" list-dismiss="alert" class="close" type="button"> ×</button>
                    I am sorry I can't Find what you want ! Please Change another words.
                </div>
                <script type="text/javascript">
                    document.body.style.background = "url('image/Warning.jpg') no-repeat center 0px fixed";
                    document.body.style.backgroundSize = "cover";
                </script>
            </c:when>
            <c:otherwise>
                <%--从第一条（index=0）记录开始取，到（index=1）结束：begin="0" end="1" step="1" --%>
                <%--展示5条记录--%>
                <ul>
                    <script type="text/javascript">
                        document.body.style.background = "url('${ctp}/image/RBG3.jpg') no-repeat center 0px fixed";
                        document.body.style.backgroundSize = "cover";
                    </script>
                    <c:forEach varStatus="PJ" var="project" items="${data}">
                        <li>
                            <div class="eachOne">
                                <div class="eachOneLeft">
                                    <a href='${ctp}/browse/detail-${project.id}'>
                                            <%--list:装载文件路径（绝对路径）--%>
                                        <object class="showImage" data="${project.cover}"></object>
                                    </a>
                                </div>
                                <div class="eachOneRight">
                                    <a href="#">
                                        <output class="PJTitle">Project Title：</output>
                                            ${project.title}
                                    </a><br>
                                    <a href="#">
                                        <output class="PJCategory">Category：</output>
                                            ${project.category.name}
                                    </a><br>
                                    <a href="#">
                                        <output class="PJTeam">Team：</output>
                                            ${project.team}
                                    </a><br>
                                    <a href="#">
                                        <output class="PJPurpose">Purpose：</output>
                                            ${project.purpose}
                                    </a><br/>
                                    <a href="#">
                                        <output class="PJGAmount">Goal：</output>
                                            ${project.goalAmount}
                                    </a><br/>
                                    <a href="#">
                                        <output class="PJ">Project Status：</output>
                                        <c:if test="${project.status eq '0'}">Unfinished Undue</c:if>
                                        <c:if test="${project.status eq '1'}">Completed Undue</c:if>
                                        <c:if test="${project.status eq '2'}">Unfinished Expiry</c:if>
                                        <c:if test="${project.status eq '3'}">Completed Expiry</c:if>
                                    </a><br/>
                                    <output class="PJPublishTime">Publish Time：<fmt:formatDate type="date"
                                                                                               pattern="yyyy-mm-dd"
                                                                                               value="${project.publishTime}"></fmt:formatDate></output>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-primary"
                                             style="width: ${(project.actualAmount/project.goalAmount)*100}% "></div>
                                    </div>
                                    <output class="PJFPercentage"
                                            style="width: 50px;height: 50px;color: palevioletred;">

                                    </output>
                                    <output class="PJFPercent">
                                        <fmt:formatNumber type="percent" minFractionDigits="2"
                                                          value="${project.actualAmount/project.goalAmount}"/> Funded
                                    </output>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<div>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
