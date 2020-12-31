<%@ page import="com.service.SalesOrderService" %>
<%@ page import="com.service.ProductService" %><%--
  Created by IntelliJ IDEA.
  User: 87608
  Date: 2020/12/21
  Time: 15:31
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
                <li class="breadcrumb-item"><a href="javascript:void(0);">采购管理</a></li>
                <li class="breadcrumb-item active">采购订单</li>
            </ol>
            <h4 class="page-title">
                <span><a href="${pageContext.request.contextPath}/PurchaseServlet?method=findAll">采购订单</a></span>
                <span><a href="${pageContext.request.contextPath}/SupplierServlet?method=findAll">供应商</a></span>
            </h4>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card-box">
                    <div class="row w-100">
                        <div class="col-md-12">
                            <h4 class="header-title float-left">所有采购订单</h4>
                            <a href="#custom-modal" class="btn btn-primary waves-effect w-md mr-2 mb-2 float-right"
                               data-animation="blur" data-plugin="custommodal"
                               data-overlaySpeed="100" data-overlayColor="#36404a">添加采购订单</a>
                        </div>
                    </div>
                    <table id="datatable" class="table table-bordered dt-responsive nowrap">
                        <thead>
                        <tr>
                            <th>订单编号</th>
                            <th>商品</th>
                            <th>供货商</th>
                            <th>采购员工</th>
                            <th>采购时间</th>
                            <th>数量</th>
                            <th>进价（单价）</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="buyOrder" items="${requestScope.buyOrderList}">
                            <tr>
                                <td>${buyOrder.buyOrderId}</td>
                                <td>${buyOrder.productName}（编号${buyOrder.productId}）</td>
                                <td>${buyOrder.supplierName}</td>
                                <td>${buyOrder.staffName}</td>
                                <td>${buyOrder.time}</td>
                                <td>${buyOrder.buyNumber}</td>
                                <td>${buyOrder.price}</td>
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
    <button type="button" class="close" onclick="Custombox.modal.close();">
        <span>&times;</span><span class="sr-only">Close</span>
    </button>
    <h4 class="custom-modal-title">添加采购订单</h4>
    <form class="form-horizontal m-2" method="post"
          action="${pageContext.request.contextPath}/PurchaseServlet?method=insert"
          enctype="multipart/form-data">

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">商品</label>
            <div class="col-sm-10">
                <select name="productId">
                    <c:forEach items="${requestScope.productList}" var="product">
                        <option value="${product.productId}">${product.productName}（编号：${product.productId}）</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">供应商</label>
            <div class="col-sm-10">
                <select name="supplierId">
                    <c:forEach items="${requestScope.supplierList}" var="supplier">
                        <option value="${supplier.supplierId}">${supplier.supplierName}（编号：${supplier.supplierId}）</option>
                    </c:forEach>
                </select>
            </div>
        </div>


        <div class="form-group row">
            <label class="col-sm-2 col-form-label">进价</label>
            <div class="col-sm-10">
                <input type="number" class="form-control" value="" name="price">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">数量</label>
            <div class="col-sm-10">
                <input type="number" class="form-control" value="" name="buyNumber">
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
<script src="public/js/jquery.sweet-alert.init.js"></script>

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