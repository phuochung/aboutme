<%@page import="bean.Infor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp"%>
<div class="mobile-menu-icon">
	<i class="fa fa-bars"></i>
</div>
<nav class="templatemo-left-nav">
	<ul>
		<li><a href="<%=request.getContextPath()%>/admin/acticle" ><i class="fa fa-book fa-fw"></i>BÀI
				VIẾT</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/danhmuc"><i class="fa fa-folder-open fa-fw"></i>DANH
				MỤC</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/project"><i
				class="fa fa-database fa-fw"></i>DỰ ÁN</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/danhngon"><i
				class="fa fa-comment fa-fw"></i>DANH NGÔN</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/advs"><i class="fa fa-money fa-fw"></i>QUẢNG
				CÁO</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/contact" ><i
				class="fa fa-envelope-o fa-fw"></i>LIÊN HỆ</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/infor" class="active"><i class="fa fa-info-circle fa-fw"></i>THÔNG
				TIN</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/slide"><i class="fa fa-sliders fa-fw"></i>SLIDE
				HOME</a></li>
	</ul>
</nav>
</div>
<!-- Main content -->
<%@include file="/templates/admin/inc/navbar.jsp"%>
<div class="templatemo-content-container">
	<div class="templatemo-content-widget white-bg">
		<h2 class="margin-bottom-10">THÔNG TIN LIÊN HỆ</h2>
		<div class="module-body">
		<%
		 	int msg=0;
		 	if(request.getParameter("msg")!=null){
		 		msg=Integer.parseInt(request.getParameter("msg"));
		 		switch(msg){
		 			case 0 : out.print("<p style='color:blue; font-weight:bold' >có lỗi trong quá trình thức hiện !</p>");
		 			break;
		 			case 1 : out.print("<p style='color:blue; font-weight:bold' >Cập nhật thành công !</p>");
		 			break;
		 			case 2 : out.print("<p style='color:blue; font-weight:bold' >Bạn không có quyền cập nhật thông tin !</p>");
		 			break;
		 		}
		 	}
		 %>		
			<form method="post" enctype="multipart/form-data"
				novalidate="novalidate">
				<div class="row form-group">
				<%
					Infor item = (Infor)request.getAttribute("item");
				%>
					<div class="col-lg-8 form-group">
						<label class="control-label">Địa chỉ</label> <input
							class="form-control" name="diachi"
							value="<%=item.getAddress()%>"
							placeholder="Nhập địa chỉ" type="text">
					</div>
					<div class="col-lg-4 form-group">
						<label class="control-label">Số điện thoại</label> <input
							class="form-control" name="sdt" value="<%=item.getPhone() %>"
							placeholder="Nhập số điện thoại" type="text">
					</div>
				</div>
				<div class="row form-group">
					<div class="col-lg-4 form-group">
						<label class="control-label">Email</label> <input
							class="form-control" name="email" value="<%=item.getEmail()%>"
							placeholder="Nhập email" type="text">
					</div>
					<div class="col-lg-4 form-group">
						<label class="control-label">Skype</label> <input
							class="form-control" name="skype" value="<%=item.getSkype()%>"
							placeholder="Nhập Skype" type="text">
					</div>
					<div class="col-lg-4 form-group">
						<label class="control-label">Wordpress</label> <input
							class="form-control" name="wordpress" value="<%=item.getWordpress()%>"
							placeholder="Nhập link Wordpress" type="text">
					</div>
				</div>
				<div class="row form-group">
					<div class="col-lg-6 form-group">
						<label class="control-label">Facebook</label> <input
							class="form-control" name="facebook" value="<%=item.getFacebook()%>"
							placeholder="Nhập tên username Facebook" type="text">
					</div>
					<div class="col-lg-6 form-group">
						<label class="control-label">Link Facebook</label> <input
							class="form-control" name="lfacebook"
							value="<%=item.getLinkface()%>"
							placeholder="Nhập link Facebook" type="text">
					</div>
				</div>
				<div class="row form-group">
					<div class="col-lg-6 form-group">
						<label class="control-label">Twitter</label> <input
							class="form-control" name="twitter" value="<%=item.getTwitter()%>"
							placeholder="Nhập tên username Twitter" type="text">
					</div>
					<div class="col-lg-6 form-group">
						<label class="control-label">Link Twitter</label> <input
							class="form-control" name="ltwitter"
							value="<%=item.getLinktwt()%>"
							placeholder="Nhập link Twitter" type="text">
					</div>
				</div>
				<div class="row form-group">
					<div class="col-lg-6 form-group">
						<label class="control-label">Google Plus</label> <input
							class="form-control" name="ugoogleplus" value="<%=item.getGoogleplus() %>"
							placeholder="Nhập tên username Google Plus" type="text">
					</div>
					<div class="col-lg-6 form-group">
						<label class="control-label">Link Google Plus</label> <input
							class="form-control" name="lgoogleplus"
							value="<%=item.getLinkggp() %>"
							placeholder="Nhập link Google Plus" type="text">
					</div>
				</div>
				<div class="form-group text-right">
					<input class="templatemo-blue-button" name="sua" value="Cập nhật"
						type="submit"> <input class="templatemo-white-button"
						name="reset" value="Nhập lại" type="reset">
				</div>
			</form>
		</div>
	</div>
	
<%@include file="/templates/admin/inc/footer.jsp"%>