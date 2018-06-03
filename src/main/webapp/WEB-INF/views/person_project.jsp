<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <link href="${ctp}/css/style.css" rel="stylesheet">

</head>
<body>
<div class="row">
    <div class="col-sm-1 col-md-1"></div>
    <div class="col-sm-5 col-md-5 detail-x">

            <table class="table table-striped" id="tbody" style="width:1250px">

            </table>

    </div>
</div>
</body>
<script type="text/javascript">
    function timestampToTime(timestamp) {
        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        Y = date.getFullYear() + '-';
        M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        D = date.getDate() + ' ';
        h = date.getHours() + ':';
        m = date.getMinutes() + ':';
        s = date.getSeconds();
        return Y+M+D+h+m+s;
    }
    // //获取项目总数的ajax
    // $.ajax({//调用ajax后台数据异步方法
    //     //提交的方式
    //     type: "get",
    //     async: false,
    //     //数据的传送页面：要启动界面的地址/界面的后台的方法
    //     url: "doProjectByUser",
    //     // contentType:false,
    //     //重要的后台的回调函数（很重要）
    //     success: function (result) {
    //         if (result.flag == 1) {
    //             document.getElementById("inputSum").value = result.data;
    //         } else {
    //             layer.msg("拿不到数据");
    //         }
    //     },
    // });

    $.ajax({//调用ajax后台数据异步方法
        //提交的方式
        type: "get",
        async: false,
        //数据的传送页面：要启动界面的地址/界面的后台的方法
        url: "/financing/doProjectByUser",
        // contentType:false,
        //重要的后台的回调函数（很重要）
        success: function (result) {
            console.log(result.data);
            if (result.flag == 1) {
                console.log(result.flag);
                // var d = eval('(' + result.data+ ')');
                var d = result.data;
                $("#tbody").append('<th>标题</th><th>项目种类</th><th>目标金额</th><th>发布时间</th><th>截止时间</th><th>项目团队</th><th>融资目的</th><th>联系人姓名</th><th>咨询电话</th><th>联系电话</th><th>项目信息</th>');
                for (var i = 0; i < d.length; i++) {
                    if ($("#tbody tr").length <= d.length) {

                        $("#tbody").append(
                            "<tr>" +
                            "<td>" + d[i]["title"] + "</td>" +
                            "<td>" + d[i]["category"].name + "</td>" +
                            "<td>" + d[i]["goalAmount"] + "</td>" +
                            "<td>" + timestampToTime(d[i]["publishTime"])+ "</td>" +
                            "<td>"+ timestampToTime(d[i]["endTime"])+"</td>" +
                            "<td>"+d[i]["team"]+"</td>" +
                            "<td>"+d[i]["purpose"]+"</td>" +
                            "<td>"+d[i]["contactName"]+"</td>" +
                            "<td>"+d[i]["hotline"]+"</td>" +
                            "<td>"+d[i]["contactPhone"]+"</td>" +
                            "<td><a href='doProjectInfo-"+d[i]["id"]+"'>项目信息</a></td>" +
                            "</tr>");
                    } else {
                        layer.msg("拿不到数据");
                    }

                }
            }
        }
    });
    // $.ajax({//调用ajax后台数据异步方法
    //     //提交的方式
    //     type: "get",
    //     async: false,
    //     //数据的传送页面：要启动界面的地址/界面的后台的方法
    //     url: "doNewProjectTo",
    //     // contentType:false,
    //     //重要的后台的回调函数（很重要）
    //     success: function (result) {
    //         if (result.flag == 1) {
    //         } else {
    //             layer.msg("拿不到数据");
    //         }
    //     },
    // });

</script>
</html>