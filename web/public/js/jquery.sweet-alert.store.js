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

        //Basic
        $('#sa-basic').on('click', function () {
            swal(
                {
                    title: 'Any fool can use a computer!',
                    confirmButtonClass: 'btn btn-confirm mt-2'
                }
            ).catch(swal.noop)
        });

        //A title with a text under
        $('#sa-title').click(function () {
            swal(
                {
                    title: "The Internet?",
                    text: 'That thing is still around?',
                    type: 'question',
                    confirmButtonClass: 'btn btn-confirm mt-2'
                }
            )
        });

        //Success Message
        $('#sa-success').click(function () {
            swal(
                {
                    title: 'Good job!',
                    text: 'You clicked the button!',
                    type: 'success',
                    confirmButtonClass: 'btn btn-confirm mt-2'
                }
            )
        });
        //Warning Message
        //警告信息
        $(document).on('click', '#sa-warning', function () {
            var id = $(this).parent().prevAll().eq(4).text();

            var hide = $(this).parent().parent();
            console.log("删除：" + id);
            swal({
                title: '确认删除？',
                text: "是否删除该仓库",
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
                        url: "StoreServlet",
                        data: "method=delete&id=" + id,
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


        //Parameter
        $('#sa-params').click(function () {
            swal({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'cancel',
                confirmButtonClass: 'btn btn-success mt-2',
                cancelButtonClass: 'btn btn-danger ml-2 mt-2',
                buttonsStyling: false
            }).then(function () {
                swal({
                        title: 'Deleted !',
                        text: "Your file has been deleted",
                        type: 'success',
                        confirmButtonClass: 'btn btn-confirm mt-2'
                    }
                )
            }, function (dismiss) {
                // dismiss can be 'cancel', 'overlay',
                // 'close', and 'timer'
                console.log(dismiss);
                if (dismiss === 'cancel') {
                    swal({
                            title: 'Cancelled',
                            text: "Your imaginary file is safe :)",
                            type: 'error',
                            confirmButtonClass: 'btn btn-confirm mt-2'
                        }
                    )
                }
            })
        });

        //Custom Image
        $('#sa-image').click(function () {
            swal({
                title: 'Greeva',
                text: 'Responsive Bootstrap 4 Admin Dashboard',
                imageUrl: 'assets/images/logo_sm.png',
                imageHeight: 50,
                animation: false,
                confirmButtonClass: 'btn btn-confirm mt-2'
            })
        });

        //Auto Close Timer
        $('#sa-close').click(function () {
            swal({
                title: 'Auto close alert!',
                text: 'I will close in 2 seconds.',
                timer: 2000,
                confirmButtonClass: 'btn btn-confirm mt-2'
            }).then(
                function () {
                },
                // handling the promise rejection
                function (dismiss) {
                    if (dismiss === 'timer') {
                        console.log('I was closed by the timer')
                    }
                }
            )
        });

        //custom html alert
        $(document).on('click', '#custom-html-alert', function () {
            var parents = $(this).parent().prevAll();
            var name;
            var address;
            var id;
            var describe;
            var number;
            var s = swal({
                title: '<h2>更改信息</h2>',
                type: 'info',
                html: '<form class="form-horizontal">' +
                    '<div class="form-group row">' +
                    '<label class="col-sm-2 col-form-label">仓库名</label>' +
                    '<div class="col-sm-10">' +
                    '<input  type="text" class="form-control" id="storeName" value="' + parents.eq(4).text() + '">' +
                    '</div>' +
                    ' </div>' +
                    '<div class="form-group row">' +
                    '<label class="col-sm-2 col-form-label">仓库地址</label>' +
                    '<div class="col-sm-10">' +
                    '<input type="text" class="form-control" id="address" value="' + parents.eq(3).text() + '">' +
                    '</div>' +
                    ' </div>' +
                    '<div class="form-group row">' +
                    '<label class="col-sm-2 col-form-label">描述</label>' +
                    '<div class="col-sm-10">' +
                    '<input type="text" class="form-control" id="storeDescribe" value="' + parents.eq(1).text() + '">' +
                    '</div>' +
                    ' </div>' +
                    '<div class="form-group row">' +
                    '<label class="col-sm-2 col-form-label">容量</label>' +
                    '<div class="col-sm-10">' +
                    '<input type="text" class="form-control" id="number" value="' + parents.eq(0).text() + '">' +
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
                    name = $("#storeName").val();
                    address = $("#address").val();
                    describe = $("#storeDescribe").val();
                    number = $("#number").val();
                    id = parents.eq(5).text();
                }
            });
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
                    console.log(number);
                    $.ajax({
                        url: "StoreServlet",
                        data: "method=update&name=" + name + "&address=" + address + "&describe=" + describe + "&id=" + id + "&num=" + number,
                        success: function (data) {
                            if (data === "OK") {
                                swal({
                                    title: '提交中',
                                    text: "修改成功",
                                    type: 'success',
                                    confirmButtonClass: 'btn btn-confirm mt-2'
                                });
                                console.log(parents);
                                parents.eq(4).text(name);
                                parents.eq(5).text(id);
                                parents.eq(3).text(address);
                                parents.eq(1).text(describe);
                                parents.eq(0).text(number);
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
                                title: '发生错误1',
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