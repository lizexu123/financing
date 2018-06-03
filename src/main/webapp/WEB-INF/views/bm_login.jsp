<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>Sign In</title>
<link href="${ctp}/css/bmmain.css" rel="stylesheet" type="text/css">
<script src="${ctp}/js/jquery-1.11.0.min.js"></script>
<script src="${ctp}/js/bm.js"></script>

</head> 
   
 <body class="sign-in-up">
	<div id="page-wrapper" class="sign-in-wrapper">
		<div>
			<div class="sign-in-form">
				<div class="sign-in-form-top">
					<p><span>Sign In to</span> <a href="${ctp}/admin">Admin</a></p>
				</div>
				<div class="signin">
					<form id="adminLoginForm">
						<div class="log-input">
							<div class="log-input-left">
								<input type="text" name="username" class="user" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'account:';}"/>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="log-input">
							<div class="log-input-left">
								<input type="password" name="password" class="lock"  onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password:';}"/>
							</div>
							<div class="clearfix"> </div>
						</div>
						<input id="adminLoginBtn" type="button" value="Login to Admin account">
					</form>	 
				</div>
			</div>
		</div>
	</div>
		<!--footer section start-->
	<footer>
		<p>Copyright &copy; 2018.Penny&nbsp;Wendy&nbsp;CoolLi&nbsp; All rights reserved.</p>
	</footer>
        <!--footer section end-->
</body>
<script>
    $(function () {
        $("#adminLoginBtn").click(function () {

            $.ajax({
                type:'POST',
                async : false,
                url : '${ctp}/doAdminLogin',
                dataType : 'json',
                data:$("#adminLoginForm").serialize(),
                success:(function(result){
                    var flag = parseInt(result.flag);
                    var msg = result.msg;
                    if(flag == 1){
//                        alert(msg);
                        window.location.href = "${ctp}/admin";
                    } else if(flag == 0){
                        alert(msg);
                    }
                })
            })
        })
	})
</script>
</html>