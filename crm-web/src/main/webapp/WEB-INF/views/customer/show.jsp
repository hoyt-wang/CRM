<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>凯盛软件CRM-客户详情</title>
    <%@include file="../include/css.jsp"%>
    <style>
        .td_title {
            font-weight: bold;
        }
    </style>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

    <!-- 顶部导航栏部分 -->
    <%@include file="../include/header.jsp"%>

    <!-- =============================================== -->

    <!-- 左侧菜单栏 -->
    <%@include file="../include/sider.jsp"%>

    <!-- =============================================== -->

    <!-- 右侧内容部分 -->
    <div class="content-wrapper">
        <!-- Main content -->
        <section class="content">

            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">客户资料</h3>
                    <div class="box-tools">
                        <a href="/customer/my"><button class="btn btn-primary btn-sm"><i class="fa fa-arrow-left"></i>返回列表 </button></a>
                        <a href="/customer/${customer.id}/edit"><button class="btn bg-purple btn-sm" id="editCustomer" rel="${customer.id}"><i class="fa fa-pencil"></i> 编辑</button></a>
                        <a href=""><button class="btn bg-orange btn-sm"><i class="fa fa-exchange"></i> 转交他人</button> </a>
                        <a href=""><button class="btn bg-maroon btn-sm"><i class="fa fa-recycle"></i> 放入公海</button> </a>
                        <a href="javascript:;" id="delCustomer" rel="${customer.id}"><button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i> 删除</button> </a>
                    </div>
                </div>
                <div class="box-body no-padding">
                    <table class="table">
                        <tr>
                            <td class="td_title">姓名</td>
                            <td>${customer.custName}</td>
                            <td class="td_title">职位</td>
                            <td>${customer.jobTitle}</td>
                            <td class="td_title">联系电话</td>
                            <td>${customer.mobile}</td>
                        </tr>
                        <tr>
                            <td class="td_title">所属行业</td>
                            <td>${customer.trade}</td>
                            <td class="td_title">客户来源</td>
                            <td>${customer.source}</td>
                            <td class="td_title">级别</td>
                            <td>${customer.level}</td>
                        </tr>
                        <tr>
                            <td class="td_title">地址</td>
                            <td colspan="5">${customer.address}</td>
                        </tr>
                        <tr>
                            <td class="td_title">备注</td>
                            <td colspan="5">${customer.mark}</td>
                        </tr>
                    </table>
                </div>
                <div class="box-footer">
                    <span style="color: #ccc" class="pull-right">创建日期：${customer.createTime} &nbsp;&nbsp;&nbsp;&nbsp;
                        最后修改日期：${customer.updateTime}</span>
                </div>
            </div>

            <div class="row">
                <div class="col-md-8">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">跟进记录</h3>
                        </div>
                        <div class="box-body">

                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">日程安排</h3>
                        </div>
                        <div class="box-body">

                        </div>
                    </div>
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">相关资料</h3>
                        </div>
                        <div class="box-body">

                        </div>
                    </div>
                </div>
            </div>

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <%--编辑客户模态框--%>
    <!-- Modal -->
    <%--<div class="modal fade" id="editCustomerModel" >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"></h4>
                </div>
                <div class="modal-body">
                    <form action="" method="post" id="eidtCustomerForm">
                        <div class="form-group">
                            <label>姓名</label>
                            <input type="text" name="custName" class="form-control"  value="${customer.custName}>
                            </div>
                            <div class="form-group">
                            <label>职位</label>
                            <input type="text" name="jobTitle" class="form-control" value="${customer.jobTitle}>
                            </div>
                            <div class="form-group">
                            <label>联系方式</label>
                            <input type="text" name="mobile" class="form-control" value="${customer.address}>
                            </div>
                            <div class="form-group">
                            <label>地址</label>
                            <input type="text" name="address" class="form-control" value="${customer.address}>
                            </div>
                            <div class="form-group">
                            <label>所属行业</label>
                            <select name="trade" class="form-control" >
                                <option value=""></option>
                                <option value="互联网">互联网</option>
                                <option value="电力能源">电力能源</option>
                                <option value="其他">其他</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>客户来源</label>
                            <select name="source" class="form-control" >
                                <option value=""></option>
                                <option value="DM广告">DM广告</option>
                                <option value="电视媒体">电视媒体</option>
                                <option value="网络媒体">网络媒体</option>
                                <option value="顾客推荐">顾客推荐</option>
                                <option value="主动上门">主动上门</option>
                                <option value="其他">其他</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>级别</label>
                            <select name="level" class="form-control">
                                <option value=""></option>
                                <option value="★">★</option>
                                <option value="★★">★★</option>
                                <option value="★★★">★★★</option>
                                <option value="★★★★">★★★★</option>
                                <option value="★★★★★">★★★★★</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>备注</label>
                            <input type="text" name="mark" class="form-control" value="${customer.mark}>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" id="editCustomerFormBtn">保存</button>
                        </div>
                </div>
            </div>
        </div>
        &lt;%&ndash;编辑客户模态框结束&ndash;%&gt;
    </div>--%>


</div>
<!-- ./wrapper -->

    <!-- 底部 -->
    <%@include file="../include/footer.jsp"%>
<%@include file="../include/js.jsp"%>
<script>
    $(function () {

        $("#delCustomer").click(function(){
            var id = $(this).attr("rel");
            if(confirm("你确定要删除吗")) {
                window.location.href="/customer/" + id + "/delete";
            }
        });

       /* //编辑客户
        $("#editCustomer").click(function(){
            $("#editCustomerModel").modal({
                show: true,
                //鼠标点击桌面模态框不会消失

                backdrop: 'static'
            })
        });*/

        //验证编辑的表单
        /*$("#editCustomerFormBtn").click(function () {
            $("#eidtCustomerForm").submit();
        });*/

        /*$("#eidtCustomerForm").validate({
            errorClass:"text-danger",
            errorElement:"span",
            rules:{
                userName:{
                    required:true
                },
                mobile:{
                    required:true
                }
            },
            messages:{
                custName:{
                    required:"请输入账号"
                },
                mobile:{
                    required:"请输入手机号码"
                }
            },
            submitHandler:function(){
                var id = $(this).attr("rel");
                $.post("/customer/" + id + "/edit",$("#eidtCustomerForm").serialize()).done(function (data) {
                    if(data.state == 'success') {
                        $("#editCustomerModel").modal('hide');
                        dataTable.ajax.reload();
                    } else {
                        layer.msg(data.message);
                    }
                }).error(function () {
                    layer.msg("服务器忙，请稍后");
                });
            }
        });*/

    });
</script>

</body>
</html>
