function dizhi() {
    var address = {};
    address.id = document.getElementById("inputAddressId").value;
    address.userId = document.getElementById("inputUserId").value;
    address.recipient = document.getElementById("inputRepcipient").value;
    address.zone = document.getElementById("inputZone").value;
    address.postcode = document.getElementById("inputPostCode").value;
    address.detail = document.getElementById("inputTextarea").value;
    address.phone = document.getElementById("inputPhone").value;
    var aa = /^([0-9.]+)$/;
    var bb = /^[0-9]{6}$/;

    if (address.id) {

    } else {
        layer.msg('地址id不能为空');
        return false;
    }
    if (!aa.test(address.id)) {
        layer.msg('地址id只能输入数字');
        return false;
    }

    if (address.userId) {

    } else {
        layer.msg('用户Id不能为空');
        return false;
    }

    if (address.detail) {

    } else {
        layer.msg('描述不能为空');
        return false;
    }
    if (address.postcode) {

    } else {
        layer.msg('邮政编码不能为空');
        return false;
    }
    if (!bb.test(address.postcode)) {
        layer.msg('邮政编码只能是6位数字');
        return false;
    }

    if (address.zone) {

    } else {
        layer.msg('地址不能为空');
        return false;
    }
    if (address.phone) {

    } else {
        layer.msg('电话号码不能为空');
        return false;
    }

    if (address.recipient) {

    } else {
        layer.msg('真实姓名不能为空');
        return false;
    }

    var formData = new FormData($("#formAddress")[0]);
    $.ajax({
        type: 'POST',
        async: false,
        url: 'doAddAddress',
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

