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
        #tbody {
            position: relative;
            top: 250px;
        }

        #tbody tr td {
            padding-right: 10px;
        }

        a {
            text-decoration: none;
        }


    </style>
</head>
<body class="personal">

<div class="wrap">
    <jsp:include page="person_left.jsp"/>
    <%--<p id="increase"><a href="javascript:void(0)" onclick="addBox()">添加回报</a></p>--%>


    <div id="projectList">
        <table id="tbody">

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
                $("#tbody").append('<th>id</th><th>projectEditor</th><th>publishTime</th><th>endTime</th><th>percentage</th><th>contactName</th>');
                for (var i = 0; i < d.length; i++) {
                    if ($("#tbody tr").length <= d.length) {
                        var a = (d[i]["actualAmount"] / d[i]["goalAmount"]) * 100 + "";
                        a = a.substring(0, 2) + "%";
                        $("#tbody").append(
                            "<tr>" +
                            "<td>" + d[i]["id"] + "</td>" +
                            "<td><a href='doProjectInfo-" + d[i]["id"] + "'>projectEditor</a></td>" +
                            "<td>" + d[i]["publishTime"] + "</td>" +
                            "<td>" + d[i]["endTime"] + "</td>" +
                            "<td>" + a + "</td>" +
                            "<td>" + d[i]["contactName"] + "</td>" +
                            "</tr>");

                    } else {
                        layer.msg("拿不到数据");
                    }

                }
            }
        }
    });

</script>


</html>