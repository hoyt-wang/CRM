<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                        <button class="btn bg-orange btn-sm" id="transferCustomer"><i class="fa fa-exchange"></i> 转交他人</button>
                        <button id="publicBtn" class="btn bg-maroon btn-sm"><i class="fa fa-recycle"></i> 放入公海</button>
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
                        <c:if test="${not empty customer.address}">
                            <tr>
                                <td class="td_title">地址</td>
                                <td colspan="5">${customer.address}</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty customer.mark}">
                            <tr>
                                <td class="td_title">备注</td>
                                <td colspan="5">${customer.mark}</td>
                            </tr>
                        </c:if>
                    </table>
                </div>
                <div class="box-footer">
                    <span style="color: #ccc" class="pull-right">创建日期：<span title="<fmt:formatDate value="${customer.createTime}"/>"><fmt:formatDate value="${customer.createTime}" pattern="MM月dd日"/></span> &nbsp;&nbsp;&nbsp;&nbsp;
                        最后修改日期：<span title="<fmt:formatDate value="${customer.updateTime}"/>"><fmt:formatDate value="${customer.updateTime}"/></span>
                </div>
            </div>

            <div class="row">
                <div class="col-md-8">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">跟进记录</h3>
                        </div>
                        <div class="box-body">
                            <ul class="list-group">
                                <c:forEach items="${saleChanceList}" var="saleChance">
                                    <li class="list-group-item">
                                        <a href="/record/my/${saleChance.id}" target="_blank">${saleChance.name}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">日程安排</h3>
                        </div>
                        <div class="box-body">
                            <ul class="list-group">
                                <c:forEach items="${taskList}" var="task">
                                    <li class="list-group-item">
                                        <a href="/task/list" target="_blank">${task.title}</a>
                                    </li>
                                </c:forEach>
                            </ul>
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
    <%--用户选择对话框（转交他人）--%>
    <div class="modal fade" id="chooseUserModel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">请选择转入账号</h4>
                </div>
                <div class="modal-body">
                    <select id="userSelect" class="form-control">
                        <c:forEach items="${accountList}" var="account">
                            <c:if test="${account.id != customer.accountId}">
                                <option value="${account.id}">${account.userName} (${account.mobile})</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="saveTranBtn">确定</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

</div>
<!-- ./wrapper -->

    <!-- 底部 -->
    <%@include file="../include/footer.jsp"%>
<%@include file="../include/js.jsp"%>
<script src="/static/plugins/layer/layer.js"></script>
<script>
    $(function () {

        var customerId = ${customer.id};
        //alert(accountId);
        $("#delCustomer").click(function(){
            var id = $(this).attr("rel");
            if(confirm("你确定要删除吗")) {
                window.location.href="/customer/" + id + "/delete";
            }
        });

        //放入公海
        $("#publicBtn").click(function () {
            layer.confirm("您确定要将客户放入公海吗",function(index){
                layer.close(index);
                window.location.href = "/customer/my/" + customerId + "/public";
            })
        });
        //转交他人
        $("#transferCustomer").click(function () {
            $("#chooseUserModel").modal({
                show:true,
                backdrop:'static'
            });
        });

        $("#saveTranBtn").click(function () {
            var toAccountId = $("#userSelect").val();
            var toAccountName = $("#userSelect option:selected").text();
            layer.confirm("您确定要将客户转交给"+toAccountName+"吗",function (index) {
                layer.close(index);
                window.location.href = "/customer/my/"+customerId+"/transfer/"+toAccountId;
            });
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
