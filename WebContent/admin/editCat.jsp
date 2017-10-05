<%@page import="bean.Category"%>
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
	    <h2 class="margin-bottom-10">SỬA DANH MỤC</h2>
		<div class="module-body">
			<form method="post" id="addCat" novalidate="novalidate">
				<div class="row form-group">
			        <div class="col-lg-12 col-md-12 form-group">                  
			            <label for="inputFirstName">Tên danh mục (*)</label>
			            <%
			            	Category objC = (Category)request.getAttribute("objCat");
			            %>
			            <input type="text" name="ten" class="form-control" id="inputFirstName" placeholder="Nhập tên chuyên mục tại đây" value="<%=objC.getName()%>">
			        </div>
			        <div class="col-lg-12 col-md-12 form-group">  
			        				        </div>
			    </div>    
				<div class="form-group text-right">
			        <!-- <button type="submit" class="templatemo-blue-button" name="submit">Thêm</button> -->
			        <input type="submit" class="templatemo-blue-button" name="sua" value="Sửa">
			        <input type="reset" class="templatemo-white-button" name="reset" value="Nhập lại">
			        <!-- <button type="reset" class="templatemo-white-button">Nhập lại</button> -->
			    </div> 
			</form>
		</div> <!-- End .module-body -->
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