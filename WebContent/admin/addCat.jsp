<%@page import="bean.Acticle"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header2.jsp"%>
</nav>
</div>
<!-- Main content -->
<%@include file="/templates/admin/inc/navbar.jsp"%>
<div class="templatemo-content-container">
	<div class="templatemo-content-widget white-bg">
		<h2 class="margin-bottom-10">THÊM DANH MỤC</h2>
		<div class="module-body">
			<form id="addCat" method="post" novalidate="novalidate">
				<div class="row form-group">
					<div class="col-lg-12 col-md-12 form-group">
						<label for="inputFirstName">Tên danh mục (*)</label> <input
							id="inputFirstName" class="form-control" name="ten"
							placeholder="Nhập tên chuyên mục tại đây" value="" type="text">
					</div>
					<div class="col-lg-12 col-md-12 form-group"></div>
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
	$("#addCat").validate({
		ignore: [], 
		debug: false,
		rules: {
			ten: {
				required: true,
			}
		},
		messages: {
			ten: {
				required: "<b style='color:red '>Nhập tên danh mục!",
			}
		}
	});
</script>
<%@include file="/templates/admin/inc/footer.jsp"%>