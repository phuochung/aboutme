
<%@page import="bean.Slide"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/templates/admin/inc/header.jsp"%>
<div class="mobile-menu-icon">
	<i class="fa fa-bars"></i>
</div>
<nav class="templatemo-left-nav">
	<ul>
		<li><a href="<%=request.getContextPath()%>/admin/acticle"><i class="fa fa-book fa-fw"></i>BÀI VIẾT</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/danhmuc" ><i
				class="fa fa-folder-open fa-fw"></i>DANH MỤC</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/project"><i
				class="fa fa-database fa-fw"></i>DỰ ÁN</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/danhngon"><i
				class="fa fa-comment fa-fw"></i>DANH NGÔN</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/advs"><i class="fa fa-money fa-fw"></i>QUẢNG
				CÁO</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/contact"><i
				class="fa fa-envelope-o fa-fw"></i>LIÊN HỆ</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/infor"><i class="fa fa-info-circle fa-fw"></i>THÔNG
				TIN</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/slide"  class="active"><i class="fa fa-sliders fa-fw"></i>SLIDE
				HOME</a></li>
	</ul>
</nav>
</div>
<!-- Main content -->
<%@include file="/templates/admin/inc/navbar.jsp"%>
<div class="templatemo-content-container">
<div class="templatemo-content-widget white-bg">
		<div class="bottom-spacing">
			<!-- Button -->
			<div class="float-left">
				<a href="<%=request.getContextPath()%>/admin/addslide" title="Thêm Slider" class="templatemo-white-button">Thêm Slider</a>
			</div>
			<div class="clear">
			</div>
		</div>
		<h2 class="text-uppercase margin-bottom-10 text-center">Slider</h2>
		  		<div class="table-responsive">
		  		<%
			int msg = 0;
			if (request.getParameter("msg") != null) {
				msg = Integer.parseInt(request.getParameter("msg"));
				switch (msg) {
				case 0:
					out.print("<p style='color:blue; font-weight:bold' >có lỗi trong quá trình thức hiện !</p>");
					break;
				case 1:
					out.print("<p style='color:blue; font-weight:bold' >Thêm thành công !</p>");
					break;
				case 2:
					out.print("<p style='color:blue; font-weight:bold' >sửa thành công !</p>");
					break;
				case 3:
					out.print("<p style='color:blue; font-weight:bold' >xóa thành công !</p>");
					break;
				case 4 :out.print("<p style='color:blue; font-weight:bold' >Bạn không có quyền thêm slide !</p>");
	 				break;
	 			case 5 :out.print("<p style='color:blue; font-weight:bold' >Bạn không có quyền sửa slide !</p>");
	 				break;
	 			case 6 :out.print("<p style='color:blue; font-weight:bold' >Bạn không có quyền xóa slide !</p>");
	 				break;	
				}
			}
		%>
			<table id="myTable" class="table-hover table-bordered table-striped">
				<thead>
					<tr>
						<th style="width:4%; text-align: center;">ID</th>
						<th>Tên</th>
						<th>Link</th>
						<th>Hình ảnh</th>
						<th style="width:11%; text-align: center;">Chức năng</th>
					</tr>
				</thead>
				<tbody>
					<%
						ArrayList<Slide> list = (ArrayList<Slide>)request.getAttribute("list");
						for(Slide item : list){
					%>					
					<tr>
						<td class="align-center"><%=item.getId_slidehome() %></td>
						<td><a href="<%=item.getLink()%>"><%=item.getName() %></a></td>
						<td><%=item.getLink() %></td>
						<td align="center">
							<img src="<%=request.getContextPath()%>/files/<%=item.getPicture() %>" width="100px">
						</td>
						<td align="center">
							<a href="<%=request.getContextPath()%>/admin/editslide?idS=<%=item.getId_slidehome()%>">Sửa</a> /
							<a href="<%=request.getContextPath()%>/admin/delslide?idS=<%=item.getId_slidehome()%>" onclick="return confirmAction()">Xóa</a>
						</td>
					</tr>
					<%} %>
				</tbody>
			</table>
		</div>
	</div>	
       
<script type="text/javascript">
	function confirmAction() {
		return confirm("Bạn có chắc muốn xóa?")
	}
</script> 

<script type="text/javascript">
	$(document).ready(function(){
    $('#myTable').DataTable();
});
</script>
<%@include file="/templates/admin/inc/footer.jsp"%>