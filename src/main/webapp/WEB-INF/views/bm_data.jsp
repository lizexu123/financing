<%--
  Created by IntelliJ IDEA.
  User: Penny
  Date: 2018/5/31
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Financing Back Manage</title>
    <link href="${ctp}/css/bmmain.css" rel="stylesheet" type="text/css">
    <script src="${ctp}/js/jquery-1.11.0.min.js"></script>
    <script src="${ctp}/js/bm.js"></script>
    <script src="${ctp}/js/echarts-all.js"></script>

</head>

<body>
<jsp:include page="bm_left.jsp"/>

<div class="main-content" style="max-height: 2000px;">
    <jsp:include page="bm_header.jsp"/>
    <div id="page-wrapper">
        <div class="page-wrapper-inner">
            <h3 style="font-size: 2em;color: #292929;margin: 0 0 0.5em 1em;">Data Analysis</h3>
            <div class="data-profile"  style="margin-top: 30px;background-color: beige">
                <div class="tab-menu">
                    <ul>
                        <li ><a class="tab-selected" href="#">Financing Statistic</a></li>
                        <li><a href="#">Category Statistic</a></li>
                        <li><a href="#">Project Statistic</a></li>
                        <li><a href="#">Order Statistic</a></li>
                    </ul>
                </div>
                <div class="tab-box">
                    <div>
                        <div id="financing-statistic" style="width: 850px;height: 450px;top: 20px"></div>
                    </div>
                    <div class="tab-hide">
                        <div  id="financing-category" style="width: 850px;height: 450px;top: 20px"></div>
                    </div>
                    <div class="tab-hide">
                        <div id="financing-project" style="width: 850px;height: 450px;top: 20px"></div>
                    </div>
                    <div class="tab-hide">
                        <div id="order-statistic" style="width: 850px;height: 450px;top: 20px"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<footer>
    <p>Copyright &copy; 2018.Penny&nbsp;Wendy&nbsp;CoolLi&nbsp; All rights reserved.</p>
</footer>
</body>
<script>
    $(document).ready(function () {
        financingStatistic();
        categoryStatistic();
        projectStatistic();
        orderStatistic();

    });
    
    function financingStatistic() {
        var dom = document.getElementById("financing-statistic");
        var chart = echarts.init(dom);
        var app = {};
        var option = {
            title : {
                text: 'Project Financing Statistics',
                subtext: 'TOP15'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['Support Number','Actual Amount']
            },
            toolbox: {
                show : true,
                feature : {
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : []
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    name : 'Support Number',

                },
                {
                    type: 'value',
                    name: 'Actual Amount',
                    min:0,
                    max:100000
                }
            ],
            series : [
                {
                    name:'Support Number',
                    type:'bar',
                    data:[],
                    markPoint : {
                        data : [
                            {type : 'max', name: 'MAX'},
                            {type : 'min', name: 'MIN'}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: 'AVERAGE'}
                        ]
                    }
                },
                {
                    name:'Actual Amount',
                    type:'bar',
                    yAxisIndex: 1,
                    data:[],
                    markPoint : {
                        data : [
                            {type : 'max', name: 'MAX'},
                            {type : 'min', name: 'MIN'}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name : 'AVERAGE'}
                        ]
                    }
                }
            ]
        };



        $.ajax({
            type: 'GET',
            url: '${ctp}/doFinancingStatisticTop',
            async : true,
            data : null,
            dataType: 'json',
            success: function(result) {
                console.log(result);
                var linNames=[];
                var linSupports=[];
                var linAmounts=[];
                $.each(result.data,function(key,values){

                    linNames.push(values.title);
                    linSupports.push(values.supportCount);
                    linAmounts.push(values.actualAmount)

                });

                chart.setOption({ //加载数据图表
                    xAxis: {
                        data: linNames
                    },
                    series: [
                        {
                            // 根据名字对应到相应的系列
                            name: 'Support Number',
                            data: linSupports
                        },
                        {
                            name:'Actual Amount',
                            data: linAmounts
                        }
                    ]
                });

                chart.setOption(option);
            }
        });
    }

    function categoryStatistic() {
        var dom = document.getElementById("financing-category");
        var chart = echarts.init(dom);
        var option = {
            title : {
                text: 'Category Statistics',
                x:'left'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'horizontal',
                show:true,
                left: '80%',
                top: 20,
                bottom: 20,
                data: []
            },
            series : [
                {
                    name:'Category',
                    type:'pie',
                    radius :'60%',
                    center: ['40%', '50%'],
                    data:[],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };



        $.ajax({
            type: 'GET',
            url: '${ctp}/doCategoryStatistic',
            async : true,
            data : null,
            dataType: 'json',
            success: function(result) {
                console.log(result);
                var linNames=[];
                var linProjects=[];

                $.each(result.data,function(key,values){

                    linNames.push(values[1]);
                    linProjects.push({name:values[1],value:values[2]});

                });
                chart.setOption({ //加载数据图表
                    legend:  {
                        data: linNames
                    },
                    series: [
                        {
                            // 根据名字对应到相应的系列
                            name: 'Category',
                            data: linProjects
                        }
                    ]
                });

                chart.setOption(option);
            }
        });
    }

    function projectStatistic() {
        var dom = document.getElementById("financing-project");
        var chart = echarts.init(dom);
        var option = {
            title : {
                text: 'Project Statistics',
                x:'left'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'horizontal',
                right: 'right',
                top: 20,
                bottom: 20,
                data: []
            },
            series : [
                {
                    name:'Project',
                    type:'pie',
                    radius :'60%',
                    center: ['50%', '50%'],
                    data:[],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };



        $.ajax({
            type: 'GET',
            url: '${ctp}/doProjectStatistic',
            async : true,
            data : null,
            dataType: 'json',
            success: function(result) {
                console.log(result);
                var linStatus=[];
                var linProjects=[];

                $.each(result.data,function(key,values){
                    var status = "";
                    switch (values[0]){
                        case 0:
                            status = "UNREACHED&UNEXPIRED";
                            break;
                        case 1:
                            status = "REACHED&UNEXPIRED";
                            break;
                        case 2:
                            status = "UNREACHED&EXPIRED";
                            break;
                        case 3:
                            status = "REACHED&EXPIRED";
                            break;
                    }
                    linStatus.push(status);
                    linProjects.push({name:status,value:values[1]});

                });
                chart.setOption({ //加载数据图表
                    legend:  {
                        data: linStatus
                    },
                    series: [
                        {
                            // 根据名字对应到相应的系列
                            name: 'Project',
                            data: linProjects
                        }
                    ]
                });

                chart.setOption(option);
            }
        });
    }

    function orderStatistic() {
        var dom = document.getElementById("order-statistic");
        var chart = echarts.init(dom);
        var app = {};
        var option = {
            title : {
                text: 'Order Statistics'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['All','Submitted','Withdrawn','Refund']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                show : true,
                feature : {
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    boundaryGap: false,
                    data : []
                }
            ],
            yAxis : [
                {
                    type : 'value',

                }
            ],
            series : [
                {
                    name:'All',
                    type:'line',
                    data:[],
                    markPoint : {
                        data : [
                            {type : 'max', name: 'MAX'},
                            {type : 'min', name: 'MIN'}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: 'AVERAGE'}
                        ]
                    }
                },
                {
                    name:'Submitted',
                    type:'line',
                    data:[],
                    markPoint : {
                        data : [
                            {type : 'max', name: 'MAX'},
                            {type : 'min', name: 'MIN'}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: 'AVERAGE'}
                        ]
                    }
                },
                {
                    name:'Withdrawn',
                    type:'line',
                    data:[],
                    markPoint : {
                        data : [
                            {type : 'max', name: 'MAX'},
                            {type : 'min', name: 'MIN'}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: 'AVERAGE'}
                        ]
                    }
                },
                {
                    name:'Refund',
                    type:'line',
                    data:[],
                    markPoint : {
                        data : [
                            {type : 'max', name: 'MAX'},
                            {type : 'min', name: 'MIN'}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: 'AVERAGE'}
                        ]
                    }
                }
            ]
        };



        $.ajax({
            type: 'GET',
            url: '${ctp}/doOrderStatistic',
            async : true,
            data : null,
            dataType: 'json',
            success: function(result) {
                console.log(result);
                var linDate=[];
                var linAllCount=[];
                var linSubmittedCount=[];
                var linWithdrawnCount=[];
                var linRefundCount=[];
                $.each(result.data,function(key,values){

                    linDate.push(values.date);

                    var count = 0;

                    $.each(values.data,function (key,value) {
                        count+=value.count;

                        switch (value.status){
                            case 0:
                                linSubmittedCount.push(value.count);
                                break;
                            case -1:
                                linWithdrawnCount.push(value.count);
                                break;
                            case -2:
                                linRefundCount.push(value.count);
                                break;
                        }

                    });
                    linAllCount.push(count);



                });
                //柱形图赋值
                chart.setOption({ //加载数据图表
                    xAxis: {
                        data: linDate
                    },
                    series: [
                        {
                            // 根据名字对应到相应的系列
                            name: 'All',
                            data: linAllCount
                        },
                        {
                            name:'Submitted',
                            data: linSubmittedCount
                        },
                        {
                            name:'Withdrawn',
                            data: linWithdrawnCount
                        },
                        {
                            name:'Refund',
                            data: linRefundCount
                        }
                    ]
                });

                chart.setOption(option);
            }
        });
    }

</script>
</html>
