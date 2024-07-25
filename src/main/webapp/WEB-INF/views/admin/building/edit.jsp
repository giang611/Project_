<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DashBoard</title>
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
                <form:form modelAttribute="buildingEdit" action="/admin/building-edit-{id}" id="buildingList" method="get">
                    <div class="col-xs-12">
                        <form class="form-horizontal" role="form" id="form-edit">
                            <div class="form-group">
                                <label class="col-xs-3">Tên tòa nhà</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="text" name="name" path="name" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Quận</label>
                                <div class="col-xs-2">
                                    <form:select class="form-control" path="district">
                                        <form:option value="">---Chọn quận---</form:option>
                                        <form:options items="${districts}"/>
                                    </form:select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Phường</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="text" id="ward" name="ward" path="ward"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Đường</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="text" id="street" name="street" path="street"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Số tầng hầm</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="number" name="numberOfBasement" path="numberOfBasement"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Diện tích sàn</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="number" name="floorArea" path="floorArea"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Hướng</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="text" id="direction" name="direction" path="direction"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Hạng</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="number" id="level" name="level" path="level"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Diện tích thuê</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="text" name="rentArea"  path="rentArea"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Giá thuê</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="number" name="rentPrice" path="rentPrice"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Phí ô tô</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="text" name="carFee" path="carFee"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Phí mô tô</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="text" name="motoFee" path="motoFee" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Đặt cọc</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="text" name="deposit" path="deposit"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Tên quản lý</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="text" name="managerName" path="managerName"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">SĐT quản lý</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="text" name="managerPhone" path="managerPhone"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Phí môi giới</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" type="number" name="brokerageFee" path="brokerageFee"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Loại tòa nhà</label>
                                <div class="col-xs-9">
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="typeCode" name="typeCode" value="noi-that">Nội thất
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="typeCode" name="typeCode" value="nguyen-can">Nguyên căn
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="typeCode" name="typeCode" value="tang-tret">Tầng trệt
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3"></div> <!-- Empty column to align buttons with labels -->
                                <div class="col-xs-9">
                                    <c:if test="${not empty buildingEdit.id}">
                                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Cập nhật tòa nhà</button>
                                        <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                    </c:if>
                                    <c:if test="${empty buildingEdit.id}">
                                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Thêm tòa nhà</button>
                                        <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                    </c:if>
                                </div>
                            </div>
                            <form:hidden path="id" id="buildingId"/>
                        </form>
                    </div>
                </form:form>









            </div><!-- /.span -->
            </div>

        </div><!-- /.main-content -->



        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->
<script>
    $('#btnAddOrUpdateBuilding').click(function()
    {
        var data={};
        var typeCode=[];
        var formData= $('#buildingList').serializeArray();
        $.each(formData,function(i,v)
        {  if(v.name!='typeCode')
        {
            data[""+v.name+""]=v.value;
        }
        else
        {
            typeCode.push(v.value);
        }
        })
        data['typeCode']=typeCode;
        if(typeCode!='')
        {
            addOrUpdate(data);
        }
        else
        {

            var queryString = $('#buildingList').serialize();
            window.location.href = "<c:url value='/admin/building-edit'/>?" +  "&typeCode=require";

        }


    });
    function addOrUpdate(data)
    {
        $.ajax({
            type:"POST",
            url: "/api/building",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType:"JSON",
            success: function (respond) {
                window.location.href="/admin/building-list?message=success";
            },
            error: function (respond) {
                window.location.href="/admin/building-list?message=error";
            }
        });
    }

    $('#btnCancel').click(function ()
    {
        window.location.href="/admin/building-list";
    })

</script>
</body>
</html>
