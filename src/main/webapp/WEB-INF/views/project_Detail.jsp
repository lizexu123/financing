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
            color: white;
            background-color: #50abf2;
            border-color: #204d74;
            padding: 10px 16px;
            font-size: 18px;
            margin-left: 34%;
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
            height: 400px;
        }



        .th {
            position: relative;
            left: -200px;
            top: -100px;
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
            top: -250px;
            padding-right: 25px;
            font-weight: bold;
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
            left: -800px;
        }

        #xiangqing1 tr td {
            font-weight: bold;
            padding-bottom: 10px;
        }

        #cmt {
            font-size: 25px;
            position: relative;
            left: 120px;
        }

        #content2 {
            position: relative;
            left: 150px;
        }

        #pinglun {
            position: relative;
            left: -480px;
            top: 90px;
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
            padding-top: 10px;
        }


        .radio {
            margin-left: 10px;
        }

        .xq {
            position: relative;
            top: -445px;
            left: 750px;
            padding-bottom: 12px;
            font-weight: bold;
        }

        #dl {
            position: relative;
            top: -450px;
            left: 740px;
        }

        #footer {
            position: relative;
            width: 100%;
            height: 70px;
            color: white;
            font-size: 17px;
            text-align: center;
            line-height: 25px;
            background: rgba(0, 0, 0, 0.1);
            top: 610px;
        }

        .PJTitle {
            color: black;
        }

        .PJCategory {
            font-size: 25px;
            font-weight: bold;
            color: black;
        }

        .eachOne a {
            text-decoration: none;
            color: black;
            font-family: fantasy;
        }

        .PJPublishTime {
            color: black;

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
                    <object class="showImage" data="${data.cover}"></object>
                    <%--图片必须用绝对路径输出--%>
                </div>
                <div class="eachOneRight">
                    <a href="#">
                        <output class="PJTitle">Title：<span id="title"> ${data.title}</span></output>
                    </a><br>
                    <a href="#">
                        <output class="PJCategory">Support：<span id="shengyu">${data.supportCount} </span></output>

                    </a><br>
                    <a href="#">
                        <output class="PJCategory">ActualAmount：<span id="">${data.actualAmount}</span></output>
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
                        已经完成：${(data.actualAmount/data.goalAmount)/100}%
                    </output>
                    <br>
                    <a href="#">
                        <output class="PJCategory">剩余天数：<input id="shengyutian" readonly/></output>
                    </a><br>
                    <br>
                    <a href="#">
                        <a href='${ctp}/browse/support-${data.id}' id="sdzc" id="sdzc">support</a>
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
                        <td>title</td>
                    </tr>
                    <tr>
                        <td>categoryName</td>
                    </tr>
                    <tr>
                        <td>goalAmount</td>
                    </tr>
                    <tr>
                        <td>actualAmount</td>
                    </tr>
                    <tr>
                        <td>contactName</td>
                    </tr>
                    <tr>
                        <td>contactPhone</td>
                    </tr>
                    <tr>
                        <td>publishTime</td>
                    </tr>
                    <tr>
                        <td>endTime</td>
                    </tr>
                    <tr>
                        <td>hotline</td>
                    </tr>
                    <tr>
                        <td>purpose</td>
                    </tr>
                    <tr>
                        <td>team</td>
                    </tr>
                    <tr>
                        <td>user.mobile</td>
                    </tr>
                    <tr>
                        <td>detail</td>
                    </tr>

                    <%--<tr>--%>
                    <%--<td class="proj2">${data.id}</td>--%>
                    <%--</tr>--%>

                    <%--<tr>--%>
                    <%--<td class="proj2">${data.title}</td>--%>
                    <%--</tr>--%>
                </table>
                <p class="xq">${data.title}</p>
                <p class="xq">${data.category.name}</p>
                <p class="xq">${data.goalAmount}</p>

                <c:if test="${not empty data.actualAmount}">
                    <p class="xq">${data.actualAmount}</p>
                </c:if>
                <c:if test="${empty data.actualAmount}">
                    <p class="xq">0</p>
                </c:if>
                <p class="xq">${data.contactName}</p>
                <p class="xq">${data.contactPhone}</p>
                <p class="xq">${data.publishTime}</p>
                <p class="xq">${data.endTime}</p>
                <p class="xq">${data.hotline}</p>
                <p class="xq">${data.purpose}</p>
                <p class="xq">${data.team}</p>
                <p class="xq">${sessionScope.user.mobile}</p>
                <div id="dl"> ${data.detail}</div>


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
                            <tr>
                                <th id="cmt">content:</th>
                                <td><input type="text" class="cmt1" name="content" id="content2"/></td>
                            </tr>
                            <tr>
                                </td><input type="button" id="pinglun" value="comment" onclick="pingluna()"/></td>
                            </tr>
                        </table>
                    </div>

                </form>
            </div>

        </div>
        <div id="footer">
            <p>Copyright ©2018 Made By -All rights reserved.</p>
            <p>Designer : Penny Wendy CoolLi</p>
            <a>版权所有 CPW</a>
            <br/>
        </div>
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
                url: "${ctp}/doGetUpdate-${data.id}",

                // contentType:false,
                //重要的后台的回调函数（很重要）
                success: function (result) {
                    console.log(result.data);
                    if (result.flag == 1) {
                        console.log(result.flag);
                        // var d = eval('(' + result.data+ ')');
                        var d = result.data;
                        for (var i = 0; i < d.length; i++) {
                            if ($("#update tr").length <= d.length) {
                                $("#update").append(
                                    "<tr>" +
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
                    url: "${ctp}/doAddComment",//url
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
                url: "${ctp}/doGetComment-${data.id}",
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
                                    "<td>id: " + d[i].id + "</td>" +
                                    "</tr>"
                                    + "<tr>" +
                                    "<td>From: " + d[i].fromUser.mobile + "</td>" +
                                    "</tr>"
                                    + "<tr>" +
                                    "<td>Content: " + d[i].content +
                                    "<input class='radio' type='radio' value='"
                                    + d[i].fromUser.id + "' name='to_user'> </td>" +
                                    "</tr>"
                                    + "<tr>" +
                                    "<td> To:"
                                    + d[i].toUser.mobile + " </td>" +
                                    "</tr>"

                                    + "<tr>" +
                                    "<td>CreateTime: " + d[i].createTime + "</td>" +
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
