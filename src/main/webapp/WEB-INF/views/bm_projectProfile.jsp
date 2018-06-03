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
    <script src="${ctp}/js/layer.js"></script>
</head>

<body>
<jsp:include page="bm_left.jsp"/>

<div class="main-content" style="max-height: 1200px;">
    <jsp:include page="bm_header.jsp"/>
    <div id="page-wrapper">
        <div class="page-wrapper-inner">
            <h3 style="font-size: 2em;color: #999;margin: 0 0 0.5em 1em;">Project profile</h3>
            <div class="project-profile"  style="margin-top: 30px;">
                <div class="panel-head">
                    <h2>Project List</h2>
                </div>
                <div class="project-table">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>ID</th>
                            <th>TITLE</th>
                            <th>USERID</th>
                            <th>CATEGORY</th>
                            <th>COVER</th>
                            <th>PUBLISH</th>
                            <th>END</th>
                            <th>GOAL</th>
                            <th>PROGRESS</th>
                            <th>SUPPORT</th>
                            <th>CONTACT</th>
                            <th class="dropdown">
                                <a href="javascript:void(0);" onclick="submenu(this)">STATUS</a>
                                <ul class="dropdown-action">
                                    <li> <a href="javascript:void(0);" onclick="getProjects()">ALL</a> </li>
                                    <li> <a href="javascript:void(0);" onclick="getProjectsByStatus(0)">UNREACHED/UNEXPIRED</a> </li>
                                    <li> <a href="javascript:void(0);" onclick="getProjectsByStatus(1)">REACHED/UNEXPIRED</a> </li>
                                    <li> <a href="javascript:void(0);" onclick="getProjectsByStatus(2)">UNREACHED/EXPIRED</a> </li>
                                    <li> <a href="javascript:void(0);" onclick="getProjectsByStatus(3)">REACHED/EXPIRED</a> </li>
                                </ul>
                            </th>
                            <th>ACTION</th>
                        </tr>
                        </thead>
                        <tbody id="projects">

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
        getProjects();
    });

    function getProjects() {
        $.ajax({
            type:'GET',
            async : false,
            url : '${ctp}/doGetProjectList',
            dataType : 'json',
            data:null,
            success:(function(result){
                var flag = parseInt(result.flag);
                var data = result.data;

                if(flag == 1) {
                    $("#projects").empty();
                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            var str = "";
                            str += "<tr>" +
                                "<th scope=\"row\">" + (i + 1) + "</th>" +
                                "<td>" + data[i].id + "</td>" +
                                "<td>" + data[i].title + "</td>" +
                                "<td>" + data[i].user.id + "</td>" +
                                "<td>" + data[i].category.name + "</td>" +
                                "<td><object data=\"" + data[i].cover + "\"></td>" +
                                "<td>" + data[i].publishTime + "</td>" +
                                "<td>" + data[i].endTime + "</td>" +
                                "<td>" + data[i].goalAmount + "</td>" +
                                "<td><meter value='" + data[i].actualAmount / data[i].goalAmount + "' low='0.3' high='0.9'/></td>" +
                                "<td>" + data[i].supportCount + "</td>" +
                                "<td>" + data[i].contactPhone + "</td>";
                            switch (data[i].status) {
                                case 0:
                                    str+= "<td>UR/UE</td>";
                                    break;
                                case 1:
                                    str+= "<td>R/UE</td>";
                                    break;
                                case 2:
                                    str+= "<td>UR/E</td>";
                                    break;
                                case 3:
                                    str+= "<td>R/E</td>";
                                    break;
                                }
                            str+="<td class=\"dropdown\">" +
                                "<a href=\"javascript:void(0);\" onclick=\"submenu(this)\">ACTION</a>" +
                                "<ul class=\"dropdown-action\">" +
                                "<li>" +
                                "<a href=\"${ctp}/browse/detail-"+data[i].id+"\" >VIEW PROJECT</a>"+
                                "</li>"+
                                "<li>" +
                                "<a href=\"javascript:void(0);\" onclick=\"viewBack('"+data[i].id+"')\">VIEW BACK</a>"+
                                "</li>"+
                                "</ul>"+
                                "</td>";
                            str+="</tr>";
                            $("#projects").append(str);
                            }
                    }
                } else if(flag == 0){
                    alert("error");
                }
            })
        })
    }

    function getProjectsByStatus(status) {
        $.ajax({
            type:'GET',
            async : false,
            url : '${ctp}/doGetProjectList',
            dataType : 'json',
            data:null,
            success:(function(result){
                var flag = parseInt(result.flag);
                var data = result.data;

                if(flag == 1) {
                    $("#projects").empty();
                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            if (data[i].status == status) {
                                var str = "";
                                str += "<tr>" +
                                    "<th scope=\"row\">" + (i + 1) + "</th>" +
                                    "<td>" + data[i].id + "</td>" +
                                    "<td>" + data[i].title + "</td>" +
                                    "<td>" + data[i].user.id + "</td>" +
                                    "<td>" + data[i].category.name + "</td>" +
                                    "<td><object data=\"" + data[i].cover + "\"></td>" +
                                    "<td>" + data[i].publishTime + "</td>" +
                                    "<td>" + data[i].endTime + "</td>" +
                                    "<td>" + data[i].goalAmount + "</td>" +
                                    "<td><meter value='" + data[i].actualAmount / data[i].goalAmount + "' low='0.3' high='0.9'/></td>" +
                                    "<td>" + data[i].supportCount + "</td>" +
                                    "<td>" + data[i].contactPhone + "</td>";
                                switch (status) {
                                    case 0:
                                        str += "<td>UR/UE</td>";
                                        break;
                                    case 1:
                                        str += "<td>R/UE</td>";
                                        break;
                                    case 2:
                                        str += "<td>UR/E</td>";
                                        break;
                                    case 3:
                                        str += "<td>R/E</td>";
                                        break;
                                }
                                str += "<td class=\"dropdown\">" +
                                    "<a href=\"javascript:void(0);\" onclick=\"submenu(this)\">ACTION</a>" +
                                    "<ul class=\"dropdown-action\">" +
                                    "<li>" +
                                    "<a href=\"${ctp}/browse/detail-"+data[i].id+"\" >VIEW PROJECT</a>"+
                                    "</li>"+
                                    "<li>" +
                                    "<a href=\"javascript:void(0);\" onclick=\"viewBack('" + data[i].id + "')\">VIEW BACK</a>" +
                                    "</li>" +
                                    "</ul>" +
                                    "</td>";
                                str += "</tr>";
                                $("#projects").append(str);
                            }
                        }
                    }
                } else if(flag == 0){
                    alert("error");
                }
            })
        })
    }

    function viewBack(id) {

        console.log(id);
        viewBackBox();
        $.ajax({
            type:'GET',
            async : false,
            url : '${ctp}/doGetBacks-'+id,
            dataType : 'json',
            data:null,
            success:(function(result){
                var flag = parseInt(result.flag);
                var data = result.data;

                if(flag == 1) {
                    $("#backs").empty();
                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            if (data[i].compensation==0) {
                                var str = "";
                                str += "<tr>" +
                                    "<th scope=\"row\">" + i + "</th>" +
                                    "<td>" + data[i].amount + "</td>" +
                                    "<td>" + data[i].content + "</td>" +
                                    "<td>" + (data[i].post==0 ? 'N':'Y') + "</td>" +
                                    "<td>" + data[i].allow + "</td>" +
                                    "<td>" + data[i].backDate + "</td>" +
                                    "<td>" + data[i].actual + "</td>";
                                str += "</tr>";
                                $("#backs").append(str);
                            }
                        }
                    }
                } else if(flag == 0){
                    alert("error");
                }
            })
        })

    }

    function viewBackBox() {
        layer.open({
            type: 1 //Page层类型
            ,area: ['700px', '500px']
            ,title: 'PROJECT PAID BACKS'
            ,offset:'100px'
            ,shade: 0.6 //遮罩透明度
            ,maxmin: true //允许全屏最小化
            ,anim: 0 //0-6的动画形式，-1不开启
            ,content:
            '<div style="padding:10px;">' +
            '<table class="table"> ' +
            '<thead> ' +
            '<tr> ' +
            '<th>#</th> ' +
            '<th>AMOUNT</th> ' +
            '<th>CONTENT</th> ' +
            '<th>POST</th> ' +
            '<th>ALLOW</th>' +
            '<th>BACKDATE</th> ' +
            '<th>ACTUAL</th>' +
            '</thead>' +
            '<tbody id="backs"></tbody>'+
            '</table>'+
            '</div>'
        });
    }

</script>
</html>
