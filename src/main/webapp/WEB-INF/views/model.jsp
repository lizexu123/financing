<%@ page pageEncoding="utf-8" %>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>eachOne(Top Five)</title>
    <script src="js/vue.js" type="text/javascript"></script>
</head>
<body>
<div id="search_result_model">
    <div id="AllSearchResult">
        <%--用于展示当前实际搜索时间--%>
        <%--<div>{{new Date()}}</div>--%>
        <div v-if="result && result.data && result.data.length">
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
                                <output class="PJTitle">Project Title：</output>
                                {{project.title}}
                            </a><br>
                            <a href="#">
                                <output class="PJCategory">Category：</output>
                                {{project.category.name}}
                            </a><br>
                            <a href="#">
                                <output class="PJTeam">Team：</output>
                                {{project.team}}
                            </a><br>
                            <a href="#">
                                <output class="PJPurpose">Purpose：</output>
                                {{project.purpose}}
                            </a><br/>
                            <a href="#">
                                <output class="PJGAmount">Goal：</output>
                                {{project.goalAmount}}
                            </a><br/>
                            <a href="#">
                                <output class="PJ">Project Status：</output>
                                <span v-if="project.status == '0'">Unfinished Undue</span>
                                <span v-if="project.status == '1'">Completed Undue</span>
                                <span v-if="project.status == '2'">Unfinished Expiry</span>
                                <span v-if="project.status == '3'">Completed Expiry</span>
                            </a><br/>
                            <output class="PJPublishTime">Publish Time：</output>
                            {{project.publishTime}}
                            <br>
                            <output class="PJPublishTime">Backers：</output>
                            <span v-if="project.support_count != null">{{project.support_count}}</span>
                            <span v-if="!project.support_count || project.support_count.trim().length == 0">No one's support</span>
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