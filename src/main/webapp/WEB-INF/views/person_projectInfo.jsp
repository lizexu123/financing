<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/6/2
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <%--<script src="${cp}/js/bstp.min.js" type="text/javascript"></script>--%>
    <script src="js/layer.js" type="text/javascript"></script>
    <title>项目更新</title>
    <style type="text/css">
        body{
            font-family: 幼圆
        }
        #table {
            text-align: center;
            font-size: 200%;
            margin: 0 auto;
            margin-top: 10%;
        }

        #table td {
            border: 2px solid #000;
        }
        #table input
        {
            height: 40px;
            width: 300px;
            font-size: 30px;
        }
        #table tr td {
            border: 2px solid #000;
        }

        #gengxin1 {
            position: relative;
            top: 450px;
            left: 750px;
            cursor: pointer;
            color: #fff;
            background-color: #d9534f;
            border-color: #d43f3a;
            padding: 10px 16px;
            width: 400px;
        }
    </style>
</head>
<body>
<h1>项目信息</h1>
<form action="/doAddUpdate" id="formCreate" type="post">
                <table id="table">
                    <tr>
                        <th>项目id</th>
                        <td><input type="text" name="project" value="${data.id}" readonly/>
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
<script type="text/javascript">
    function gengxin() {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "doAddUpdate",//url
            data: $('#formCreate').serialize(),
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                if (result.flag == 1) {
                    window.location.href = "${ctp}/financing/doProjectDetail-${data.id}";
                } else {
                    layer.msg(result.msg);
                }
            }
        });
    }

</script>
</html>
