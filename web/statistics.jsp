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
                        <a href="${pageContext.request.contextPath}/StatisticsServlet?method=jump"><i
                                class="mdi mdi-file-multiple"></i>统计</a>
                    </li>
                    <div class="dropdown notification-list" style="float: right">
                        <a class="nav-link dropdown-toggle nav-user" data-toggle="dropdown" href="#" role="button"
                           aria-haspopup="false" aria-expanded="false">
                            <img src="public/images/users/avatar-1.jpg" alt="user" class="rounded-circle"> <span
                                class="ml-1"><%=session.getAttribute("name")%><i class="mdi mdi-chevron-down"></i> </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated profile-dropdown ">
                            <!-- item-->
                            <div class="dropdown-item noti-title">
                                <h6 class="text-overflow m-0">欢迎使用 !</h6>
                            </div>

                            <!-- item-->
                            <a href="${pageContext.request.contextPath}/IndexServlet?method=quit" class="dropdown-item notify-item">
                                <i class="dripicons-power"></i> <span>退出</span>
                            </a>

                        </div>
                    </div>
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
        <li class="breadcrumb-item active">统计商品</li>
    </ol>
    <h4 class="page-title">
        <a href="StatisticsServlet?method=jump" >统计商品</a>
        <a href="statistical_store.jsp" >统计仓库</a>
    </h4>

    <span>选择统计类型</span>
    <select id="types">
        <option value="getNumber">统计商品的数量（采购/销售）情况</option>
        <option value="getPrice">统计商品的价格（采购/销售）情况</option>

    </select>

    <span style="margin-left: 20px">选择统计商品</span>
    <select id="product">
        <option value="">全部商品</option>
        <c:forEach items="${requestScope.productList}" var="product">
            <option value="${product.productId}">${product.productName}（编号：${product.productId}）</option>
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


        var text = "数量（件）";
        var statisticsType = 'getNumber';//选择统计类型
        var id = '';//选择的商品编号
        var year="";//时间
        var t= new Date();
        year = t.getFullYear();//获取当前时间的年份

        var chart = null;
        $.getJSON('StatisticsServlet?method=getProductAll&year=' + year, function (data) {
            console.log(data);
            chart = Highcharts.chart('container', {
                title: {
                    text: '统计全部商品的数量（采购/销售）情况'
                },
                yAxis: {
                    title: {
                        text: '商品数量'
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
                        pointStart: 1
                    }
                },
                series: [{
                    name: '采购',
                    data: data.purchase
                }, {
                    name: '销售',
                    data: data.sales
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

        //改变类型是获取的统计信息
        $('#types').change(function() {
            var url = 'StatisticsServlet?method='+$(this).val() + "&year=" + year;

            statisticsType = $(this).val();

            text = $(this).val() === "getPrice" ? "价格（元）" : "数量（件）";//判断获取的是价格还是数量

            console.log($(this).val());

            if (id !== null)
                url+= '&id='+id;



            $.getJSON(url, function (data) {
                console.log(data);
                chart = Highcharts.chart('container', {
                    title: {
                        text:  year +'年的商品（采购/销售）统计'
                    },
                    yAxis: {
                        title: {
                            text: text
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
                            pointStart: 1
                        }
                    },
                    series: [{
                        name: '采购',
                        data: data.purchase
                    }, {
                        name: '销售',
                        data: data.sales
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

        //改变商品时获取统计
        $('#product').change(function() {
            var url = 'StatisticsServlet?method='+ statisticsType + "&year=" + year;

            url += '&id='+$(this).val();
            id =$(this).val();

            console.log(url);

            $.getJSON(url, function (data) {
                console.log(data);
                chart = Highcharts.chart('container', {
                    title: {
                        text:  year +'年的商品（采购/销售）统计'
                    },
                    yAxis: {
                        title: {
                            text: text
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
                            pointStart: 1
                        }
                    },
                    series: [{
                        name: '采购',
                        data: data.purchase
                    }, {
                        name: '销售',
                        data: data.sales
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
            var url = 'StatisticsServlet?method='+statisticsType + "&year=" + year;

            year = $(this).val();

            if (id !== null)
                url+= '&id='+id;

            $.getJSON(url, function (data) {
                console.log(data);
                chart = Highcharts.chart('container', {
                    title: {
                        text: year +'年的商品（采购/销售）统计'
                    },
                    yAxis: {
                        title: {
                            text: text
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
                            pointStart: 1
                        }
                    },
                    series: [{
                        name: '采购',
                        data: data.purchase
                    }, {
                        name: '销售',
                        data: data.sales
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