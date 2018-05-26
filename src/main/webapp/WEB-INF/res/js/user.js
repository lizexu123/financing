//var $ = function(id) {
//	return document.getElementById(id);
//}
function tiaozhuan() {
    $.ajax({
        //几个参数需要注意一下
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: "/doRegister",//url
        success: function (result) {
            console.log(result);//打印服务端返回的数据(调试用)
            if (result.flag == 1) {
                window.location.href = "login";
            } else {
                layer.msg(result.msg);
            }

        }
    });

}



