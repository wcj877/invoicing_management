<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <head>
        <meta charset="utf-8" />
        <title>Greeva - Responsive Bootstrap 4 Admin Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <!-- App favicon -->
        <link rel="shortcut icon" href="public/images/favicon.ico">

        <!-- Icons css -->
        <link href="public/libs/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="public/libs/dripicons/webfont/webfont.css" rel="stylesheet" type="text/css" />
        <link href="public/libs/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css" />

        <!-- App css -->
        <!-- build:css -->
        <link href="public/css/app.css" rel="stylesheet" type="text/css" />
        <!-- endbuild -->

    </head>

    <body class="bg-account-pages">

        <!-- Login -->
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-12">

                        <div class="wrapper-page">
                            <div class="account-pages">
                                <div class="account-box">

                                    <!-- Logo box-->
                                    <div class="account-logo-box">
                                        <h2 class="text-uppercase text-center">
                                            <a href="${pageContext.request.contextPath}/ProductServlet?method=findAll" class="text-success">
                                                <span><img src="public/images/logo_dark.png" alt="" height="28"></span>
                                            </a>
                                        </h2>
                                    </div>

                                    <div class="account-content">
                                        <form action="${pageContext.request.contextPath}/StaffServlet?method=findStaff" method="post" enctype="multipart/form-data">
                                            <div class="form-group mb-3">
                                                <label for="staffId" class="font-weight-medium">账号</label>
                                                <input class="form-control" type="text" id="staffId" name="staffId" required="" placeholder="输入你的账号">
                                            </div>

                                            <div class="form-group mb-3">
                                                <label for="password" class="font-weight-medium">Password</label>
                                                <input class="form-control" type="password" required="" name="password" id="password" placeholder="输入密码">
                                            </div>

                                            <div class="form-group mb-3">
                                                <div class="checkbox checkbox-info">
                                                    <input id="remember" type="checkbox">
                                                    <label for="remember">
                                                        记住我
                                                    </label>
                                                </div>
                                            </div>

                                            <c:if test="${requestScope.error != null}">
                                            <div class="form-group mb-3">
                                                <div class="checkbox checkbox-info" style="color: #be2626">
                                                    ${requestScope.error}
                                                </div>
                                            </div>
                                            </c:if>

                                            <div class="form-group row text-center">
                                                <div class="col-12">
                                                    <button class="btn btn-block btn-success waves-effect waves-light" type="submit">登入</button>
                                                </div>
                                            </div>
                                        </form> <!-- end form -->

                                    </div> <!-- end account-content -->

                                </div> <!-- end account-box -->
                            </div>
                            <!-- end account-page-->
                        </div>
                        <!-- end wrapper-page -->

                    </div> <!-- end col -->
                </div> <!-- end row -->
            </div> <!-- end container -->
        </section>
        <!-- END HOME -->


        <!-- jQuery  -->
        <script src="public/libs/jquery/jquery.min.js"></script>
        <script src="public/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="public/libs/jquery-slimscroll/jquery.slimscroll.min.js"></script>

        <!-- App js -->
        <script src="public/js/jquery.core.js"></script>
        <script src="public/js/jquery.app.js"></script>

    </body>
</html>
