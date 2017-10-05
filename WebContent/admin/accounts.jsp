<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header2.jsp"%>

</div>
<!-- Main content -->
<div class="templatemo-content col-1 light-gray-bg">
	<div class="templatemo-top-nav-container">
		<div class="row">
			<nav class="templatemo-top-nav col-lg-12 col-md-12">
				<ul class="text-uppercase">
					<li><a href="">TRANG CHỦ</a></li>
					<li><a href=""class="active">TÀI KHOẢN</a></li>
					<li><a href="">NGƯỜI DÙNG</a></li>
					<li><a href="login.html" >VIỆT LÀM</a></li>
					<li><a href="">ĐĂNG XUẤT</a></li>
				</ul>
			</nav>
		</div>
	</div>
	<div class="templatemo-content-container">
		<div class="templatemo-content-widget white-bg">
			<h2 class="margin-bottom-10">SỬA NGƯỜI DÙNG</h2>
			<div class="module-body">
				<form id="editUser" method="post" enctype="multipart/form-data"
					novalidate="novalidate">
					<div class="row form-group">
						<div class="col-lg-4 form-group">
							<label class="control-label">Tên(*)</label> <input
								class="form-control" name="username" value="administrator"
								placeholder="Nhập tên username" type="text">
						</div>
						<div class="col-lg-4 form-group">
							<label class="control-label">Tên đầy đủ(*)</label> <input
								class="form-control" name="fullname" value="Administrator Edu"
								placeholder="Nhập tên đầy đủ" type="text">
						</div>
						<div class="col-lg-4 form-group">
							<label>Cấp bậc</label> <select class="form-control" name="cap">
								<option value="0">Member</option>
								<option value="1">Mod</option>
								<option value="2" selected="selected">Ad</option>
							</select>
						</div>
						<div class="col-lg-12 col-md-12 form-group"></div>
					</div>
					<div class="row form-group">
						<div class="col-lg-6 form-group">
							<label class="control-label">Mật khẩu(*)</label> <input
								id="password" class="form-control" name="password" value=""
								placeholder="******" type="password">
						</div>
						<div class="col-lg-6 form-group">
							<label class="control-label">Nhập lại mật khẩu(*)</label> <input
								class="form-control" name="re_password" value=""
								placeholder="******" type="password">
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
	</div>

	<!-- JS -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/templates/admin/js/jquery-1.11.2.min.js"></script>
	<!-- jQuery -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/templates/admin/js/templatemo-script.js"></script>
	<!-- Templatemo Script -->
	<script>
		$(document).ready(
				function() {
					// Content widget with background image
					var imageUrl = $('img.content-bg-img').attr('src');
					$('.templatemo-content-img-bg').css('background-image',
							'url(' + imageUrl + ')');
					$('img.content-bg-img').hide();
				});
	</script>
</div>
</body>
</html>