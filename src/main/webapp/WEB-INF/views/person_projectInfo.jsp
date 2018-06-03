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
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <%--<script src="${cp}/js/bstp.min.js" type="text/javascript"></script>--%>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
    <script src="${ctp}/js/projectCreate.js" type="text/javascript"></script>
    <title>项目详情</title>
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
    </style>
</head>
<body>
            <h1>项目详情</h1>

            <form action="/doCreateProject" id="formCreate">
                <table id="table">
                    <tr>
                        <th>项目id</th>
                        <td><input type="text"  value="${data.id}" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th>项目标题</th>
                        <td><input type="text"   value="${data.title}"  readonly  /></td>
                    </tr>
                    <tr>
                        <th>项目种类id</th>
                        <td><input type="text"   value="${data.category.id}"  readonly  /></td>
                    </tr>
                    <tr>
                        <th>目标金额</th>
                        <td><input type="text"   value="${data.goalAmount}"  readonly  /></td>
                    </tr>
                    <tr>
                        <th>发布时间</th>
                        <td><input type="text"   value="${data.publishTime}"  readonly  /></td>
                    </tr>
                    <tr>
                        <th>截止时间</th>
                        <td><input type="text"   value="${data.endTime}"  readonly  /></td>
                    </tr>
                    <tr>
                        <th>项目团队</th>
                        <td><input type="text"   value="${data.team}"  readonly  /></td>
                    </tr>
                    <tr>
                        <th>融资目的</th>
                        <td><input type="text"   value="${data.purpose}"  readonly  /></td>
                    </tr>
                    <tr>
                        <th>联系人姓名</th>
                        <td><input type="text"   value="${data.contactName}"  readonly  /></td>
                    </tr>
                    <tr>
                        <th>咨询电话</th>
                        <td><input type="text"   value="${data.hotline}"  readonly  /></td>
                    </tr>
                    <tr>
                        <th>联系人电话</th>
                        <td><input type="text"   value="${data.contactPhone}"  readonly  /></td>
                    </tr>

                </table>
            </form>
</body>
<script type="text/javascript">

</script>
</html>
