<%@page import="bean.Rank"%>
<%@page import="bean.User"%>
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
    <h2 class="margin-bottom-10">SỬA NGƯỜI DÙNG</h2>
	<div class="module-body">
	
		<form method="post" enctype="multipart/form-data" id="editUser" novalidate="novalidate">
			<div class="row form-group">
		        <%
		        	User item=(User)request.getAttribute("item");
		        %>
		        <div class="col-lg-12 col-md-12 form-group">
		        	<p style="color:blue;font-size:17px;font-weight:bold;">
					<%=item.getUsername() %>
				</p>
		        </div>
		        <div class="col-lg-6 form-group">                   
		            <label class="control-label">Tên đầy đủ(*)</label>
		            <input type="text" class="form-control" name="fullname" value="<%=item.getFullname() %>" placeholder="Nhập tên đầy đủ">
		        </div>
		        <div class="col-lg-6 form-group">                   
		            <label>Cấp bậc</label>
		            <%
		            	User Ulogin = (User)session.getAttribute("sObjUser");
		            	if("Ad".equals(Ulogin.getRank())){
		            %>
					<select name="cap" class="form-control" >
					
					<%
						String selected="";
						ArrayList<Rank> listRank =(ArrayList<Rank>)request.getAttribute("listRank");
						for(Rank objR : listRank){
							if(item.getRank().equals(objR.getName())){
								selected="selected='selected'";
							}else{
								selected="";
							}
					%>
						<option value="<%=objR.getName()%>" <%=selected %>><%=objR.getName()%></option>
						<%} %>
					</select>
					<%}else{ %>
						 <select name="cap" class="form-control" >
						 	<option value="<%=item.getRank()%>" ><%=item.getRank()%></option>
						 </select>
					<%} %>
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
		        <input type="submit" class="templatemo-blue-button" name="sua" value="sửa">
		        <input type="reset" class="templatemo-white-button" name="reset" value="Nhập lại">
		    </div> 
		</form>
	</div> <!-- End .module-body -->
 </div> 
 <script type="text/javascript">
			$(document).ready(function(){
				$("#editUser").validate({
					rules:{
						
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
<%@include file="/templates/admin/inc/footer.jsp"%>