<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
    <style type="text/css">
        #top {
            position: relative;
            top: 30px;
            padding-left: 20px;
        }

        table#tbody {
            position: relative;
            top: -350px;
            left: 250px;
        }

        #tbody th {
            padding-right: 10px;
        }

        #back {
            position: relative;
            top: -300px;
            left: 100px;
        }

        #p {
            position: relative;
            top: -250px;
            left: 650px;
        }

        a {
            text-decoration: none;
        }

        #backs {
            position: relative;
            top: -240px;
            left: 500px;
        }

        #backs th {
            font-size: 20px;
        }

        #xu {
            position: relative;
            top: -70px;
            left: 400px;
        }

        #shi {
            position: relative;
            top: -80px;
            left: 400px;
        }

    </style>
</head>
<body class="personal">
<div class="wrap">
    <jsp:include page="person_left.jsp"/>
    <div class="head_portrait l">
        <img src="${sessionScope.user.avatar}" alt="">
    </div>
    <div class="nickname l" id="top">
        <span>mobile:${sessionScope.user.mobile}</span><span style="font-size: 14px;color: gray;"><i></i>已认证</span></p>
    </div>
    <%--<p id="increase"><a href="javascript:void(0)" onclick="addBox()">添加回报</a></p>--%>


    <div id="addBackBox">
        <form id="addBackForm" action="/doAddBack">
            <table class="table table-striped" id="tbody" style="width:1250px">

            </table>

            <div id="back">
                amount：<input name="amount" type="number">
                content：<input name="content">
                allow：<input name="allow" type="number">
                back_date：<input name="back_date" type="date">
                compensation：
                <select name="post">
                    <option value="0">虚拟回报</option>
                    <option value="1">实物回报</option>
                </select>
                <input type="button" id="addBackBtn" class="button" value="提交">
            </div>
        </form>
        <span id="p">回报列表</span>
        <br>
        <table id="backs">
        </table>
    </div>

</div>
</body>


<script>
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
        url: "${ctp}/doProjectByUser",
        // contentType:false,
        //重要的后台的回调函数（很重要）
        success: function (result) {
            console.log(result.data);
            if (result.flag == 1) {
                console.log(result.flag);
                // var d = eval('(' + result.data+ ')');
                var d = result.data;
                console.log(d);
                $("#tbody").append('<th>title</th><th>category</th><th>goalAmount</th><th>actualAmount</th><th>contactName</th><th>contactPhone</th><th>endTime</th><th>hotline</th><th>purpose</th><th>team</th><th>user_phone</th><th>detail</th><th>projectUpdate</th><th>clickback</th><th>getback</th>');
                for (var i = 0; i < d.length; i++) {
                    if ($("#tbody tr").length <= d.length) {

                        $("#tbody").append(
                            "<tr>" +
                            "<td>" + d[i]["title"] + "</td>" +
                            "<td>" + d[i]["category"].name + "</td>" +
                            "<td>" + d[i]["goalAmount"] + "</td>" +
                            "<td>" + (d[i]["actualAmount"]) + "</td>" +
                            "<td>" + d[i]["contactName"] + "</td>" +
                            "<td>" + d[i]["contactPhone"] + "</td>" +
                            "<td>" + timestampToTime(d[i]["endTime"]) + "</td>" +
                            "<td>" + d[i]["hotile"] + "</td>" +
                            "<td>" + d[i]["purpose"] + "</td>" +
                            "<td>" + d[i]["team"] + "</td>" +
                            "<td>" + d[i]["user"].mobile + "</td>" +
                            "<td>" + d[i]["detail"] + "</td>" +
                            "<td><a href='doProjectInfo-" + d[i]["id"] + "'>projectUpdate</a></td>" +
                            "<td><input type='radio' name='project' value='" + d[i].id + "'>" +
                            "<td><input type='button' onclick=\"getBacks('" + d[i].id + "')\">" +
                            "</tr>");

                    } else {
                        layer.msg("拿不到数据");
                    }

                }
            }
        }
    });
    $(document).ready(function () {
        // getBacks();

        $("#addBackBtn").click(function () {
            $.ajax({
                type: 'post',
                async: false,
                url: '${ctp}/doAddBack',
                dataType: 'json',
                data: $("#addBackForm").serialize(),

                success: (function (result) {
                    var flag = parseInt(result.flag);
                    var msg = result.msg;
                    if (flag == 1) {
                        layer.msg(msg);
                    }
                })
            })

            // getBacks();
        })
    });

    // function addBox() {
    //     $("#addBackBox").slideToggle();
    // }

    function getBacks(e) {
        console.log(e)
        $.ajax({
            type: 'GET',
            async: false,
            url: '${ctp}/doGetBacks-' + e,
            dataType: 'json',
            data: null,
            success: (function (result) {
                var flag = parseInt(result.flag);
                var msg = result.msg;
                var data = result.data;
                console.log(data);
                if (flag == 1) {
                    $("#backs").empty();
                    if (data.length > 0) {
                        $("#backs").append(
                            '<th>content</th><th>back_date</th><th>amount</th><th>allow</th><th>compensation</th>');
                        console.log(data.length)
                        for (var i = 0; i < data.length; i++) {
                            (function (e) {
                                if (data[e].compensation == 0) {
                                    $("#backs").append(
                                        "<tr>" +
                                        "<td>" + data[i]["content"] + "</td>" +
                                        "<td>" + data[i]["backDate"] + "</td>" +
                                        "<td>" + data[i]["amount"] + "</td>" +
                                        "<td>" + data[i]["allow"] + "</td>" +
                                        "</tr>"
                                    );
                                    // "<p>" + data[i].amount + "</p>" + "<p>" + data[i].allow + "</p>");
                                    switch (data[i].post) {
                                        case 0:
                                            $("#backs").append("<p id='xu'>虚拟回报</p>");
                                            break;
                                        case 1:
                                            $("#backs").append("<p id='shi'>实物回报</p>");
                                            break;
                                    }
                                }
                            })(i)
                        }
                    }
                } else if (flag == 0) {
                    alert(msg);
                }
            })
        })
    }


</script>


</html>