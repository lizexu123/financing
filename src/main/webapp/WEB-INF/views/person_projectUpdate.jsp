<%--
  Created by IntelliJ IDEA.
  User: 26942
  Date: 2018/6/7
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ProjectUpdate</title>
</head>
<body>
<h1>projectUpdate</h1>
<form action="/doAddUpdate" id="formCreate" type="post">
    <table id="table">
        <tr>
            <th>项目id</th>
            <td><input type="text" name="project" value="${data.id}" readonly style="display: none"/>
            </td>
        </tr>
        <tr>
            <th>用户id:</th>
            <td><input type="text" value="${sessionScope.user.id}" readonly/></td>
        </tr>
        <tr>
            <th>更新内容</th>
            <td><input type="text" name="update_content"/></td>
        </tr>
        <tr>
            <input type="button" id="gengxin1" value="立即更新" onclick="gengxin()"></input>
        </tr>

    </table>
</form>

</body>
</html>
