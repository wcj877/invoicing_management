<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="utf-8"/>
    <title>商品经销存  -  管理系统</title>
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

<!-- Navigation Bar-->
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
                        <a href="${pageContext.request.contextPath}/statistics.jsp"><i
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
<!-- End Navigation Bar-->


<div class="wrapper">
    <div class="container-fluid">

        <!-- Page title box -->
        <div class="page-title-alt-bg"></div>
        <div class="page-title-box">
            <ol class="breadcrumb float-right">
                <li class="breadcrumb-item"><a href="javascript:void(0);">主页</a></li>
                <li class="breadcrumb-item active">主页</li>
            </ol>
            <h4 class="page-title">主页</h4>
        </div>

        <div class="card-box gradient-success bx-shadow-lg">
            <div class="float-left">
                <h2 class="text-white mb-0 mt-2">在线人数</h2>
            </div>
            <div class="text-right">
                <h3 class="text-white" id="onlineNumber">
                    <%=request.getServletContext().getAttribute("onlineNumber")%>
                </h3>
                <script>
                    function updateOnlineNumber() {
                        $.ajax({
                            url: "../IndexServlet",
                            data: "method=online",
                            success: function (data) {
                                // console.log(data);
                                $("#onlineNumber").text(data);
                            }
                        });
                    }
                    //每隔3秒刷新一次
                    setInterval(updateOnlineNumber, 3000);
                </script>
            </div>
        </div> <!-- end card-box-->

        <div class="title" style="font-size: 50px; text-align: center; width: 100%">
            欢迎使用商品管理系统
        </div>

        <!-- jQuery  -->
        <script src="public/libs/jquery/jquery.min.js"></script>
        <script src="public/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="public/libs/jquery-slimscroll/jquery.slimscroll.min.js"></script>

        <!-- KNOB JS -->
        <script src="public/libs/jquery-knob/jquery.knob.min.js"></script>
        <!-- Chart JS -->
        <script src="public/libs/chart.js/Chart.bundle.min.js"></script>

        <!-- Jvector map -->
        <script src="public/libs/jqvmap/jquery.vmap.min.js"></script>
        <script src="public/libs/jqvmap/maps/jquery.vmap.usa.js"></script>

        <!-- Datatable js -->
        <script src="public/libs/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="public/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
        <script src="public/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
        <script src="public/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>

        <!-- Dashboard Init JS -->
        <script src="public/js/jquery.dashboard.js"></script>

        <!-- App js -->
        <script src="public/js/jquery.core.js"></script>
        <script src="public/js/jquery.app.js"></script>
    </div>
</div>
</body>

</html>