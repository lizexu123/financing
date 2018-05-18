<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8"/>
    <title>November</title>
    <link rel="stylesheet" href="${ctp}/css/main.css" type="text/css"/>
    <script type="text/javascript" src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="${ctp}/js/jquery.sudoSlider.min.js"></script>
    <script type="text/javascript" src="${ctp}/js/globals.js"></script>
</head>
<body class="loaded">
    <div class="DesignHolder">
        <div class="LayoutFrame">
            <header>
                <div class="Center">
                    <div class="site-logo">
                        <h1><a href="#">No<span>vem</span>ber</a></h1>
                    </div>
                    <!-- \\ Begin Navigation \\ -->
                    <nav class="Navigation">
                        <ul>
                            <li class="active">
                                <a href="#home">Home</a>
                                <span class="menu-item-bg"></span>
                            </li>
                            <li>
                                <a href="#about">About</a>
                                <span class="menu-item-bg"></span>
                            </li>
                            <li>
                                <a href="#services">Services</a>
                                <span class="menu-item-bg"></span>
                            </li>
                            <li>
                                <a href="#pricing">Pricing</a>
                                <span class="menu-item-bg"></span>
                            </li>
                            <li>
                                <a href="#contact">Contact</a>
                                <span class="menu-item-bg"></span>
                            </li>
                        </ul>
                    </nav>
                    <div class="clear"></div>
                </div>
            </header>
            <div id="Container">
                <!--装载显示数据-->
                <div class="About_sec" id="about">
                    <div class="showMember" id="pricing">
                        <div class="Center">
                            <span class="AboutObject">Total Number of</span>
                            <div class="members">
                                <ul>
                                    <li>
                                        <div class="Basic">
                                            <h5>First</h5>
                                        </div>
                                        <div class="Dollar">
                                            <h2>Projects Posted</h2>
                                        </div>
                                        <div class="Band">
                                            <h2>Band width</h2>
                                        </div>
                                        <div class="Order">
                                            <h5>First</h5>
                                        </div>
                                    </li>
                                </ul>
                                <ul>
                                    <li>
                                        <div class="Basic">
                                            <h5>Second</h5>
                                        </div>
                                        <div class="Dollar">
                                            <h2>Backers</h2>
                                        </div>
                                        <div class="Band">
                                            <h2>Band width</h2>
                                        </div>
                                        <div class="Order">
                                            <h5>Second</h5>
                                        </div>
                                    </li>
                                </ul>
                                <ul>
                                    <li>
                                        <div class="Basic">
                                            <h5>Third</h5>
                                        </div>
                                        <div class="Dollar">
                                            <h2>Projects Completed</h2>
                                        </div>
                                        <div class="Band">
                                            <h2>Band width</h2>
                                        </div>
                                        <div class="Order">
                                            <h5>Third</h5>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer-link">
                    <p>Copyright © 2018 Fund-Raising</p>
                    <p>Designer : Penny Wendy CoolLi</p>
                    <p>NIIT Project</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
