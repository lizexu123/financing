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
    project.hotline = document.getElementById("inputhotline").value;
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
    var formData = new FormData($("#createForm")[0]);
    $.ajax({
        type: 'POST',
        async: false,
        url: 'doCreateProject',
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






