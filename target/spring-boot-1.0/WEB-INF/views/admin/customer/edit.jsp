<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông tin khách hàng</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
                <li class="active">Dashboard</li>
            </ul><!-- /.breadcrumb -->

        </div>

        <div class="page-content">


            <div class="page-header">
                <h1>
                    Dashboard
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        overview &amp; stats
                    </small>
                </h1>
            </div><!-- /.page-header -->
            <div class="row">
                <div class="col-xs-12">

                </div>
            </div>
            <!-- Bảng danh sách -->




            <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                <form:form modelAttribute="customerEdit" action="/admin/customer-edit-{id}" id="customerList" method="get" >
                    <div class="col-xs-12">
                        <form class="form-horizontal" role="form" id="form-edit">

                            <div class="form-group">
                                <label class="col-xs-3">Tên khách hàng</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="text"  name="fullname" path="fullname"/>


                                </div>


                            </div>




                            <div class="form-group">
                                <label class="col-xs-3">Số điện thoại</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="text"  id="phone" name="phone" path="phone"/>


                                </div>


                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Email</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="text"  id="street" name="email" path="email"/>


                                </div>


                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Tên công ty</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="text" name="companyName" path="companyName" />


                                </div>


                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Nhu cầu</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="text"   name="demand" path="demand" />


                                </div>


                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Tình trạng</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="text"  id="status" name="status" path="status" />


                                </div>


                            </div>










                            <div class="form-group">
                                <div class="col-xs-3"></div> <!-- Empty column to align buttons with labels -->
                                <div class="col-xs-9">
                                    <c:if test="${not empty customerEdit.id}">
                                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">Cập nhật thông tin </button>
                                        <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button >
                                    </c:if>
                                    <c:if test="${ empty customerEdit.id}">
                                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">Thêm khách hàng </button>
                                        <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                    </c:if>

                                </div>
                            </div>
                            <form:hidden path="id" id="customerId1"/>

                        </form>
                    </div>
                </form:form>








            </div><!-- /.span -->
        </div>
        <c:forEach var="item" items="${transactionType}">

                <div class="col-xs-12">
                    <div class="col-sm-12">
                        <h3 class="header smaller lighter blue " style="font-family: 'Times New Roman'">${item.value}</h3>
                        <button class="btn btn-lg btn-primary" onclick="transactionType('${item.key}', '${customerEdit.id}')">
                            <i class="orange ace-icon fa fa-location-arrow bigger-130"></i>Add
                        </button>
                    </div>
                    <div class="col-xs-12">
                        <table id="simple-table" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>Ngày tạo</th>
                                <th>Người tạo</th>
                                <th>Ngày sửa</th>
                                <th>Người sửa</th>
                                <th>Chi tiết giao dịch</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="list" items="${item.key == 'CSKH' ? CSKHList : DDXList}">
                                <tr>
                                    <td>${list.createdDate}</td>
                                    <td>${list.createdBy}</td>
                                    <td>${list.modifiedDate}</td>
                                    <td>${list.modifiedBy}</td>
                                    <td>${list.note}</td>
                                    <td>
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <button class="btn btn-xs btn-primary" title="Sửa chi tiết giao dịch" onclick="UpdateTransaction('${list.id}','${customerEdit.id}')">
                                                <i class="fa fa-pencil bigger-120"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

        </c:forEach>




    </div><!-- /.main-content -->


    <div class="modal fade" id="transactionTypeModal" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content -->
            <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">*</button>
                <h4 class="modal-title">Nhập giao dich</h4>
            </div>
            <div class="modal-body">
                <div class="form-group has-success">
                    <label for="transactionDetail" class="col-xs-12 col-sm-3 control-label no-padding-right">Chi thiết giao dich</label> <div class="col-xs-12 col-sm-9">
<span class="block input-icon input-icon-right">
<input type="text" id="transactionDetail" class="width-100">
</span> </div>
                </div>
                <input type="hidden" name="customerId" id="customerId" value=""/>
                <input type="hidden" name="code" id="code" value="">
                <input type="hidden" name="id" id="id" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnAddOrUpdateTransaction">Thêm giao dich</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
            </div>
        </div>
    </div>




    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->
<script>
    function transactionType (code, customerId) { //
        $('#transactionTypeModal').modal();
        $('#customerId').val(customerId);
        $('#code').val(code);
    }
    function UpdateTransaction(id,customerId) {
        $('#transactionTypeModal').modal();
        $('#id').val(id);
        $('#customerId').val(customerId);
    }
    $('#btnAddOrUpdateTransaction').click(function (e)
    {
        e.preventDefault();
        var data={};
        var id=$('#id').val();
        data['id']=id;
        data['code']=$('#code').val();
        data['note']=$('#transactionDetail').val();
        var customerId=$('#customerId').val();
        data['customerId']=  customerId;

        AddOrUpdateTransaction(data,customerId);


    });
    function AddOrUpdateTransaction(data,id1)
    {
        $.ajax({
            type:"POST",
            url: "/api/customer/transaction",
            data: JSON.stringify(data),
            contentType: "application/json",

            success: function (respond) {
                alert("Update Transaction Successfully");
                window.location.href="/admin/customer-edit-" +encodeURIComponent(id1)
            },
            error: function (respond) {

                console.log(respond);
            }
        });
    }







    $('#btnAddOrUpdateCustomer').click(function()
    {
        var data={};

        var formData= $('#customerList').serializeArray();
        var name='';
        $.each(formData,function(i,v)
        {

            data[""+v.name+""]=v.value;


        })
        name=data['fullname'];
        if(name!='')
        {
            addOrUpdate(data);
        }
        else
        {
            window.location.href= "<c:url value= "/admin/customer-edit?name=require"/>"  ;
        }
        //call api

    });
    function addOrUpdate(data)
    {
        $.ajax({
            type:"POST",
            url: "/api/customer",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType:"JSON",
            success: function (respond) {
                window.location.href="/admin/customer-list?message=success";
            },
            error: function (respond) {
                window.location.href="/admin/customer-list?message=error";
            }
        });
    }

    $('#btnCancel').click(function ()
    {
        window.location.href="/admin/customer-list";
    })
</script>

</body>
</html>
