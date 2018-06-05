<%@ page pageEncoding="utf-8" %>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>eachOne(展示模板)</title>
    <script src="js/vue.js" type="text/javascript"></script>
</head>
<body>
<div id="search_result_model">
    <div id="AllSearchResult">
        <%--<c:choose>--%>
        <%--<c:when test="${data==null}">还在努力筹备中</c:when>--%>
        <%--<c:otherwise>--%>
        <%--从第一条（index=0）记录开始取，到（index=1）结束：begin="0" end="1" step="1" --%>
        <%--展示5条记录--%>
        <%--用于展示当前实际搜索时间--%>
        <div>{{new Date()}}</div>
        <div v-if="result && result.data && result.data.length">
            <%--<p>共搜索到{{result.data.length}}条记录：</p>--%>
            <ul>
                <li v-for="project in result.data">
                    <div class="eachOne">
                        <div class="eachOneLeft">
                            <span v-if="!project.cover || project.cover.trim().length == 0">
                                <a href="#"><img class="showImage" src="image/bnr.jpg"></a>
                            </span>
                            <span v-else>
                                <a href="#"><img class="showImage" src="{{project.cover}}"></a>
                            </span>
                            <%--图片必须用绝对路径输出--%>
                        </div>
                        <div class="eachOneRight">
                            <a href="#">
                                <output class="PJTitle">项目名称：</output>
                                {{project.title}}
                            </a><br>
                            <a href="#">
                                <output class="PJCategory">类别：</output>
                                <%--${project.category.name}--%>
                                {{project.category.name}}
                            </a><br>
                            <a href="#">
                                <output class="PJTeam">团队名称：</output>
                                <%--${project.team}--%>
                                {{project.team}}
                            </a><br>
                            <a href="#">
                                <output class="PJPurpose">目的：</output>
                                <%--${project.purpose}--%>
                                {{project.purpose}}
                            </a><br/>
                            <a href="#">
                                <output class="PJGAmount">计划筹资：</output>
                                <%--${project.goalAmount}--%>
                                {{project.goalAmount}}
                            </a><br/>
                            <a href="#">
                                <output class="PJ">项目状态：</output>
                                <%--<c:if test="${project.status eq '0'}">正在进行，还没完成</c:if>--%>
                                <%--<c:if test="${project.status eq '1'}">1</c:if>--%>
                                <%--<c:if test="${project.status eq '2'}">2</c:if>--%>
                                <%--<c:if test="${project.status eq '3'}">3</c:if>--%>
                                <span v-if="project.status == '0'">正在进行，还没完成...</span>
                                <span v-if="project.status == '1'">1</span>
                                <span v-if="project.status == '2'">2</span>
                                <span v-if="project.status == '3'">3</span>
                            </a><br/>
                            <output class="PJPublishTime">发布日期：</output>
                            {{project.publishTime}}
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div v-else>
            <div class="alert alert-danger alert-dismissable">
                <button aria-hidden="true" data-dismiss="alert" class="close" type="button"> ×</button>
                I am sorry I can't Find what you want ! Please Change another words.
            </div>
        </div>
    </div>
</div>
<script>
    var searchResult = {
        msg: undefined,
        data: undefined,
        flag: undefined
    };
    var app_search_results = new Vue({
        el: '#search_result_model',
        data: {
            result: searchResult
        }
    });

    function updateSearchResults(result) {
        searchResult.msg = result.msg;
        searchResult.data = result.data;
        searchResult.flag = result.flag;
    };
</script>
</body>
</html>