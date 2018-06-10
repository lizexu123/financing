<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <base href="<%=basePath%>">
    <title>project_show</title>
    <link rel="stylesheet" href="${ctp}/css/project_show.css" type="text/css"/>
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <%--<script type="text/javascript">--%>
    <%--window.onload = function changeBarFocus() {--%>
    <%--$('.top-nav>ul>li').removeClass("active").addClass("grid");--%>
    <%--$('#All').addClass("active");--%>
    <%--}--%>
    <%--</script>--%>
</head>
<%--用于加载各种搜索结果--%>
<body>
<jsp:include page="header.jsp"/>
<div class="ContainEverything">
    <div class="AllSearchResults">
        <script type="text/javascript">
            //页码显示
            $(function () {
                //page.currentPage当前页
                var dqPage = parseInt(${page.currentPage});//得到的文本转成int
                //page.totalPage总页数
                var pageCount = parseInt(${page.totalPage});//得到总页数
                var i = 1;
                i = parseInt(i);
                var item = "";
                var href = "<%=path %>/doProjectAll?method=list&currentPage=";
                if (pageCount < 6) {
                    //总页数小于五页，则加载所有页
                    for (i; i <= pageCount; i++) {
                        if (i == dqPage) {
                            item += "<span class='disabled'>" + i + "</span>";
                        } else {
                            item += "<a href='" + href + i + "' >" + i + "</a>";
                        }
                    }
                    $('#pageBtn').append(item);
                    return;
                } else if (pageCount > 5) {//总页数大于五页，则加载五页
                    if (dqPage < 5) {//当前页小于5，加载1-5页
                        for (i; i <= 5; i++) {
                            if (i == dqPage) {
                                item += "<span class='disabled'>" + i + "</span>";
                            } else {
                                item += "<a href='" + href + i + "' >" + i + "</a>";
                            }
                        }
                        if (dqPage <= pageCount - 2) {//最后一页追加“...”代表省略的页
                            item += "<span> . . . </span>";
                        }
                        $('#pageBtn').append(item);
                        return;
                    } else if (dqPage > 6) {//当前页大于5页
                        for (i; i <= 2; i++) {//1,2页码始终显示
                            item += "<a href='" + href + i + "' >" + i + "</a>";
                        }
                        item += "<span> . . . </span>";//2页码后面用...代替部分未显示的页码
                        if (dqPage + 1 == pageCount) {//当前页+1等于总页码
                            for (i = dqPage - 1; i <= pageCount; i++) {//“...”后面跟三个页码当前页居中显示
                                if (i == dqPage) {
                                    item += "<span class='disabled'>" + i + "</span>";
                                } else {
                                    item += "<a href='" + href + i + "' >" + i + "</a>";
                                }
                            }
                        } else if (dqPage == pageCount) {//当前页数等于总页数则是最后一页页码显示在最后
                            for (i = dqPage - 2; i <= pageCount; i++) {//...后面跟三个页码当前页居中显示
                                if (i == dqPage) {
                                    item += "<span class='disabled'>" + i + "</span>";
                                } else {
                                    item += "<a href='" + href + i + "' >" + i + "</a>";
                                }
                            }
                        } else {//当前页小于总页数，则最后一页后面跟...
                            for (i = dqPage - 1; i <= dqPage + 1; i++) {//dqPage+1页后面...
                                if (i == dqPage) {
                                    item += "<span class='disabled'>" + i + "</span>";
                                } else {
                                    item += "<a href='" + href + i + "' >" + i + "</a>";
                                }
                            }
                            item += "<span> . . . </span>";
                        }
                        $('#pageBtn').append(item);
                        return;
                    }
                }
            });
        </script>
        <%--实现分页查询：--%>
        <c:choose>
            <c:when test="${empty list}">
                <div class="alert alert-danger alert-dismissable">
                    <button aria-hidden="true" list-dismiss="alert" class="close" type="button"> ×</button>
                    I am sorry I can't Find what you want ! Please Change another words.
                </div>
                <script type="text/javascript">
                    document.body.style.background = "url('${ctp}/image/Warning.jpg') no-repeat center 0px fixed";
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
                    <span class="AllR">All Project</span>
                    <c:forEach varStatus="PJ" var="project" items="${list}">
                        <li>
                            <div class="eachOne">
                                <div class="eachOneLeft">
                                    <a href='doProjectDetail-${project.id}'>
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
        <div class="Page-box">
            <%-- 得到当前页--%>
            <span id="dqPage" hidden="hidden" class="disabled1 current"></span>
            <%-- js控制的页码显示在这个div中--%>
            <div id="pageBtn" style="width: auto;display:inline-block !important;height: auto;">
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
