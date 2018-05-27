function modify() {
    var user = {};
    user.userName = document.getElementById("inputUserName").value;
    user.email = document.getElementById("inputEmail").value;
    user.password = document.getElementById("inputPassword").value;
    user.mobile = document.getElementById("inputPhoneNumber").value;
    user.zone = document.getElementById("inputAddress").value;
    user.intro = document.getElementById("inputInformation").value;
    user.ic = document.getElementById("inputId").value;
    user.realName = document.getElementById("inputRealName").value;
    var aa = /^[a-zA-Z0-9]{6,12}$/;
    var bb = /^[a-z0-9]{18}$/;
    if (user.userName) {

    } else {
        layer.msg('用户名不能为空');
        return false;
    }
    if (user.userName.length >= 15) {
        layer.msg('用户名要小于等于15位');
        return false;
    }
    if (user.password) {

    } else {
        layer.msg('密码不能为空');
        return false;
    }
    if (!aa.test(user.password)) {
        layer.msg("密码只能是英文或数字，长度6到12位");
        return false;
    }
    if (user.email) {

    } else {
        layer.msg('邮箱不能为空');
        return false;
    }
    if (user.intro) {

    } else {
        layer.msg('个人简介不能为空');
        return false;
    }
    if (user.zone) {

    } else {
        layer.msg('地址不能为空');
        return false;
    }
    if (user.ic) {

    } else {
        layer.msg('身份证不能为空');
        return false;
    }
    if (!bb.test(user.ic)) {
        layer.msg('身份证只能是18位');
        return false;
    }
    if (user.realName) {

    } else {
        layer.msg('真实姓名不能为空');
        return false;
    }


    var formData = new FormData($("#formInfo")[0]);
    $.ajax({
        type: 'POST',
        async: false,
        url: 'doModifyUserInfo',
        dataType: 'json',
        contentType: false,
        processData: false,
        data: formData,
        success: (function (result) {
            if (result.flag == 1) {
                layer.msg("修改成功");
            } else {
                layer.msg("修改失败");
            }
        })
    })
}

function JudgeUserName() {
    var realName = document.getElementById("inputRealName").value;
    var ic = document.getElementById("inputId").value;
    console.log(realName);
    $.ajax({//调用ajax后台数据异步方法
        //提交的方式
        type: "Post",
        async: false,
        //数据的传送页面：要启动界面的地址/界面的后台的方法
        url: "doCertificate",
        // contentType:false,
        data: {
            "realName": realName,
            "ic": ic,
        },
        //传到服务器的参数类型
        dataType: "json",
        //重要的后台的回调函数（很重要）
        success: function (result) {
            if (result.flag == 1) {
                layer.msg("身份证正确");
            } else {
                layer.msg("身份证不正确");
            }
        },
    });
}



