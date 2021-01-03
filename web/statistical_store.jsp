<%--
  Created by IntelliJ IDEA.
  User: 87608
  Date: 2020/12/30
  Time: 23:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品经销存  -  管理系统</title>
    <meta charset="utf-8"><link rel="icon" href="https://jscdn.com.cn/highcharts/images/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        /* css 代码  */
    </style>
    <script src="https://code.highcharts.com.cn/jquery/jquery-1.8.3.min.js"></script>
    <script src="https://code.highcharts.com.cn/highcharts/highcharts.js"></script>
    <script src="https://code.highcharts.com.cn/highcharts/modules/exporting.js"></script>
    <script src="https://code.highcharts.com.cn/highcharts/modules/data.js"></script>
    <script src="https://code.highcharts.com.cn/highcharts/modules/series-label.js"></script>
    <script src="https://code.highcharts.com.cn/highcharts/modules/oldie.js"></script>
    <script src="https://code.highcharts.com.cn/highcharts-plugins/highcharts-zh_CN.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description"/>
    <meta content="Coderthemes" name="author"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!-- App favicon -->

    <!-- jvectormap -->
    <link href="public/libs/jqvmap/jqvmap.min.css" rel="stylesheet"/>

    <!-- DataTables -->
    <link href="public/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
    <link href="public/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet"
          type="text/css"/>

    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/smalot-bootstrap-datetimepicker/2.4.4/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

    <!-- Icons css -->
    <link href="public/libs/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
    <link href="public/libs/dripicons/webfont/webfont.css" rel="stylesheet" type="text/css"/>
    <link href="public/libs/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css"/>

    <!-- App css -->
    <!-- build:css -->
    <link href="public/css/app.css" rel="stylesheet" type="text/css"/>
    <!-- endbuild -->
</head>
<body>

<header id="topnav">
    <!-- end topbar-main -->

    <div class="topbar-menu">
        <div class="container-fluid">
            <div id="navigation">
                <!-- Navigation Menu-->
                <ul class="navigation-menu">

                    <li class="has-submenu">
                        <a href="index.jsp"><i class="mdi mdi-view-dashboard"></i>主页</a>
                    </li>


                    <li class="">
                        <a href="${pageContext.request.contextPath}/ProductServlet?method=findAll"><i
                                class="mdi mdi-file-multiple"></i>基础设置</a>
                    </li>

                    <li class="">
                        <a href="${pageContext.request.contextPath}/PurchaseServlet?method=findAll"><i
                                class="mdi mdi-file-multiple"></i>采购管理</a>
                    </li>

                    <li class="">
                        <a href="${pageContext.request.contextPath}/SalesOrderServlet?method=findAll"><i
                                class="mdi mdi-file-multiple"></i>销售管理</a>
                    </li>

                    <li class="">
                        <a href="${pageContext.request.contextPath}/StatisticsServlet"><i
                                class="mdi mdi-file-multiple"></i>统计</a>
                    </li>
                </ul>
                <!-- End navigation menu -->

                <div class="clearfix"></div>
            </div> <!-- end #navigation -->
        </div> <!-- end container -->
    </div> <!-- end navbar-custom -->
</header>

<div class="wrapper">
    <div class="container-fluid">

        <div class="page-title-alt-bg"></div>
        <div class="page-title-box">
            <ol class="breadcrumb float-right">
                <li class="breadcrumb-item"><a href="javascript:void(0);">统计</a></li>
                <li class="breadcrumb-item active">统计仓库</li>
            </ol>

            <h4 class="page-title">
                <a href="statistics.jsp" >统计商品</a>
                <a href="statistical_store.jsp" >统计仓库</a>
            </h4>


            <span style="margin-left: 20px">选择统计仓库</span>
            <select id="store">
                <c:forEach items="${applicationScope.storeList}" var="store">
                    <option value="${store.storeId}">${store.storeName}（编号：${store.storeId}）</option>
                </c:forEach>
            </select>

            <span style="margin-left: 20px">选择时间</span>
            <select id="myYear"></select>

        </div>

        <div id="container" style="min-width:400px;height:400px"></div>
        <div class="message"></div>



        <script>
            //选择年份
            window.onload=function(){
                //设置年份的选择
                var myDate= new Date();
                var startYear=myDate.getFullYear()-50;//起始年份
                var endYear=myDate.getFullYear()+50;//结束年份
                var obj=document.getElementById('myYear');
                for (var i=startYear;i<=endYear;i++)
                {
                    obj.options.add(new Option(i,i));
                }
                obj.options[obj.options.length-51].selected=1;
            };


            var id = '';//选择的仓库编号
            var year="";//时间
            var t= new Date();
            year = t.getFullYear();//获取当前时间的年份

            var chart = null;
            $.getJSON('StatisticalStoreServlet?method=getStatistical&year=' + year, function (data) {

                console.log(data.warehousingNum);
                console.log(data.storeSum);
                chart = Highcharts.chart('container', {
                    title: {
                        text: '统计仓库' + year + '年每月的的入库/出库/库存/剩余容量 变化'
                    },
                    yAxis: {
                        title: {
                            text: '数量'
                        }
                    },
                    xAxis:{
                        title:{
                            text:'月份'
                        }
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'middle'
                    },
                    plotOptions: {
                        series: {
                            label: {
                                connectorAllowed: false
                            },
                            pointStart: 2010
                        }
                    },
                    series: [{
                        name: '入库数',
                        data: data.warehousingNum
                    }, {
                        name: '出库数',
                        data:  data.outOfStockNum
                    }, {
                        name: '仓库已使用容量',
                        data: data.storeSum
                    }, {
                        name: '剩余可用容量',
                        data: data.storeRemaining
                    }],
                    responsive: {
                        rules: [{
                            condition: {
                                maxWidth: 500
                            },
                            chartOptions: {
                                legend: {
                                    layout: 'horizontal',
                                    align: 'center',
                                    verticalAlign: 'bottom'
                                }
                            }
                        }]
                    }
                });
            });

            //改变仓库时获取统计
            $('#store').change(function() {
                id =$(this).val();
                var url = 'StatisticalStoreServlet?method=getStatistical&year=' + year + '&id=' + id;

                $.getJSON(url, function (data) {
                    console.log(data);
                    chart = Highcharts.chart('container', {
                        title: {
                            text: '统计仓库' + year + '年每月的的入库/出库/库存/剩余容量 变化'
                        },
                        yAxis: {
                            title: {
                                text: '数量'
                            }
                        },
                        xAxis:{
                            title:{
                                text:'月份'
                            }
                        },
                        legend: {
                            layout: 'vertical',
                            align: 'right',
                            verticalAlign: 'middle'
                        },
                        plotOptions: {
                            series: {
                                label: {
                                    connectorAllowed: false
                                },
                                pointStart: 2010
                            }
                        },
                        series: [{
                            name: '入库数',
                            data: data.warehousingNum
                        }, {
                            name: '出库数',
                            data:  data.outOfStockNum
                        }, {
                            name: '仓库已使用容量',
                            data: data.storeSum
                        }, {
                            name: '剩余可用容量',
                            data: data.storeRemaining
                        }],
                        responsive: {
                            rules: [{
                                condition: {
                                    maxWidth: 500
                                },
                                chartOptions: {
                                    legend: {
                                        layout: 'horizontal',
                                        align: 'center',
                                        verticalAlign: 'bottom'
                                    }
                                }
                            }]
                        }
                    });
                });
            });


            //改变时间时获取统计
            $('#myYear').change(function() {
                year = $(this).val();
                var url = 'StatisticalStoreServlet?method=getStatistical&year=' + year + '&id=' + id;

                if (id !== null)
                    url+= '&id='+id;

                $.getJSON(url, function (data) {
                    console.log(data);
                    chart = Highcharts.chart('container', {
                        title: {
                            text: '统计仓库' + year + '年每月的的入库/出库/库存/剩余容量 变化'
                        },
                        yAxis: {
                            title: {
                                text: '数量'
                            }
                        },
                        xAxis:{
                            title:{
                                text:'月份'
                            }
                        },
                        legend: {
                            layout: 'vertical',
                            align: 'right',
                            verticalAlign: 'middle'
                        },
                        plotOptions: {
                            series: {
                                label: {
                                    connectorAllowed: false
                                },
                                pointStart: 2010
                            }
                        },
                        series: [{
                            name: '入库数',
                            data: data.warehousingNum
                        }, {
                            name: '出库数',
                            data:  data.outOfStockNum
                        }, {
                            name: '仓库已使用容量',
                            data: data.storeSum
                        }, {
                            name: '剩余可用容量',
                            data: data.storeRemaining
                        }],
                        responsive: {
                            rules: [{
                                condition: {
                                    maxWidth: 500
                                },
                                chartOptions: {
                                    legend: {
                                        layout: 'horizontal',
                                        align: 'center',
                                        verticalAlign: 'bottom'
                                    }
                                }
                            }]
                        }
                    });
                });
            });

        </script>

    </div>
</div>
</body>
</html>
