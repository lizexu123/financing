<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>发起项目</title>
    <link href="${ctp}/css/bstp.css" rel="stylesheet">
    <link href="${ctp}/css/style.css" rel="stylesheet">
    <script src="${ctp}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <%--<script src="${cp}/js/bstp.min.js" type="text/javascript"></script>--%>
    <script src="${ctp}/js/layer.js" type="text/javascript"></script>
    <script src="${ctp}/js/projectCreate.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8"
            src="${ctp}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${ctp}/ueditor/ueditor.all.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${ctp}/ueditor/lang/zh-cn/zh-cn.js"></script>




</head>
<body>
<!-- 中间内容 -->
<div class="container-fluid" style="width:1000px;">
    <div class="row">
        <div class="col-sm-1 col-md-1"></div>
        <div class="col-sm-10 col-md-10">
            <h1>项目发布</h1>
            <hr/>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-1 col-md-1"></div>
        <div class="col-sm-5 col-md-5 detail-x">
            <form action="/doCreateProject" id="formCreate">
                <table class="table table-striped">
                <tr>
                    <th>项目标题</th>
                    <td><input type="text" name="title" id="inputTitle" class="form-control"></td>
                </tr>
                <tr>
                    <th>用户id</th>
                    <td><input type="text" name="user_id" id="inputUserId" class="form-control"
                               value="${sessionScope.user.id}"></td>
                </tr>
                    <tr>
                        <th>项目种类id</th>
                        <td><input type="text" name="category_id" id="inputCatagoryId" class="form-control"></td>
                    </tr>


                <tr>
                    <th>目标金额</th>
                    <td><input type="money" name="goal_amount" id="inputGoalAmount" class="form-control"></td>
                </tr>
                <tr>
                    <th>发布时间</th>
                    <td><input type="date" name="publish_time" id="inputPublishTime" class="form-control"></td>
                </tr>
                <tr>
                    <th>截止时间</th>
                    <td><input type="date" name="end_time" id="inputEndTime" class="form-control"></td>
                </tr>
                <tr>
                    <th>项目团队</th>
                    <td><input type="text" name="team" id="inputTeam" class="form-control"></td>
                </tr>
                <tr>
                    <th>融资目的</th>
                    <td><input type="text" name="purpose" id="inputPurpose" class="form-control"></td>
                </tr>
                <tr>
                    <th>联系人姓名</th>
                    <td><input type="text" name="contact_name" id="inputContaceName"
                               class="form-control" value="${sessionScope.user.realName}"></td>
                </tr>
                <tr>
                    <th>咨询电话</th>
                    <td><input type="text" name="hotline" id="inputhotline"
                               class="form-control"></td>
                </tr>
                <tr>
                    <th>联系人电话</th>
                    <td><input type="text" name="contact_phone" id="inputContact"
                               class="form-control" value="${sessionScope.user.mobile}"></td>
                </tr>
                    <tr>
                        <th>封面</th>
                        <td><input type="file" name="coverUpload" id="inputCover"
                                   class="form-control" ></td>
                    </tr>

            </table>

                <div id="ueditor" name="detail"  type="text/plain">
                    <%--<iframe src="ueditor/index.html"--%>
                            <%--name="ifd"--%>

                            <%--onload="this.height=ifd.document.body.scrollHeight"--%>

                            <%--width="100%" scrolling="no"--%>

                            <%--frameborder="0"/>--%>

                </div>
                <div class="col-sm-2 col-md-2 col-lg-2"></div>
                <button class="btn btn-danger btn-lg col-sm-4 col-md-4 col-lg-4"
                       id="nextPage"    type="button"  onclick="fabu()">确定发布
                    </button>
            </form>
        </div>
    </div>


                <%--<div class="row">--%>
                    <%--<div class="col-sm-1 col-md-1 col-lg-1"></div>--%>
                    <%--<button class="btn btn-danger btn-lg col-sm-4 col-md-4 col-lg-4"--%>
                            <%--onclick="addToShoppingCar(${productDetail.id})">添加购物车--%>
                    <%--</button>--%>

                <%--</div>--%>
                <%--<div class="row">--%>
                    <%--<div class="col-sm-1 col-md-1 col-lg-1"></div>--%>
                    <%--<div class="col-sm-10 col-md-10 col-lg-10">--%>
                        <%--<hr class="division"/>--%>
                        <%--<table class="table evaluationTable" border="0" id="evaluation">--%>
                        <%--</table>--%>
                        <%--<hr/>--%>
                        <%--<div id="inputArea"></div>--%>
                    <%--</div>--%>
                <%--</div>--%>






  <%--  <script type = "text/javascript" >
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
    </script>
    <script type="text/javascript" charset="UTF-8" src="${APP_PATH}/static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="UTF-8" src="${APP_PATH}/static/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="UTF-8" src="${APP_PATH}/static/ueditor/lang/zn-cn/zn-cn.js"></script>--%>

</body>
<script type="text/javascript">
    UEDITOR_CONFIG.UEDITOR_HOME_URL = '/financing/ueditor/';
    var ue = UE.getEditor('ueditor', ue_param);

    var ue_param = {//工具栏配置项
        toolbars : [ [ 'cleardoc', 'selectall', '|', 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'strikethrough', 'fontsize',
            'forecolor', 'fontfamily', 'link', '|', 'justifyleft',
            'justifycenter', 'justifyright', '|', 'horizontal',
            'pasteplain', '|', '|', 'removeformat', '|', 'charts','|','simpleupload' ]

        ],
        autoHeightEnabled : false,
        autoFloatEnabled : false,
        elementPathEnabled : false,
        relativePath : true,
        pasteplain : true,
        saveInterval : 60 * 60 * 24,
        wordCount : false,

    }

</script>
</html>