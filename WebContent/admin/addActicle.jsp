<%@page import="bean.Category"%>
<%@page import="bean.Acticle"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header2.jsp"%>
</div>

<!-- Main content -->
<%@include file="/templates/admin/inc/navbar.jsp"%>
<div class="templatemo-content-container">
	<div class="templatemo-content-widget white-bg">
		<h2 class="margin-bottom-10">THÊM BÀI VIẾT</h2>
		<div class="module-body">
			<form id="frmform" method="post" enctype="multipart/form-data"
				novalidate="novalidate">
				<div class="row form-group">
					<div class="col-lg-6 col-md-6 form-group">
						<label for="inputFirstName">Tên tin (*)</label> <input
							id="inputFirstName" class="form-control"
							placeholder="Nhập tên bài viết tại đây" name="tentin" value=""
							type="text"/>
					</div>
					<div class="col-lg-6 col-md-6 form-group">
						<label class="control-label templatemo-block">Danh mục tin
							(*)</label> <select class="form-control" name="danhmuc">
							<option value="">--Chọn danh mục tin--</option>
							<% 
								ArrayList<Category> listCat =(ArrayList<Category>) request.getAttribute("listCat");
								for(Category item : listCat){
							%>
							<option value="<%=item.getId_cat()%>"><%=item.getName() %></option>
					
							<%} %>
						</select>
					</div>
					<div class="col-lg-12 col-md-12 form-group"></div>
				</div>
				<div class="row form-group">
					<div class="col-lg-12 col-md-12 form-group">
						<label class="control-label templatemo-block">Hình ảnh</label> <input
							name="hinhanh" type="file">
					</div>
				</div>
				<div class="row form-group">
					<div class="col-lg-12 form-group">
						<label class="control-label">Mô tả (*)</label>
						<textarea class="form-control " name="mota " rows="3"></textarea>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-lg-12 form-group">
						<label class="control-label">Chi tiết (*)</label><br/>
						<textarea  name="chitiet" class="form-control ckeditor" rows="3" ></textarea>
					</div>
					<div class="form-group text-right">
						<input class="templatemo-blue-button" name="submit" value="Thêm"
							type="submit"> 
						<input class="templatemo-white-button"
							name="reset" value="Nhập lại" type="reset">
					</div>
				</div>	
			</form>
		</div>
	</div>
<script type="text/javascript">
	$("#frmform").validate({
		ignore: [], 
		debug: false,
		rules: {
			tentin: {
				required: true,
			},
			mota: {
				required: true,
			},
			chitiet: {
				required: true,
			},
			danhmuc: {
				required: true,
			}
		},
		messages: {
			tentin: {
				required: "<b style='color:red '>Tên tin không được để trống!",
			},
			mota: {
				required: "<b style='color:red '>Mô tả tin không được để trống!",
			},
			chitiet: {
				required: "<b style='color:red '>Chi tiết tin không được để trống!",
			},
			danhmuc: {
				required: "<b style='color:red '>Vui lòng chọn danh mục tin!",
			}
		}
	});
</script>
	<%@include file="/templates/admin/inc/footer.jsp"%>