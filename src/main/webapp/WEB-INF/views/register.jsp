<%--
    Document   : register
    Created on : 2018-5-23, 10:35:11
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title> New Document </title>
    <link href="css/register.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
</head>
<body>
<form action="Register.mvc" id="f1">
    <input id="user" type="text" required pattern="^[a-zA-Z0-9]{6,12}$" placeholder="username"/>
    <br>
    <input id="phone" type="tel" placeholder="telephone" required pattern="[0-9]{11}$"/>
    <br>
    <input id="password" type="password" required pattern="^[a-zA-Z0-9]{6,12}$" placeholder="password"/>
    <br>
    <input id="sex" type="text" required pattern="[A-z]{3,6}" placeholder="sex"/>
    <br>

    <select name="province" id="param_province" onchange="provincechange(this.selectedIndex)"><option>select province</option></select>
    <select name="city" id="param_city"><option>select city</option></select>

    <table>
        <tr>
            <td>
                <input type="text"  id="input1" placeholder="validate" onchange="validate()" />
                <p id="at"></p>
            </td>
            <td>
                <input type="button" id="checkCode" class="code" style="width:100px"  onClick="createCode()"  />
                <a href="#" onClick="createCode()">看不清楚</a>
            </td>
        </tr>
    </table>
    <input id="Button1" onClick="cf()" type="button" value="submit" />
</form>


</body>
<script type="text/javascript" src="js/register.js"></script>
<script  type="text/javascript" >
    var code; //在全局 定义验证码
    function createCode() {
        code = new Array();
        var codeLength = 4;//验证码的长度
        var checkCode = document.getElementById("checkCode");
        checkCode.value = "";

        var selectChar = new Array(2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');

        for (var i = 0; i < codeLength; i++) {
            var charIndex = Math.floor(Math.random() * 32);
            code += selectChar[charIndex];
        }
        if (code.length != codeLength) {
            createCode();
        }
        checkCode.value = code;
    }

    window.onload=function(){
        createCode();
    };

    function cf(){
        validate();

        var f1 = document.getElementById("f1");
        f1.submit();
    }
</script>

</html>

