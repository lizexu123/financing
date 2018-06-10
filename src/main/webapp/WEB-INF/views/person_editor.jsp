<%--
  Created by IntelliJ IDEA.
  User: 26942
  Date: 2018/6/8
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>项目编辑</title>
    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <style type="text/css">
        #gengxin1 {
            position: relative;
            top: 150px;
            left: 80px;
        }
    </style>
</head>
<body class="personal">

<div class="wrap">
    <jsp:include page="person_left.jsp"/>
    <div class="r right_content">
        <div class="common minheight800">
            <form action="/doAddUpdate" id="formCreate" type="post">

                <table id="table">
                    <tr>
                        <th>projectId</th>
                        <td><input type="text" name="project" value="${data.id}" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th>userId:</th>
                        <td><input type="text" value="${sessionScope.user.id}" readonly/></td>
                    </tr>
                    <tr>
                        <th>content:</th>
                        <td><input type="text" name="update_content"/></td>
                    </tr>
                    <tr>
                        <input type="button" class="button" id="gengxin1" value="update" onclick="update()"/>
                    </tr>

                </table>
            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    function update() {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "${ctp}/doAddUpdate",//url
            data: $('#formCreate').serialize(),
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                if (result.flag == 1) {
                    window.location.href = "${ctp}/doProjectDetail-${data.id}";
                } else {
                    layer.msg(result.msg);
                }
            }
        });
    }
</script>
</html>
