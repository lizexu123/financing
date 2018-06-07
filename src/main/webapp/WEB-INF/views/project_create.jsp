<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>发布项目</title>
    <link rel="stylesheet" href="${ctp}/css/pc.css">
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${ctp}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${ctp}/ueditor/ueditor.all.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${ctp}/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
</head>
<body class="personal">
<div class="wrap">
    <jsp:include page="person_left.jsp"/>
    <div class="r right_content">
        <div class="common minheight800">
            <form action="/doCreateProject" id="createForm" enctype="multipart/form-data">
                <div class="common_title fix">
                    <span class="l">Personal Information:${sessionScope.user.id} 欢迎您！</span>
                    <a href="#" class="complete r"></a>
                </div>
                <div class="user_info fix">
                    <ul class="user_info_ul">
                        <li class="fix">
                            <p class="_title l">title</p>
                            <p class="l">
                                <input type="text" name="title" id="inputTitle" class="form-control">
                            </p>
                            <div style="clear: both"></div>
                        <li class="fix">
                            <p class="_title l">Contact_name</p>
                            <p class="l">
                                <input type="text" name="contact_name" id="inputContaceName"
                                       class="form-control">
                            </p>
                            <div style="clear: both"></div>
                        </li>
                        <div style="clear: both"></div>
                        <li class="fix">
                            <p class="_title l">Contact_phone</p>
                            <p class="l">
                                <input type="text" name="contact_phone" id="inputContact"
                                       class="form-control">
                            </p>
                            <div style="clear: both"></div>
                        </li>
                        <li class="fix">
                            <p class="_title l">category</p>
                            <p class="l">
                                ：<select id="category" name="category_id"></select>
                            </p>
                            <div style="clear: both"></div>
                        </li>
                        <li class="fix">
                            <p class="_title l">hotline</p>
                            <p class="l">
                                <input type="text" name="hotline" id="inputhotline"
                                       class="form-control">
                            </p>
                            <div style="clear: both"></div>
                        </li>
                        <li class="user_info_img fix">
                            <p class="_title l">cover</p>
                            <div class="l _img">
                                <img src="${ctp}/image/personal_index_img.png" alt="">
                                <div class="am-form-group am-form-file">
                                    <input type="file" name="coverUpload" id="inputCover"
                                           class="form-control">
                                </div>
                            </div>
                            <div style="clear: both"></div>
                        </li>
                        <li class="fix">
                            <p class="_title l">goal_amount</p>
                            <p class="l">
                                <input type="number" name="goal_amount" id="inputGoalAmount" class="form-control">
                            </p>
                            <div style="clear: both"></div>
                        </li>

                        <li class="fix">
                            <p class="_title l">endTime</p>
                            <p class="l">
                                <input type="date" name="end_time" id="inputEndTime" class="form-control"></p>
                            <div style="clear: both"></div>
                        </li>


                        <li class="fix">
                            <p class="_title l">team</p>
                            <p class="l">
                                <input type="text" name="team" id="inputTeam" class="form-control"></p>
                            <div style="clear: both"></div>
                        </li>
                        <li class="fix">
                            <p class="_title l">purpose</p>
                            <p class="l">
                                <textarea name="purpose" id="inputPurpose"></textarea>
                            </p>
                            <div style="clear: both"></div>
                        </li>
                    </ul>
                    项目详情：
                    <div id="dpeditor" type="text/plain" name="detail"
                         style="width: 800px; height: 400px;">
                    </div>
                    <div class="tc">
                        <button type="button" class="button" onclick="fabu()">确定发布
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


</body>
<script type="text/javascript">

    var ue_param = {//工具栏配置项
        toolbars: [['cleardoc', 'selectall', '|', 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'strikethrough', 'fontsize',
            'forecolor', 'fontfamily', 'link', '|', 'justifyleft',
            'justifycenter', 'justifyright', '|', 'horizontal',
            'pasteplain', '|', '|', 'removeformat', '|', 'charts', '|', 'simpleupload']

        ],
        autoHeightEnabled: false,
        autoFloatEnabled: false,
        elementPathEnabled: false,
        relativePath: true,
        pasteplain: true,
        saveInterval: 60 * 60 * 24,
        wordCount: false,

    }
    var ue1 = UE.getEditor('dpeditor', ue_param);
    //    ue1.ready(function() {
    //        var temp = $('.temp_n1').html();
    //        ue1.setContent(temp);//回显
    //    });

    function fabu() {
        var project = {};
        project.title = document.getElementById("inputTitle").value;
        project.goal_amount = document.getElementById("inputGoalAmount").value;
        project.end_time = document.getElementById("inputEndTime").value;
        project.team = document.getElementById("inputTeam").value;
        project.purpose = document.getElementById("inputPurpose").value;
        project.contact_name = document.getElementById("inputContaceName").value;
        project.hotline = document.getElementById("inputhotline").value;
        project.contact_phone = document.getElementById("inputContact").value;
        if (project.title) {

        } else {
            layer.msg("项目标题不能为空");
            return false;
        }

        if (project.goal_amount) {

        } else {
            layer.msg("目标金额不能为空");
            return false;
        }
        if (project.end_time) {

        } else {
            layer.msg("结束时间不能为空");
            return false;
        }
        if (project.team) {

        } else {
            layer.msg("项目团队不能为空");
            return false;
        }
        if (project.purpose) {

        } else {
            layer.msg("融资目的不能为空");
            return false;
        }
        if (project.contact_name) {

        } else {
            layer.msg("联系人姓名不能为空");
            return false;
        }
        if (project.hotline) {

        } else {
            layer.msg("咨询电话不能为空");
            return false;
        }
        if (project.contact_phone) {

        } else {
            layer.msg("联系人电话不能为空");
            return false;
        }
        window.onload = function () {
            var myDate = new Date();
            if (project.end_time < myDate) {
                document.getElementById("inputStatus").value = 1;
            }
        }

        var formData = new FormData($("#createForm")[0]);
        $.ajax({
            type: 'POST',
            async: false,
            url: '${ctp}/doCreateProject',
            dataType: 'json',
            contentType: false,
            processData: false,
            data: formData,
            success: (function (result) {
                if (result.flag == 1) {
                    // document.getElementById('nextPage').addEventListener("click",showAtRight('personCenter/personProject'));
                    // top.location.href = "/personCenter/personProject";
                    window.location.href = "${ctp}/personCenter";
                } else {
                    layer.msg("发布失败");
                }
            })
        })
    }

    $(document).ready(function () {
        $.ajax({
            type: 'Get',
            async: true,
            url: '${ctp}/doShowCategory',
            dataType: 'json',
            data: null,
            success: (function (result) {
                var flag = parseInt(result.flag);
                var msg = result.msg;
                var data = result.data;

                if (flag == 1) {
                    if (data.length > 0) {
                        var drillSelect = document.getElementById("category");
                        drillSelect.options.length = 0;
                        $("#category").append("<option value=''>--请选择--</option>");
                        for (var i = 0; i < data.length; i++) {
                            $("#category").append("<option value='" + data[i].id + "'>" + data[i].name + "</option>");
                        }
                    }
                }
                else if (flag == 0) {
                    alert(msg);
                }
            })
        })
    })

</script>
</html>
