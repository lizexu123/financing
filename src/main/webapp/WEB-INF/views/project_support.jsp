<%--
  Created by IntelliJ IDEA.
  User: 26942
  Date: 2018/6/9
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>support</title>
    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <link rel="stylesheet" href="${ctp}/css/project_show.css" type="text/css"/>
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="${ctp}/js/layer.js"></script>
</head>
<style type="text/css">
    #grzxOuterBox {
        background-color: #f5f6f8;
        padding-top: 30px;
        height: 600px;
    }

    #zhifuInnerBox {
        background-color: white;
        height: 75%;
        width: 60%;
        margin-top: 100px;
    }

    #tjdd {
        height: 80%;
        border-color: gray;
        width: 70%;
    }

    ._title.l {
        position: relative;
        left: -250px;
        padding-top: 10px;
        margin-top: 10px;
    }

    .form-control {
        position: relative;

        left: -200px;

        top: 25px;
    }

    #tjdd:hover {
        margin-top: 0;
        border-color: #50abf2;
        border: 4px solid #50abf2;
        margin-top: 4px;
    }

    #biaoqian {
        padding-top: 40px;
        padding-left: 80px;
    }

    #ssp {
        position: relative;
        left: -200px;
        top: 25px;
    }

    #me {
        position: relative;
        top: 20px;
        left: -240px;
    }

    #addr {
        position: relative;
        top: 20px;
        left: -215px;
    }

    #kk {
        position: relative;
        top: 20px;
        left: -180px;
    }

    #inputStatus {
        position: relative;
        top: 20px;
        left: -200px;
    }

    #huibao {
        position: relative;
        left: -160px;
        top: 20px;
    }
</style>
<body>
<jsp:include page="header.jsp"/>
<div id="grzxOuterBox">
    <div id="zhifuInnerBox">
        <h3 id="biaoqian">please select the support item</h3>
        <div id="tjdd">
            <div class="r right_content">
                <div class="common minheight800">
                    <form action="/doAddOrder" id="formOrder" enctype="multipart/form-data">
                        <div class="user_info fix">
                            <ul class="user_info_ul">
                                <li class="fix">
                                    <p class="_title l">address</p>
                                    <p class="l">
                                        <span id="me">：</span><select id="addr" name="address"></select>
                                    </p>
                                    <div style="clear: both"></div>
                                </li>
                                <%--<li class="fix">--%>
                                <%--<p class="_title l">project_id</p>--%>
                                <%--<p class="l">--%>
                                <input type="text" class="form-control" id="inputRepcipient" name="project"
                                       value="${data.id}" style="display: none"/>
                                <%--</p>--%>
                                <%--<div style="clear: both"></div>--%>
                                <%--</li>--%>
                                <%--<div style="clear: both"></div>--%>
                                <%--<li class="fix">--%>
                                <%--<p class="_title l">user_id</p>--%>
                                <%--<p class="l">--%>
                                <input type="text" class="form-control" id="inputUserid" name="user"
                                       value="${sessionScope.user.id}" style="display: none">
                                <%--</p>--%>
                                <%--<div style="clear: both"></div>--%>
                                <%--</li>--%>
                                <li class="fix">
                                    <p class="_title l">project_back_id</p>
                                    <p class="l">
                                        <span id="kk">：</span><select id="huibao" name="project_back"></select>
                                    </p>
                                    <div style="clear: both"></div>
                                </li>
                                <li class="fix">
                                    <p class="_title l">status</p>
                                    <p class="l">
                                        <input type="text" id="inputStatus" name="status" value="${data.status}">

                                    </p>
                                    <div style="clear: both"></div>
                                </li>
                                <li class="user_info_img fix">
                                    <p class="_title l">amount</p>
                                    <div class="l _img">
                                        <div class="am-form-group am-form-file">
                                            <input type="number" name="amount" id="inputGoalAmount"
                                                   class="form-control">
                                        </div>
                                    </div>
                                    <div style="clear: both"></div>
                                </li>
                            </ul>
                            <div class="tc">
                                <input type="button" class="button" onclick="zhichi()" id="ssp" value="support">
                                </input>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
</div>

</body>
<script>

    $(document).ready(function () {
        $.ajax({
            type: 'Get',
            async: true,
            url: '${ctp}/doGetAddress',
            dataType: 'json',
            data: null,
            success: (function (result) {
                var flag = parseInt(result.flag);
                var msg = result.msg;
                var data = result.data;
                if (flag == 1) {
                    if (data.length > 0) {
                        var drillSelect = document.getElementById("addr");
                        drillSelect.options.length = 0;
                        $("#addr").append("<option value=''>--请选择--</option>");
                        for (var i = 0; i < data.length; i++) {
                            $("#addr").append("<option value='" + data[i].id + "'>" + data[i].zone + data[i].detail + "</option>");
                        }
                    }
                }
                else if (flag == 0) {
                    alert(msg);
                }
            })
        })
    })

    function cang() {
        document.getElementById("")
    }

    $.ajax({//调用ajax后台数据异步方法
        //提交的方式
        type: "get",
        async: false,
        //数据的传送页面：要启动界面的地址/界面的后台的方法
        url: "${ctp}/doGetBacks-${data.id}",

        // contentType:false,
        //重要的后台的回调函数（很重要）
        success: function (result) {
            console.log(result.data);
            if (result.flag == 1) {
                console.log(result.flag);
                // var d = eval('(' + result.data+ ')');
                var d = result.data;
                console.log(d);
                $("#huibao").append("<option value=''>--请选择--</option>");
                for (var i = 0; i < d.length; i++) {
                    console.log("length=" + d.length);
                    console.log(d[i].compensation);
                    if (d[i].compensation == 0) {
                        $("#huibao").append("<option value='" + d[i].id + "'>" + "无私回报" + "</option>");
                    }
                    if (d[i].compensation == 1) {
                        $("#huibao").append("<option value='" + d[i].id + "'>" + "有偿回报" + "</option>");
                    }

                }
            } else {
                layer.msg("拿不到数据");
            }

        }
    });

    function zhichi() {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "${ctp}/doAddOrder",//url
            data: $('#formOrder').serialize(),
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                if (result.flag == 1) {
                    layer.msg("add success");
                } else {
                    layer.msg(result.msg);
                }

            }
        });
    }


</script>
</html>
