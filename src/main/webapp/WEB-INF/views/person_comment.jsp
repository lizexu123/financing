<%--
  Created by IntelliJ IDEA.
  User: 26942
  Date: 2018/6/6
  Time: 0:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户评论页</title>
</head>
<body>
<div class="container-fluid">
    <h1 class="title center">修改个人信息</h1>
    <br/>
    <form id="formk" action="/doAddComment" method="post">
        <div class="col-sm-offset-2 col-md-offest-2">
            <!-- 表单输入 -->
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="inputContent" class="col-sm-2 col-md-2 control-label">content</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" name="content" id="inputContent" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputCreateTime" class="col-sm-2 col-md-2 control-label">createTime</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="date" name="createTime" class="form-control" id="inputCreateTime">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 col-md-2 control-label">from_user_id</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="inputPassword" name="user"
                               value="${sessionScope.user.id}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-md-2 control-label">project_id</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" name="project" id="pp" value="${data.id}">
                    </div>
                </div>
                <c:forEach varStatus="PJ" var="project" items="${data}" step="1">
                    <div class="form-group">
                        <label for="inputId" class="col-sm-2 col-md-2 control-label">to_user_id</label>
                        <div class="col-sm-6 col-md-6">
                            <input type="text" class="form-control" id="inputId" name="to_user"
                                   value="${sessionScope.user[1].id}">
                        </div>
                    </div>

                </c:forEach>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-6">
                        <button class="btn btn-lg btn-primary btn-block" type="button" onclick="modify()">确认修改</button>
                    </div>
                </div>
            </div>
            <br/>
        </div>
    </form>
</div>
<script>
    var d = result.data;
    for (var i = 0; i < d.length; i++) {
        var v1 = d[i].id;
    }
</script>

</body>
</html>
