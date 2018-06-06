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
    <script type="text/javascript" src="${ctp}/js/layer.js"></script>
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
            left: -15px;
            top: 60px;
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

        .proj1 {
            position: relative;
            top: 30px;
            font-size: 20px;
            padding-right: 30px;
        }

        .proj2 {
            position: relative;
            top: 40px;
            /* left: -420px; */
            font-size: 20px;
            font-weight: bold;
            padding-right: 20px
        }

        #xiangqing {
            position: relative;
            top: 50px
        }

        #shengyutian {
            width: 30px;
            border: 1px solid gray;
            color: white;
            background-color: red;
        }

        #xiangqing1 {
            position: relative;
            top: -200px;
        }

        .cmt {
            font-size: 25px;
            position: relative;
            /* left: -1180px; */
            left: -450px;
            top: -230px;
        }

        .cmt1 {
            position: relative;
            left: -400px;
            top: -227px;
        }

        #pinglun {
            position: relative;
            top: -120px;
            left: 1300px;
            /* left: -200px; */
            cursor: pointer;
            color: #fff;
            background-color: #d9534f;
            border-color: #d43f3a;
            padding: 10px 16px;
        }

        #plItemCountBox {
            position: relative;
            left: -800px;
        }

        #plItemCountBox tr td {
            font-size: 20px;
            font-weight: bold;
            padding-top: 10px;
        }

        #comment1 {
            position: relative;
            left: 800px
        }

        .radio {
            margin-left: 10px;
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
                    <li id="kk1" onclick="chu()">项目详情</li>
                    <li id="ss2" onclick="chu1()">项目更新</li>
                    <li id="pp3" onclick="chu3()">评论</li>
                </ul>
            </div>
            <div id="xiangqing">
                <table id="xiangqing1">
                    <tr>
                        <th class="proj1">category</th>
                        <th class="proj1">goal_amount</th>
                        <th class="proj1">publish_time</th>
                        <th class="proj1">end_time</th>
                        <th class="proj1">team</th>
                        <th class="proj1">purpose</th>
                        <th class="proj1">contacct_name</th>
                        <th class="proj1">hotline</th>
                        <th class="proj1">contact_phone</th>
                    </tr>
                    <tr>
                        <td class="proj2">${data.category.id}</td>
                        <td class="proj2">${data.goalAmount}</td>
                        <td class="proj2">${data.publishTime}</td>
                        <td class="proj2">${data.endTime}</td>
                        <td class="proj2">${data.team}</td>
                        <td class="proj2">${data.purpose}</td>
                        <td class="proj2">${data.contactName}</td>
                        <td class="proj2">${data.hotline}</td>
                        <td class="proj2">${data.contactPhone}</td>
                    </tr>

                    <%--<tr>--%>
                    <%--<td class="proj2">${data.id}</td>--%>
                    <%--</tr>--%>

                    <%--<tr>--%>
                    <%--<td class="proj2">${data.title}</td>--%>
                    <%--</tr>--%>
                </table>

            </div>

            <div id="gengxin" style="display: none">
                <table id="update">

                </table>
            </div>
            <div class="commentm" id="comemnt" style="display: none">
                <form action="/doAddComment" method="post" id="commen">
                    <input type="text" class="cmt1" name="project" value="${data.id}" style="display: none"/>
                    <div>
                        <table id="plItemCountBox">

                        </table>
                    </div>
                    <table id="comment1">
                        <tr>
                            <th class="cmt">content:</th>
                            <td><input type="text" class="cmt1" name="content" id="content2"/></td>
                        </tr>


                        <tr>
                            <input type="button" id="pinglun" value="立即评论" onclick="pingluna()"/>
                        </tr>
                    </table>
                </form>
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
                console.log(timestamp);
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
                                    "<td>" + d[i]["project"].id + "</td>" +
                                    "<td>" + d[i].updateTime + "</td>" +
                                    "<td>" + d[i].updateContent + "</td>" +
                                    "</tr>");
                            } else {
                                layer.msg("拿不到数据");
                            }

                        }
                    }
                }
            });

            function chu() {
                document.getElementById("gengxin").style.display = 'none';
                document.getElementsByClassName("commentm")[0].style.display = 'none';
                document.getElementById("xiangqing").style.display = 'block';
            }

            function chu1() {
                document.getElementById("xiangqing").style.display = 'none';
                document.getElementsByClassName("commentm")[0].style.display = 'none';
                document.getElementById("gengxin").style.display = 'block';
            }

            function pingluna() {
                $.ajax({
                    //几个参数需要注意一下
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "doAddComment",//url
                    data: $('#commen').serialize(),
                    success: function (result) {
                        console.log(result);//打印服务端返回的数据(调试用)
                        console.log(result.flag);
                        if (result.flag == 1) {
                            window.location.href = "${ctp}/doProjectDetail-${data.id}";
                        } else {
                            layer.msg(result.msg);
                        }

                    }
                });
            }

            $.ajax({//调用ajax后台数据异步方法
                //提交的方式
                type: "get",
                async: false,
                //数据的传送页面：要启动界面的地址/界面的后台的方法
                url: "doGetComment-${data.id}",
                // contentType:false,
                //重要的后台的回调函数（很重要）
                success: function (result) {
                    console.log(result.data);
                    if (result.flag == 1) {
                        console.log(result.flag);
                        // var d = eval('(' + result.data+ ')');
                        var d = result.data;
                        console.log(d);
                        for (var i = 0; i < d.length; i++) {
                            if ($("plItemCountBox tr").length <= d.length) {

                                if (d[i].toUser == null) {
                                    d[i].toUser = new Object();
                                    d[i].toUser.mobile = "无";
                                }

                                $("#plItemCountBox").append(
                                    "<tr>" +
                                    "<td>评论id: " + d[i].id + "</td>" +
                                    "</tr>"
                                    + "<tr>" +
                                    "<td>用户id: " + d[i].fromUser.mobile + "</td>" +
                                    "</tr>"
                                    + "<tr>" +
                                    "<td>content: " + d[i].content + "<input class='radio' type='radio' value='"
                                    + d[i].fromUser.id + "' name='to_user'> </td>" +
                                    "</tr>"
                                    + "<tr>" +
                                    "<td> To:"
                                    + d[i].toUser.mobile + " </td>" +
                                    "</tr>"

                                    + "<tr>" +
                                    "<td>createTime: " + d[i].createTime + "</td>" +
                                    "</tr>"
                                );


                            } else {
                                layer.msg("拿不到数据");
                            }

                        }
                    }
                }
            });

            function chu3() {
                document.getElementById("xiangqing").style.display = 'none';
                document.getElementById("gengxin").style.display = 'none';
                document.getElementsByClassName("commentm")[0].style.display = 'block';

            }


        </script>
</body>
</html>
