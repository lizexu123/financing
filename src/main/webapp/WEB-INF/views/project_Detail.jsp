<%--
  Created by IntelliJ IDEA.
  User: Lizexu
  Date: 2018/6/4
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <style>
        #title {
            font-size: 25px;
            font-weight: bold;
        }

        #sdzc {
            color: #fff;
            background-color: #286090;
            border-color: #204d74;
            width: 100%;
            padding: 10px 16px;
            font-size: 18px;
            cursor: pointer;
        }

        #clearfix {
            margin-top: 20px;
            width: 970px;
            display: block;
            height: 70px;
            background-color: #e7ebef
        }

        #clearfix ul li {
            border-bottom: white;
            float: left;
            padding: 30px 100px;
            width: 300px;
            cursor: pointer;
        }

        #clearfix ul li:hover {
            background-color: white;
        }

        #gengxin {
            position: relative;
            border: 1px solid gray;
            /* left: -480px; */
            width: 680px;
            left: -100px;
            margin-top: 40px;
        }

        #zhong {
            height: 600px;
        }

        #xmid {
            position: relative;
            top: -100px;
            left: 100px;
        }

        .th {
            position: relative;
            left: -200px;
            top: -100px;
        }

        #pd {
            margin-left: 10px;
            position: relative;
            top: -100px;
            left: 90px;
        }

        #pd1 {
            position: relative;
            top: -70px;
            left: -170px;
        }

        #content1 {
            position: relative;
            top: -70px;
            left: -160px;
        }

        #gengxin1 {
            position: relative;
            top: -20px;
            left: 110px;
            cursor: pointer;
            color: #fff;
            background-color: #d9534f;
            border-color: #d43f3a;
            padding: 10px 16px;
        }

        #update th {
            position: relative;
            top: -100px;
            padding-right: 50px;
        }

        #jia {
            position: relative;
            top: -100px;
            padding-right: 50px;
        }

        #update tr td {
            position: relative;
            top: -80px;
        }
    </style>
<body>
<jsp:include page="header.jsp"/>
<div class="ContainEverything">
    <div class="AllSearchResults">

        <%--从第一条（index=0）记录开始取，到（index=1）结束：begin="0" end="1" step="1" --%>
        <%--展示5条记录--%>
        <ul>
            <%--begin="0" end="4"--%>
            <div class="eachOne">
                <div class="eachOneLeft">
                    <img class="showImage" src="${ctp}/image/roll3.jpg">
                    <%--图片必须用绝对路径输出--%>
                </div>
                <div class="eachOneRight">
                    <a href="#">
                        <output class="PJTitle">项目名称：<span id="title"> ${data.title}</span></output>

                    </a><br>
                    <a href="#">
                        <output class="PJCategory">支持数：<span id="shengyu"> </span></output>

                    </a><br>
                    <a href="#">
                        <output class="PJCategory">已经筹款：<span id=""> </span></output>
                    </a><br>

                    <a href="#">
                        <output class="PJ">项目状态：</output>
                        <c:if test="${data.status eq '0'}">正在进行，还没完成</c:if>
                        <c:if test="${data.status eq '1'}">1</c:if>
                        <c:if test="${data.status eq '2'}">2</c:if>
                        <c:if test="${data.status eq '3'}">3</c:if>
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
                    <a href="#">
                        <output class="PJCategory">剩余天数：<input id="shengyutian" readonly/></output>
                    </a><br>
                    <br>
                    <a href="#">
                        <button type="button" id="sdzc">立即支持</button>
                    </a><br>

                </div>
            </div>
            </li>
        </ul>
        <div id="zhong">
            <div id="clearfix">
                <ul>
                    <li>项目详情</li>
                    <li>项目更新</li>
                    <li>评论</li>
                </ul>
            </div>
            <div id="gengxin">
                <table id="update">

                </table>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
    <script type="text/javascript">
        function PJPercentage() {
            var a = ${project.actualAmount/project.goalAmount};
            $('.progress-bar progress-bar-primary').css('width', a);
        }

        var date1 = '${data.publishTime}';
        var date2 = '${data.endTime}';
        date1 = new Date(date1)
        date2 = new Date(date2);
        var date3 = date2.getTime() - date1.getTime();
        var days = Math.floor(date3 / (24 * 3600 * 1000));
        console.log(date1);
        console.log(date3);
        document.getElementById("shengyutian").value = days;
        if (days < 0) {
            document.getElementById("shengyutian").value = 0;
            document.getElementById("sdzc").style.display = 'none';

        }

        function timestampToTime(timestamp) {
            var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
            Y = date.getFullYear() + '-';
            M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
            D = date.getDate() + ' ';
            h = date.getHours() + ':';
            m = date.getMinutes() + ':';
            s = date.getSeconds();
            return Y + M + D + h + m + s;
        }

        $.ajax({//调用ajax后台数据异步方法
            //提交的方式
            type: "get",
            async: false,
            //数据的传送页面：要启动界面的地址/界面的后台的方法
            url: "doGetUpdate-${data.id}",
            // contentType:false,
            //重要的后台的回调函数（很重要）
            success: function (result) {
                console.log(result.data);
                if (result.flag == 1) {
                    console.log(result.flag);
                    // var d = eval('(' + result.data+ ')');
                    var d = result.data;
                    $("#update").append('<th id="jia">project_id</th><th>update_time</th><th>update_content</th>');
                    for (var i = 0; i < d.length; i++) {
                        if ($("#update tr").length <= d.length) {
                            $("#update").append(
                                "<tr>" +
                                "<td>" + d[i]["project"] + "</td>" +
                                "<td>" + timestampToTime(d[i]["update_time"]) + "</td>" +
                                "<td>" + d[i]["update_content"] + "</td>" +
                                "</tr>");
                        } else {
                            layer.msg("拿不到数据");
                        }

                    }
                }
            }
        });


    </script>
</body>
</html>
