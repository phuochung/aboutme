<%@page import="bean.Project"%>
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
		<h2 class="margin-bottom-10">SỬA DỰ ÁN</h2>
		<div class="module-body">
			<form id="formduan" method="post" enctype="multipart/form-data"
				novalidate="novalidate">
				<%
					Project item = (Project)request.getAttribute("item");
				%>
				<div class="row form-group">
					<div class="col-lg-12 col-md-12 form-group">
						<label>Tên dự án (*)</label> <input class="form-control"
							placeholder="Nhập tên dự án tại đây" name="ten" value="<%=item.getName() %>"
							type="text">
					</div>
				</div>
				<div class="row form-group">
					<div class="col-lg-12 col-md-12 form-group">
						<label>Link(*)</label> <input class="form-control" name="link"
							value="<%=item.getLink() %>"
							placeholder="Nhập link dự án tại đây" type="text">
					</div>
				</div>
				<div class="row form-group">
					<div class="col-lg-12 form-group">
						<label>Hình ảnh</label> <img
							src="<%=item.getPicture() %>"
							alt="Hình ảnh mô tả" width="300px"> <input name="hinhanh"
							value="" type="file">
					</div>
				</div>
				<div class="row form-group">
					<div class="col-lg-12 form-group">
						<label class="control-label">Mô tả (*)</label>
						<textarea class="form-control" name="mota" rows="3"><%=item.getPreview() %></textarea>
					</div>
				</div>
				<div class="form-group text-right">
					<input class="templatemo-blue-button" name="sua" value="Sửa"
						type="submit"> <input class="templatemo-white-button"
						name="reset" value="Nhập lại" type="reset">
				</div>
			
			</form>
		</div>
	</div>
<script type="text/javascript">
	$("#formduan").validate({
		ignore: [], 
		debug: false,
		rules: {
			ten: {
				required: true,
			},
			mota: {
				required: true,
			},
			link: {
				required: true,
			}
		},
		messages: {
			ten: {
				required: "<b style='color:red '>Nhập tên dự án!",
			},
			mota: {
				required: "<b style='color:red '>Mô tả dự án!",
			},
			link: {
				required: "<b style='color:red '>Nhập link dự án!",
			}
		}
	});
</script>	
<%@include file="/templates/admin/inc/footer.jsp"%>