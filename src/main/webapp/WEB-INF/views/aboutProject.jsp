<%--
  Created by IntelliJ IDEA.
  User: Wendy
  Date: 2018/5/23
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>AboutProject(各种数量)</title>
    <script type="text/javascript">
        $(window).load(
            function getCount() {
                $.ajax({
                    type: 'GET',
                    async: false,
                    cache: false,
                    url: 'doProjectCount',
                    dataType: 'JSON',
                    data: {},
                    success: (function (result) {
                        var data = result.data;
                        if (result.flag == 1) {
                            console.log(result);
                            document.getElementById("pjPosted").innerHTML = data;
                        } else {
                            console.log("沒有值");
                        }
                    })
                });
            }

        )
    </script>
</head>
<body>
<div class="aboutProject" id="about">
    <div class="showMember" id="pricing">
        <div class="Center">
            <span class="AboutObject">Total Number of</span>
            <div class="members">
                <ul>
                    <li>
                        <div class="numOMember">
                            <h5>First</h5>
                        </div>
                        <div class="nameOMember">
                            <h2>Projects Posted</h2>
                        </div>
                        <div class="amountOMember">
                            <h2 id="pjPosted"></h2>
                            <%--<c:out value="${requestScope.get(['data'])}"></c:out>--%>
                        </div>
                        <div class="bigNumOMember">
                            <h5>First</h5>
                        </div>
                    </li>
                </ul>
                <ul>
                    <li>
                        <div class="numOMember">
                            <h5>Second</h5>
                        </div>
                        <div class="nameOMember" id="backers">
                            <h2>Backers</h2>
                        </div>
                        <div class="amountOMember">
                            <h2>amountOMember width</h2>
                        </div>
                        <div class="bigNumOMember">
                            <h5>Second</h5>
                        </div>
                    </li>
                </ul>
                <ul>
                    <li>
                        <div class="numOMember">
                            <h5>Third</h5>
                        </div>
                        <div class="nameOMember">
                            <h2>Projects Completed</h2>
                        </div>
                        <div class="amountOMember">
                            <h2>amountOMember width</h2>
                        </div>
                        <div class="bigNumOMember">
                            <h5>Third</h5>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>
