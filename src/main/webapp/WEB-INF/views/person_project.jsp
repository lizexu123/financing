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

        #tbody {
            position: relative;
            top: -350px;
            left: 150px;
        }

        #tbody th {
            padding-right: 10px;
        }

        #tbody td {
            position: relative;
            left: 140px;
        }

        #back {
            position: relative;
            top: -300px;
            left: 200px;
        }

        #p {
            position: relative;
            top: -210px;
            left: 670px;
        }

        a {
            text-decoration: none;
        }

        #backs {
            position: relative;
            top: -200px;
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
            top: -70px;
        }

        #addBackBtn {
            position: relative;
            left: 20px;
        }

        #postkind {
            margin-top: 20px;
            margin-right: 20px;
        }

        #backs th {
            padding-right: 15px;
        }

        #xu {
            position: relative;
            top: -40px;
            left: 420px;
        }

        #wusi {
            position: relative;
            top: -108px;
            left: 520px;
        }

        #shi {
            position: relative;
            top: -145px;
            left: 420px;
        }

        #youchang {
            position: relative;
            top: -155px;
            left: 520px;
        }
    </style>
</head>
<body class="personal">

<div class="wrap">
    <jsp:include page="person_left.jsp"/>
    <%--<p id="increase"><a href="javascript:void(0)" onclick="addBox()">添加回报</a></p>--%>


    <div id="projectList">
        <form id="addBackForm" action="/doAddBack">
            <table class="table table-striped" id="tbody" style="width:1250px">

            </table>

            <div id="back">
                amount：<input name="amount" type="number">
                content：
                <input name="content" id="contentk">
                allow：<input name="allow" type="number">
                back_date：<input name="back_date" type="date">
                <br>
                <span id="bb">post:</span>
                <select name="post" id="postkind">
                    <option value="0">实物回报</option>
                    <option value="1">虚拟回报</option>
                </select>
                <span>compensation:</span>
                <select name="compensation">
                    <option value="0" id="wusi" onclick="cang()">无私回报</option>
                    <option value="1" onclick="chu()">有偿回报</option>
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
                $("#tbody").append('<th>id</th><th>projectEditor</th><th>clickback</th><th>getback</th>');
                for (var i = 0; i < d.length; i++) {
                    if ($("#tbody tr").length <= d.length) {

                        $("#tbody").append(
                            "<tr>" +
                            "<td>" + d[i]["id"] + "</td>" +
                            "<td><a href='doProjectInfo-" + d[i]["id"] + "'>projectEditor</a></td>" +
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
                    console.log($("#backs"));
                    if (data.length > 0) {
                        $("#backs").append(
                            '<th>content</th><th>back_date</th><th>amount</th><th>allow</th><th>post</th><th>compensation</th>');
                        console.log(data.length)
                        for (var i = 0; i < data.length; i++) {
                            (function (e) {
                                // if (data[e].compensation == 0) {
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
                                switch (data[i].compensation) {
                                    case 0:
                                        $("#backs").append("<p id='wusi'>无私回报</p>");
                                        break;
                                    case 1:
                                        $("#backs").append("<p id='youchang'>有偿回报</p>");
                                        break;
                                }

                                // }
                            })(i)
                        }
                    }
                } else if (flag == 0) {
                    alert(msg);
                }
            })
        })
    }

    function cang() {
        document.getElementById("postkind").disabled = "true";
        document.getElementById("contentk").value = "";
        document.getElementById("contentk").disabled = "true";
    }

    function chu() {
        document.getElementById("postkind").disabled = false;
        document.getElementById("contentk").value = "";
        document.getElementById("contentk").disabled = false;
    }

</script>


</html>