<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>项目详情</title>
    <link rel="stylesheet" href="${ctp}/css/project_show.css" type="text/css"/>
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
        $(window).load(function (data) {
            var jsonLength = 0;
            for (var project in data) {
                jsonLength++;
            }
            console.log(jsonLength);
            return jsonLength;
        })
    </script>
</head>
<%--用于加载各种搜索结果--%>
<body>
<jsp:include page="header.jsp"/>
<div class="ContainEverything">
    <div class="AllSearchResults">
        <c:choose>
            <c:when test="${empty data}">
                <div class="alert alert-danger alert-dismissable">
                    <button aria-hidden="true" data-dismiss="alert" class="close" type="button"> ×</button>
                    I am sorry I can't Find what you want ! Please Change another words.
                </div>
            </c:when>
            <c:otherwise>
                <%--从第一条（index=0）记录开始取，到（index=1）结束：begin="0" end="1" step="1" --%>
                <%--展示5条记录--%>
                <ul>
                        <%--begin="0" end="4"--%>
                    <c:forEach varStatus="PJ" var="project" items="${data}" step="1">
                        <li>data.length
                            <div class="eachOne">
                                <div class="eachOneLeft">
                                    <a href='doProjectDetail-${project.id}'><img class="showImage"
                                                                                 src="${project.cover}"></a>
                                        <%--图片必须用绝对路径输出--%>
                                </div>
                                <div class="eachOneRight">
                                    <a href="#">
                                        <output class="PJTitle">项目名称：</output>
                                            ${project.title}
                                    </a><br>
                                    <a href="#">
                                        <output class="PJCategory">类别：</output>
                                            ${project.category.name}
                                    </a><br>
                                    <a href="#">
                                        <output class="PJTeam">团队名称：</output>
                                            ${project.team}
                                    </a><br>
                                    <a href="#">
                                        <output class="PJPurpose">目的：</output>
                                            ${project.purpose}
                                    </a><br/>
                                    <a href="#">
                                        <output class="PJGAmount">计划筹资：</output>
                                            ${project.goalAmount}
                                    </a><br/>
                                    <a href="#">
                                        <output class="PJ">项目状态：</output>
                                        <c:if test="${project.status eq '0'}">正在进行，还没完成</c:if>
                                        <c:if test="${project.status eq '1'}">1</c:if>
                                        <c:if test="${project.status eq '2'}">2</c:if>
                                        <c:if test="${project.status eq '3'}">3</c:if>
                                    </a><br/>
                                    <output class="PJPublishTime">发布日期：</output>
                                    <fmt:formatDate type="date"
                                                    value="${project.publishTime}"></fmt:formatDate>
                                    <div class="progress" onloadstart="PJPercentage">
                                            <%--${project.goalAmount}-${project.actualAmount}--%>
                                        <div class="progress-bar progress-bar-primary"></div>
                                    </div>
                                    <output class="PJFPercentage"
                                            style="width: 50px;height: 50px;color: palevioletred;">
                                        已经完成：${(project.actualAmount/project.goalAmount)/100}%
                                    </output>
                                    <br>

                                    <script type="text/javascript">
                                        function PJPercentage() {
                                            var a = ${project.actualAmount/project.goalAmount};
                                            $('.progress-bar progress-bar-primary').css('width', a);
                                        }
                                    </script>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </c:otherwise>
        </c:choose>
    </div>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
