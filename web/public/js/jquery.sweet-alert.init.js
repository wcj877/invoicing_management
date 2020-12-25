/*
Template Name: Greeva - Responsive Bootstrap 4 Admin Dashboard
Author: CoderThemes
File: Sweet Alerts
*/

!function ($) {
    "use strict";

    var SweetAlert = function () {
    };

    //examples
    SweetAlert.prototype.init = function () {
        //Warning Message
        //警告信息
        $(document).on('click', '#sa-warning', function () {
            var id = $(this).parent().prevAll().eq(8).text();

            var hide = $(this).parent().parent();
            console.log("删除：" + id);
            swal({
                title: '确认删除？',
                text: "是否删除该商品",
                type: 'warning',
                showCancelButton: true,
                confirmButtonClass: 'btn btn-confirm mt-2',
                cancelButtonClass: 'btn btn-cancel ml-2 mt-2',
                confirmButtonText: '是',
                cancelButtonText: "否"
            }).then(function (dismiss) {
                // dismiss can be 'cancel', 'overlay',
                // 'close', and 'timer'
                console.log(dismiss);
                if (dismiss['dismiss'] === 'cancel') {
                    swal({
                        title: '取消操作',
                        text: "取消删除",
                        type: 'error',
                        confirmButtonClass: 'btn btn-confirm mt-2'
                    });
                } else {
                    $.ajax({
                        url: "ProductServlet",
                        data: "method=delete&productId=" + id,
                        success: function (data) {
                            console.log("删除成功  " + data);
                            if (data === "OK") {
                                $(hide).addClass("d-none");
                                swal({
                                        title: 'Deleted !',
                                        text: "删除成功",
                                        type: 'success',
                                        confirmButtonClass: 'btn btn-confirm mt-2'
                                    }
                                );
                            }


                        },
                        error: function () {
                            swal({
                                title: '取消操作q',
                                text: "取消删除",
                                type: 'error',
                                confirmButtonClass: 'btn btn-confirm mt-2'
                            });
                        }
                    });
                }
            })
        });

        //custom html alert
        $(document).on('click', '#custom-html-alert', function () {
            var parents = $(this).parent().prevAll();
            var name;
            var describes;
            var id;
            var s = swal({
                title: '<h2>更改信息</h2>',
                type: 'info',
                html: '<form class="form-horizontal">' +
                    '<div class="form-group row">' +
                    '<label class="col-sm-2 col-form-label">商品名</label>' +
                    '<div class="col-sm-10">' +
                    '<input  type="text" class="form-control" id="productName" value="' + parents.eq(7).text() + '">' +
                    '</div>' +
                    ' </div>' +
                    '<div class="form-group row">' +
                    '<label class="col-sm-2 col-form-label">商品描述</label>' +
                    '<div class="col-sm-10">' +
                    '<input type="text" class="form-control" id="describes" value="' + parents.eq(6).text() + '">' +
                    '</div>' +
                    ' </div>' +
                    '</form>',
                showCloseButton: true,
                showCancelButton: true,
                confirmButtonClass: 'btn btn-confirm mt-2',
                cancelButtonClass: 'btn btn-cancel ml-2 mt-2',
                confirmButtonText: '<h3>提交修改</h3>',
                cancelButtonText: '<h3>取消</h3>',
                preConfirm: function () {
                    name = $("#productName").val();
                    describes = $("#describes").val();
                    id = parents.eq(8).text();
                    console.log(name);
                }
            });
            var originName = $("#name").val();
            s.then(function (dismiss) {
                // dismiss can be 'cancel', 'overlay',
                // 'close', and 'timer'
                console.log(dismiss);
                if (dismiss['dismiss'] === 'cancel') {
                    swal({
                            title: '取消操作',
                            text: "取消修改",
                            type: 'error',
                            confirmButtonClass: 'btn btn-confirm mt-2'
                        }
                    )
                } else {
                    $.ajax({
                        url: "ProductServlet",
                        data: "method=update&name=" + name + "&describes=" + describes+ "&id=" + id,
                        success: function (data) {
                            if (data === "OK") {
                                swal({
                                    title: '提交中',
                                    text: "修改成功",
                                    type: 'success',
                                    confirmButtonClass: 'btn btn-confirm mt-2'
                                });
                                console.log(parents);
                                parents.eq(7).text(name);
                                parents.eq(8).text(id);
                                parents.eq(6).text(describes);
                            } else {
                                swal({
                                    title: '发生错误',
                                    text: "修改信息失败",
                                    type: 'error',
                                    confirmButtonClass: 'btn btn-confirm mt-2'
                                })
                            }
                        },
                        error: function () {
                            swal({
                                title: '发生错误',
                                text: "修改信息失败",
                                type: 'error',
                                confirmButtonClass: 'btn btn-confirm mt-2'
                            })
                        }
                    });

                }
            });
        });
    },
        //init
        $.SweetAlert = new SweetAlert, $.SweetAlert.Constructor = SweetAlert
}(window.jQuery),

//initializing
    function ($) {
        "use strict";
        $.SweetAlert.init()
    }(window.jQuery);