<%@page import="bean.Acticle"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header2.jsp"%>
</div>
<script type="text/javascript">
			$(document).ready(function(){
				$("#addUser").validate({
					rules:{
						username:{   
							minlength:5,
							maxlength:32,
							required:true
						},
						password:{
							minlength:6,
							required:true
						},
						re_password:{
							equalTo:"#password",
							required:true
						},
						fullname:{
							required:true
						}
					},
					messages:{
						username:{
							minlength:"<b style='color:red '>Tên truy cập phải có ít nhất 6 ký tự !</b>",
							maxlength:"<b style='color:red '>Nhiều nhất 32 kí tự !</b>",
							required:" <b style='color:red '>Tên truy cập không được để trống !</b>"
						},
						password:{
							minlength:"<b style='color:red '>Mật khẩu phải có ít nhất 6 ký tự !</b>",
							required:" <b style='color:red '>Mật khẩu không được để trống!</b>"
						},
						re_password:{
							equalTo:"<b style='color:red '>Xác nhận mật khẩu phải trùng với Mật khẩu ở trên</b>"
						},
						fullname:{
							required:" <b style='color:red '>Tên không được để trống !</b>"
						}
					}
				});
			});
		</script>
<!-- Main content -->
<%@include file="/templates/admin/inc/navbar.jsp"%>
<div class="templatemo-content-container">
  <div class="templatemo-content-widget white-bg">
    <h2 class="margin-bottom-10">THÊM NGƯỜI DÙNG</h2>
    <div style="">
		<img src="<%=request.getContextPath()%>/templates/admin/images/add-user.png" alt="" class="img-responsive" style="max-width: 300px; margin: 0 auto;">
	</div>
	<div class="module-body">
		<form method="post" enctype="multipart/form-data" id="addUser" novalidate="novalidate">
			<div class="row form-group">
		        <div class="col-lg-4 form-group">                   
		            <label class="control-label">Tên(*)</label>
		            <input type="text" class="form-control" name="username" value="" placeholder="Nhập tên username">
		        </div>
		        <div class="col-lg-4 form-group">                   
		            <label class="control-label">Tên đầy đủ(*)</label>
		            <input type="text" class="form-control" name="fullname" value="" placeholder="Nhập tên đầy đủ">
		        </div>
		        <div class="col-lg-4 form-group">                   
		            <label>Cấp bậc</label>
					<select name="cap" class="form-control" >
						<option value="Member">Member</option>
						<option value="Mod" selected="selected">Mod</option>
						<option value="Ad">Ad</option>
					</select>
		        </div>
		        <div class="col-lg-12 col-md-12 form-group">  
		        			        </div>
		    </div>
		    <div class="row form-group">
		        <div class="col-lg-6 form-group">                   
		            <label class="control-label">Mật khẩu(*)</label>
		            <input type="password" class="form-control" name="password" value="" id="password" placeholder="******">
		        </div>
		        <div class="col-lg-6 form-group">                   
		            <label class="control-label">Nhập lại mật khẩu(*)</label>
		            <input type="password" class="form-control" name="re_password" value="" placeholder="******">
		        </div>
		    </div>

			<div class="form-group text-right">
		        <input type="submit" class="templatemo-blue-button" name="them" value="Thêm">
		        <input type="reset" class="templatemo-white-button" name="reset" value="Nhập lại">
		    </div> 
		</form>
	</div> <!-- End .module-body -->
 </div> 
 
<%@include file="/templates/admin/inc/footer.jsp"%>