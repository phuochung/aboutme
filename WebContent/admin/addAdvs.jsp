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
		<h2 class="margin-bottom-10">THÊM QUẢNG CÁO</h2>
		<div class="module-body">
			<form id="formquangcao" method="post" enctype="multipart/form-data"
				novalidate="novalidate">
				<div class="row form-group">
					<div class="col-lg-12 form-group">
						<label class="control-label">Tên(*)</label> <input
							class="form-control" name="quangcao" value=""
							placeholder="Nhập tên quảng cáo tại đây" type="text">
					</div>
				</div>
				<div class="row form-group">
					<div class="col-lg-12 form-group">
						<label class="control-label">Link(*)</label> <input
							class="form-control" name="linkqc" value=""
							placeholder="http://..." type="text">
					</div>
				</div>
				<div class="row form-group">
					<div class="col-lg-12 col-md-12 form-group">
						<label class="control-label templatemo-block">Hình ảnh</label> <input
							name="hinhanh" type="file">
					</div>
				</div>
				<div class="form-group text-right">
					<input class="templatemo-blue-button" name="submit" value="Thêm"
						type="submit"> <input class="templatemo-white-button"
						name="reset" value="Nhập lại" type="reset">
				</div>
			</form>
		</div>
	</div>
<script type="text/javascript">
	$("#formquangcao").validate({
		ignore: [], 
		debug: false,
		rules: {
			quangcao: {
				required: true,
			},
			linkqc: {
				required: true,
			}
		},
		messages: {
			quangcao: {
				required: "<b style='color:red '>Vui lòng nhập tên quảng cáo!",
			},
			linkqc: {
				required: "<b style='color:red '>Vui lòng nhập link!",
			}
		}
	});
</script>	
<%@include file="/templates/admin/inc/footer.jsp"%>