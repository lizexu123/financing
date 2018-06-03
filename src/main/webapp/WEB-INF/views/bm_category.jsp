<%--
  Created by IntelliJ IDEA.
  User: Penny
  Date: 2018/5/31
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Financing Back Manage</title>
    <link href="${ctp}/css/bmmain.css" rel="stylesheet" type="text/css">
    <script src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script src="${ctp}/js/bm.js"></script>

</head>

<body>
<jsp:include page="bm_left.jsp"/>

<div class="main-content" style="max-height: 1200px;">
    <jsp:include page="bm_header.jsp"/>
    <div id="page-wrapper">
        <div class="page-wrapper-inner">
            <h3 style="font-size: 2em;color: #999;margin: 0 0 0.5em 1em;">Project Category</h3>
            <div class="category-profile"  style="margin-top: 30px;">
                <div style="height: 60px">
                    <div class="category-add">
                        <a href="javascript:void(0)" onclick="addCategoryBox()"><img src="${ctp}/image/admin/add.png"></a>
                    </div>
                    <div class="category-add-form">
                        <h3 style="font-size: 1.5em;color: #999;margin: 0 auto; text-align: center">Add Category</h3>
                        <form id="addCategoryForm">
                            <input name="name" type="text" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'category name:';}"/>
                            <input id="addCategoryBtn" type="button" value="add new category">
                        </form>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="panel-head">
                    <h2>Category List</h2>
                </div>
                <div class="category-table">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>ID</th>
                            <th>NAME</th>
                            <th>NUMBER of PROJECT</th>
                        </tr>
                        </thead>
                        <tbody id="categories">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<footer>
    <p>Copyright &copy; 2018.Penny&nbsp;Wendy&nbsp;CoolLi&nbsp; All rights reserved.</p>
</footer>
</body>
<script>
    $(document).ready(function () {
        getCategoryStatistic();

        $("#addCategoryBtn").click(function () {
            $.ajax({
                type:'GET',
                async : false,
                url : '${ctp}/doAddCategory',
                dataType : 'json',
                data:$("#addCategoryForm").serialize(),
                success:(function(result) {
                    var flag = parseInt(result.flag);
                    var msg = result.msg;
                    if(flag==1){
                        alert(msg);
                    }else {
                        alert(msg);
                    }
                })
            });

            getCategoryStatistic();
        })
    });
    function getCategoryStatistic() {
        $.ajax({
            type:'GET',
            async : false,
            url : '${ctp}/doCategoryStatistic',
            dataType : 'json',
            data:null,
            success:(function(result){
                var flag = parseInt(result.flag);
                var data = result.data;

                if(flag == 1) {
                    $("#categories").empty();
                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            var str = "";
                            str+="<tr>"+
                                "<th scope=\"row\">"+(i+1)+"</th> " +
                                "<td>"+data[i][0]+"</td> " +
                                "<td>"+data[i][1]+"</td> " +
                                "<td>"+data[i][2]+"</td>"
                            $("#categories").append(str);
                        }
                    }
                } else if(flag == 0){
                    alert("error");
                }
            })
        })
    }
</script>
</html>
