<%@page import="bean.Slide"%>
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
    <h2 class="margin-bottom-10">SỬA SLIDER</h2>
	<div class="module-body">
		<form method="post" enctype="multipart/form-data" id="formslider" novalidate="novalidate">
			<div class="row form-group">
		        <div class="col-lg-12 form-group">   
		        <%
		        	Slide item =(Slide)request.getAttribute("item");
		        %>                
		            <label class="control-label">Tên(*)</label>
		            <input type="text" class="form-control" name="slider" value="<%=item.getName() %>" placeholder="Nhập tên slider tại đây">
		        </div>
		    </div>

		    <div class="row form-group">
		        <div class="col-lg-12 form-group">                   
		            <label class="control-label">Link(*)</label>
		            <input type="text" class="form-control" name="linksl" value="<%=item.getLink() %>" placeholder="http://...">
		        </div>
		    </div>

        	<div class="row form-group">
        		<div class="col-lg-12 col-md-12 form-group"> 
		        	<label class="control-label templatemo-block">Hình ảnh</label> 
        	    	<p><img src="<%=request.getContextPath()%>/files/<%=item.getPicture() %>" alt="Hình ảnh quảng cáo" width="300"></p>
		        	<input type="file" name="hinhanh" >
		        </div>
        	</div>
        	<div class="row form-group">
		        <div class="col-lg-12 form-group">                   
		            <label class="control-label">Mô tả (*)</label>
		            <textarea class="form-control" name="mota" rows="3"><%=item.getPreview() %></textarea>
		        </div>
		    </div>

			<div class="form-group text-right">
		        <input type="submit" class="templatemo-blue-button" name="sua" value="Sửa">
		        <input type="reset" class="templatemo-white-button" name="reset" value="Nhập lại">
		    </div> 
		</form>
	</div> <!-- End .module-body -->
 </div> 
 <script type="text/javascript">
	$("#formslider").validate({
		ignore: [], 
		debug: false,
		rules: {
			slider: {
				required: true,
			},
			linksl: {
				required: true,
			},
			mota: {
				required: true,
			}
		},
		messages: {
			slider: {
				required: "<b style='color:red '>Vui lòng nhập tên slider!",
			},
			linksl: {
				required: "<b style='color:red '>Vui lòng nhập link!",
			},
			mota: {
				required: "<b style='color:red '>Vui lòng mô tả!",
			}
		}
	});
</script>	

<%@include file="/templates/admin/inc/footer.jsp"%>