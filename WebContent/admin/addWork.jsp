<%@page import="bean.Acticle"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header2.jsp"%>
</div>
<!-- Main content -->
<%@include file="/templates/admin/inc/navbar.jsp"%>
 <div class="templatemo-content-widget white-bg">
    <h2 class="margin-bottom-10">THÊM VIỆC LÀM</h2>
	<div class="module-body">
		<form method="post" enctype="multipart/form-data" id="formwork" novalidate="novalidate">
			<div class="row form-group">
		        <div class="col-lg-6 form-group">                   
		            <label class="control-label">Tên(*)</label>
		            <input type="text" class="form-control" name="vieclam" value="" placeholder="Nhập tên việc làm tại đây">
		        </div>
		        <div class="col-lg-6 form-group">                   
		            <label class="control-label">Thời gian(*)</label>
		            <input type="text" class="form-control" name="thoigian_cd" value="" placeholder="Nhập thời gian bắt đầu làm việc tại đây">
		        </div>
		    </div>

        	<div class="row form-group">
        		<div class="col-lg-12 col-md-12 form-group"> 
		        	<label class="control-label templatemo-block">Hình ảnh</label> 
		        	<input type="file" name="hinhanh" >
		        </div>
        	</div>

        	<div class="row form-group">
		        <div class="col-lg-12 form-group">                   
		            <label class="control-label">Mô tả (*)</label>
		            <textarea class="form-control" name="mota" rows="3"></textarea>
		        </div>
		    </div>

			<div class="form-group text-right">
		        <input type="submit" class="templatemo-blue-button" name="submit" value="Thêm">
		        <input type="reset" class="templatemo-white-button" name="reset" value="Nhập lại">
		    </div> 
		</form>
	</div> <!-- End .module-body -->
 </div> 
<script type="text/javascript">
	$("#formwork").validate({
		ignore: [], 
		debug: false,
		rules: {
			vieclam: {
				required: true,
			},
			thoigian_cd: {
				required: true,
			},
			mota: {
				required: true,
			}
		},
		messages: {
			vieclam: {
				required: "<b style='color:red '>Vui lòng nhập tên công việc!",
			},
			thoigian_cd: {
				required: "<b style='color:red '>Vui lòng nhập thời gian!",
			},
			mota: {
				required: "<b style='color:red '>Vui lòng mô tả công việc!",
			}
		}
	});
</script>	
<%@include file="/templates/admin/inc/footer.jsp"%>