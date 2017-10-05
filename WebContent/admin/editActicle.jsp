<%@page import="bean.Category"%>
<%@page import="bean.Advs"%>
<%@page import="bean.Saying"%>
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
    <h2 class="margin-bottom-10">SỬA BÀI VIẾT</h2>
	<div class="module-body">
		<form method="post" enctype="multipart/form-data" id="frmform" >
			<div class="row form-group">
			<%
				Acticle item =(Acticle)request.getAttribute("item");
			%>
		        <div class="col-lg-6 col-md-6 form-group">                  
		            <label for="inputFirstName">Tên tin (*)</label>
		            <input type="text" class="form-control" id="inputFirstName" placeholder="Nhập tên bài viết tại đây" name="tentin" value="<%=item.getNameATC()%>">                  
		        </div>
		        <div class="col-lg-6 col-md-6 form-group"> 
		          <label class="control-label templatemo-block">Danh mục tin (*)</label>                 
		          <select name="danhmuc" class="form-control" >
		          <%
		          	ArrayList<Category> alcat= (ArrayList<Category>)request.getAttribute("itemCat");
		            		String selected = "";
		            		for(Category itemC : alcat){
		            			if(itemC.getName().equals(item.getNameCat())){
									selected = "selected = 'selected'";
								}else{
									selected="";
								}
		          %>
		          	<option <%=selected%> value="<%=itemC.getId_cat()%>"><%=itemC.getName() %></option>
					<%} %>					
					</select>
		        </div>
		        <div class="col-lg-12 col-md-12 form-group">  
		        			        </div>
        	</div>
        	<div class="row form-group">
        		<div class="col-lg-12 col-md-12 form-group"> 
		        	<label class="control-label templatemo-block">Hình ảnh</label> 
		        						<img src="<%=request.getContextPath()%>/files/<%=item.getPicture() %>" alt="" width="400px"><br />
							        	<input type="file" name="hinhanh">

		        </div>
        	</div>

			<div class="row form-group">
		        <div class="col-lg-12 form-group">                   
		            <label class="control-label">Mô tả (*)</label>
		            <textarea class="form-control" name="mota" rows="3"><%=item.getPreview() %>
		            </textarea>
		        </div>
		    </div>
		    <div class="row form-group">
		        <div class="col-lg-12 form-group">                   
		            <label class="control-label">Chi tiết (*)</label>
		            <textarea class="form-control ckeditor" name="cktext" rows="3" style="visibility: ; display: none;"> 
		            <%=item.getDetail() %>
					</textarea>
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
	<div style="clear:both;"></div>
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