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
		<h2 class="margin-bottom-10">THÊM DANH NGÔN</h2>
		<div class="module-body">
			<form id="formdanhngon" method="post" enctype="multipart/form-data"
				novalidate="novalidate">
				<div class="row form-group">
					<div class="col-lg-12 col-md-12 form-group">
						<label for="inputFirstName">Nội dung (*)</label>
						<textarea class="form-control" name="noidung" rows="3"></textarea>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-lg-12 col-md-12 form-group">
						<label class="control-label templatemo-block">Hình ảnh</label> <input
							name="hinhanh" type="file">
					</div>
				</div>
				<div class="row form-group">
					<div class="col-lg-12 form-group">
						<label class="control-label">Tác giả(*)</label> <input
							class="form-control" name="tacgia" value="" type="text">
					</div>
				</div>
				<div class="form-group text-right">
					<input class="templatemo-blue-button" name="them" value="Thêm"
						type="submit"> <input class="templatemo-white-button"
						name="reset" value="Nhập lại" type="reset">
				</div>
			</form>
		</div>
	</div>
<script type="text/javascript">
	$("#formdanhngon").validate({
		ignore: [], 
		debug: false,
		rules: {
			noidung: {
				required: true,
			},
			tacgia: {
				required: true,
			}
		},
		messages: {
			noidung: {
				required: "<b style='color:red '>Vui lòng nhập nội dung!",
			},
			tacgia: {
				required: "<b style='color:red '>Vui lòng nhập tác giả!",
			}
		}
	});
</script>	
<%@include file="/templates/admin/inc/footer.jsp"%>