<%--
  Created by IntelliJ IDEA.
  User: 87608
  Date: 2020/12/21
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhuhaipeng
  Date: 2019/11/23
  Time: 22:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>商品管理系统</title>
    <link href="public/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="public/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="public/libs/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="public/libs/datatables.net-select-bs4/css/select.bootstrap4.min.css" rel="stylesheet"
          type="text/css"/>

    <!-- Sweet Alert css -->
    <link href="public/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css"/>

    <!-- App favicon -->
    <link rel="shortcut icon" href="img/logo.png">

    <!-- Custom box css -->
    <link href="public/libs/custombox/custombox.min.css" rel="stylesheet">

    <!-- Icons css -->
    <link href="public/libs/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
    <link href="public/libs/dripicons/webfont/webfont.css" rel="stylesheet" type="text/css"/>
    <link href="public/libs/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css"/>


    <link href="public/css/app.css" rel="stylesheet" type="text/css"/>
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
                <li class="breadcrumb-item"><a href="javascript:void(0);">基础功能</a></li>
                <li class="breadcrumb-item active">仓库管理</li>
            </ol>
            <h4 class="page-title">
                <span><a href="${pageContext.request.contextPath}/ProductServlet?method=findAll">商品管理</a></span>
                <span><a href="${pageContext.request.contextPath}/StoreServlet?method=findAll">仓库管理</a></span>
                <span><a href="${pageContext.request.contextPath}/ClassifyServlet?method=findAll">分类管理</a></span>
                <spam><a href="${pageContext.request.contextPath}/StaffServlet?method=findAll">员工管理</a></spam>
            </h4>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card-box">
                    <div class="row w-100">
                        <div class="col-md-12">
                            <h4 class="header-title float-left">所有仓库</h4>
                            <a href="#custom-modal" class="btn btn-primary waves-effect w-md mr-2 mb-2 float-right"
                               data-animation="blur" data-plugin="custommodal"
                               data-overlaySpeed="100" data-overlayColor="#36404a">添加仓库</a>
                        </div>
                    </div>
                    <table id="datatable" class="table table-bordered dt-responsive nowrap">
                        <thead>
                        <tr>
                            <th>仓库编号</th>
                            <th>仓库名</th>
                            <th>地址</th>
                            <th>仓库管理员</th>
                            <th>描述</th>
                            <th>容量</th>
                            <th>删除 / 修改</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="store" items="${applicationScope.storeList}">
                            <tr>
                                <td>${store.storeId}</td>
                                <td>${store.storeName}</td>
                                <td>${store.address}</td>
                                <td>${store.staffId}</td>
                                <td>${store.storeDescribe}</td>
                                <td>${store.number}</td>

                                <td>
                                    <button type="button" id="sa-warning" class="btn btn-sm btn-icon btn-danger">
                                        <span><i class="mdi mdi-close"></i></span>
                                    </button>
                                    <button type="button" id="custom-html-alert"
                                            class="btn float-right btn-sm  btn-icon btn-warning">
                                        <i class="mdi mdi-wrench"></i></button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div> <!-- end card-box -->
            </div> <!-- end col -->
        </div> <!-- end row -->

    </div>
</div>
<!-- Custom Modal -->
<div id="custom-modal" class="modal-demo" style="margin-top: 20%; height: 860px">
<%--    <button type="button" class="close" onclick="Custombox.modal.close();">--%>
<%--        <span>&times;</span><span class="sr-only">Close</span>--%>
<%--    </button>--%>
    <h4 class="custom-modal-title">添加仓库</h4>
    <form class="form-horizontal m-2" method="post"
          action="${pageContext.request.contextPath}/StoreServlet?method=insert"
          enctype="multipart/form-data">

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">仓库名</label>
            <div class="col-sm-10">
                <label>
                    <input type="text" class="form-control" value="" name="storeName">
                </label>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">地址</label>
            <div class="col-sm-10">
                <label>
                    <input type="text" class="form-control" value="" name="address">
                </label>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">仓库管理员</label>
            <div class="col-sm-10">
                <label>
                    <input type="text" class="form-control" name="staffId">
                </label>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">描述</label>
            <div class="col-sm-10">
                <label>
                    <textarea class="form-control" rows="5" name="storeDescribe"></textarea>
                </label>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">容量</label>
            <div class="col-sm-10">
                <label>
                    <input type="number" class="form-control" value="" name="number">
                </label>
            </div>
        </div>

        <div class="form-group row ">
            <div class="col-md-12 text-center align-content-center">
                <button type="submit" class="btn btn-primary btn-rounded w-md">提交</button>
            </div>
        </div>

    </form>
</div>
</body>
<!-- jQuery  -->
<script src="public/js/jquery-3.4.1.min.js"></script>
<script src="public/js/bootstrap.bundle.min.js"></script>
<script src="public/libs/jquery-slimscroll/jquery.slimscroll.min.js"></script>

<!-- Datatable js -->
<script src="public/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="public/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="public/libs/datatables.net-buttons/js/dataTables.buttons.min.js"
        type="text/javascript"></script>
<%--<script src="management/assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>--%>
<%--<script src="management/assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>--%>

<!-- Sweet Alert Js  -->
<script src="public/libs/sweetalert2/sweetalert2.min.js"></script>
<script src="public/js/jquery.sweet-alert.store.js"></script>

<!-- Modal-Effect -->
<script src="public/libs/custombox/custombox.min.js"></script>


<!-- App js -->
<script src="public/js/jquery.core.js"></script>
<script src="public/js/jquery.app.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        // Default Datatable
        $('#datatable').DataTable({
            keys: true
        });

    });

</script>

</html>
