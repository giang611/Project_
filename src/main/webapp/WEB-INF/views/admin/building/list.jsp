<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingListURL" value="/admin/building-list"/>
<html>
<head>
    <title>Danh sách tòa nhà</title>
</head>
<body>

 <div class="main-content" id="main-container">


        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Trang chủ</a>
                    </li>
                    <li class="active">Quản lý tòa nhà</li>
                </ul><!-- /.breadcrumb -->

            </div>

            <div class="page-content">


                <div class="page-header">
                    <h1>
                        Danh sách tòa nhà
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div><!-- /.page-header -->
                <div class="row">
                    <div class="col-xs-12">
                        <div class="widget-box ui-sortable-handle">
                            <div class="widget-header">
                                <h5 class="widget-title">Tìm kiếm</h5>

                                <div class="widget-toolbar">



                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>


                                </div>
                            </div>

                            <div class="widget-body" style="font-family: 'Times New Roman', Times, serif;">
                                <div class="widget-main" >
                                    <form:form modelAttribute="modelSearch" id="listForm" action="${buildingListURL}" method="get">
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                        <label class="name">Tên tòa nhà</label>
<%--                                                        <input type="text" class="form-control" name="name" value="">--%>
                                                        <form:input type="text" class="form-control" path="name" />

                                                    </div>
                                                    <div class="col-xs-6">
                                                        <label class="name">Diện tích sàn</label>
<%--                                                        <input type="number" class="form-control" name="floorArea" value="">--%>
                                                      <form:input type="number" class="form-control" path="floorArea" />

                                                    </div>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-2">
                                                        <label class="name">Quận</label>
                                                        <form:select class="form-control" path="district">
                                                            <form:option value="">---Chọn quận---</form:option>
                                                            <form:options items="${districts}"/>

                                                        </form:select>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <label class="name">Phường</label>
<%--                                                        <input type="text" class="form-control" name="ward" value="">--%>
                                                  <form:input type="text" class="form-control" path="ward" />
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <label class="name">Đường</label>
<%--                                                        <input type="text" class="form-control" name="street" value="">--%>
                                                      <form:input type="text" class="form-control" path="street" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-4">
                                                        <label class="name">Số tầng hầm</label>
<%--                                                        <input type="text" class="form-control" name="numberOfBasement" value="">--%>
                                            <form:input type="number" class="form-control" path="numberOfBasement" />

                                                    </div>
                                                    <div class="col-xs-4">
                                                        <label class="name">Hướng</label>
<%--                                                        <input type="text" class="form-control" name="direction" value="">--%>
                                                <form:input type="text" class="form-control" path="direction" />
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <label class="name">Hạng</label>
<%--                                                        <input type="number" class="form-control" name="level" value="">--%>
                                            <form:input type="text" class="form-control" path="level" />
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-3">
                                                        <label class="name">Diện tích từ</label>
<%--                                                        <input type="number" class="form-control" name="areaFrom" value="">--%>
                                               <form:input type="number" class="form-control" path="areaFrom" />

                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">Diện tích đến</label>
<%--                                                        <input type="number" class="form-control" name="areaTo" value="">--%>
                                                      <form:input type="number" class="form-control" path="areaTo" />
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">Giá thuê từ</label>
<%--                                                        <input type="number" class="form-control" name="rentPriceFrom" value="">--%>
                                               <form:input type="number" class="form-control" path="rentPriceFrom" />
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">Giá thuê đến</label>
<%--                                                        <input type="number" class="form-control" name="rentPriceTo" value="">--%>
                                                         <form:input type="number" class="form-control" path="rentPriceTo" />
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-5">
                                                        <label class="name">Tên quản lý</label>
<%--                                                        <input type="text" class="form-control" name="managerName" value="">--%>
                                               <form:input type="text" class="form-control" path="managerName" />

                                                    </div>
                                                    <div class="col-xs-5">
                                                        <label class="name">SĐT quản lý</label>
<%--                                                        <input type="text" class="form-control" name="managerPhone" value="">--%>
                                                   <form:input type="text" class="form-control" path="managerPhone" />
                                                    </div>
                                                    <security:authorize access="hasRole('MANAGER')">

                                                    <div class="col-xs-2">
                                                        <label class="name">Nhân viên</label>
                                                        <form:select class="form-control" path="staffId">
                                                            <form:option value="">---Chọn nhân viên---</form:option>
                                                            <form:options items="${listStaffs}"/>


                                                        </form:select>
                                                    </div>
                                                    </security:authorize>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                        <form:checkboxes items="${typeCodes}" path="typeCode"/>


                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                        <button type="button" class="btn btn-xs btn-danger" id="btnSearchBuilding">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
                                                            </svg>
                                                            Tìm kiếm
                                                        </button>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                          </form:form>




                                </div>
                            </div>
                            <div class="pull-right">
                            <security:authorize access="hasRole('MANAGER')">
                                <a href="/admin/building-edit"  >

                                    <button class="btn btn-info" title="Thêm tòa nhà">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                            <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                            <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                        </svg>
                                    </button>
                                </a>


                                <button class="btn btn-danger" title="Xóa tòa nhà" id="btnDeleteBuilding">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                        <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                        <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                    </svg>
                                </button>
                                </security:authorize>

                            </div>



                        </div>
                    </div>
                </div>




            <!-- Bảng danh sách -->
            <div class="row">
                <div class="col-xs-12">
                    <table id="tableList" style="margin: 3em 0 0;" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" name="checkList" value="" class="ace">
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th>Tên tòa nhà</th>
                            <th>Địa chỉ</th>
                            <th>Số tầng hầm</th>
                            <th>Tên quản lý</th>
                            <th>Số điện thoại quản lý</th>
                            <th>Diện tích sàn</th>
                            <th>Diện tích trống</th>
                            <th>Diện tích thuê</th>
                            <th>Phí môi giới</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${buidingList}">
    <tr>
                            <td class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" name="checkList" value="${item.id}" class="ace">
                                    <span class="lbl"></span>
                                </label>
                            </td>
                            <td>${item.name}</td>
                            <td>${item.address}</td>
                            <td>${item.numberOfBasement}</td>
                            <td>${item.managerName}</td>
                            <td>${item.managerPhone}</td>
                            <td>${item.floorArea}</td>
                            <td>${item.emptyArea}</td>
                            <td>${item.rentArea}</td>
                            <td>${item.brokerageFee}</td>
                            <td>
                                <div class="hidden-sm hidden-xs btn-group">
                                     <security:authorize access="hasRole('MANAGER')">
                                    <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${item.id})">
                                        <i class="ace-icon glyphicon glyphicon-list"></i>
                                    </button>
                                    </security:authorize>
                                    <a class="btn btn-xs btn-info" title="sửa tòa nhà" href="/admin/building-edit-${item.id}">

                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                    </a>



                                    <button class="btn btn-xs btn-danger" title="xóa tòa nhà" onclick="deleteBuilding(${item.id})">
                                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>


                         </c:forEach>




                        </tbody>
                    </table>
                </div><!-- /.span -->
            </div>
        </div>
         <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </ul>
            </nav>
        <script>
        $(document).ready(function() {
            // When the first checkbox (the one in the header) is clicked
            $('input[name="checkList"]:first').click(function() {
                var checkedStatus = this.checked;
                // Check/uncheck all checkboxes based on the header checkbox's status
                $('input[name="checkList"]').each(function() {
                    this.checked = checkedStatus;
                });
            });
        });
    </script>
 </div>
 	<div class="modal fade" id="assignmentBuildingModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
			<div class="modal-dialog">

			  <!-- Modal content-->
			  <div class="modal-content">
				<div class="modal-header">
				  <button type="button" class="close" data-dismiss="modal">&times;</button>
				  <h4 class="modal-title">Danh sách nhân viên</h4>
				</div>
				<div class="modal-body">
					<table class="table table-striped table-bordered table-hover" id="staffList">
						<thead>
							<tr>
								<th class="center">Chọn</th>
								<th>Tên nhân viên</th>




							</tr>
						</thead>

						<tbody>
						</tbody>
					</table>
					<input type="hidden" id="buildingId" name="buildingId" value="">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="btnassignmentBuilding">Giao tòa nhà</button>
				  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

				</div>
			  </div>

			</div>
		  </div>
 <script>
     function assignmentBuilding(buildingId)
     {
         $('#assignmentBuildingModal').modal();
         $('#buildingId').val(buildingId);
         loadStaff(buildingId);
     }
     $('#btnassignmentBuilding').click(function(e)
     {
         e.preventDefault();
         var data={};
         data['buildingId']=$('#buildingId').val();
         var staffs=$('#staffList').find('tbody input[type=checkbox]:checked').map(function()
         {
             return $(this).val();
         }).get();
         data['staffs']=staffs;
           if(data['staffs']!='')
               {
                assignment(data);

               }
         console.log("OK");
     });

     function assignment(data)
     {
     $.ajax({
            type:"POST",
            url: "/api/building/assignment",
             data: JSON.stringify(data),
             contentType: "application/json",
            dataType:"JSON",
            success: function (response) {
                console.log("thanh cong");
            },
            error: function (response) {
                console.info("Giao không thành công");
                console.log("that bai");
                console.log(response);
            }
        });

     }

     function loadStaff(buildingId)
     {
     $.ajax({
            type:"GET",
            url: "/api/building/"+ buildingId+'/staffs',
            // data: JSON.stringify(data),
            // contentType: "application/json",
            dataType:"JSON",
            success: function (response) {
                console.log("thanh cong");
                var row='';
                $.each(response.data,function (index,item)
                {
                 row+='<tr>';
                 row+='<td class="text-center"><input type="checkbox"  value='+item.staffId+' id="checkbox_1" '+item.checked+' /></td> ';
                 row+='<td class="text-center">'+item.fullName+'</td>';
                 row+='</tr>';
                });
                $('#staffList tbody').html(row);

            },
            error: function (response) {
                console.log("that bai");
                console.log(response);
            }
        });
     }


     $('#btnSearchBuilding').click(function (e)

     {
         e.preventDefault();
         $('#listForm').submit();
      })
      function deleteBuilding(id)
     {
        var buildingId=[id];
        deleteBuildings(buildingId);

     }
       $('#btnDeleteBuilding').click(function(e)
     {
         e.preventDefault();


         var buildingIds=$('#tableList').find('tbody input[type=checkbox]:checked').map(function()
         {
             return $(this).val();
         }).get();
         deleteBuildings(buildingIds);
         console.log("OK");
     });
     function deleteBuildings(data)
     {
        $.ajax({
            type:"DELETE",
            url: "/api/building/"+ data,
            data: JSON.stringify(data),
            contentType: "application/json",

            success: function (respond) {
                console.log("thanh cong");
                 window.location.href="/admin/building-list";
            },
            error: function (respond) {
                console.log("that bai");
                console.log(respond);
            }
        });
     }






 </script>

</body>
</html>
