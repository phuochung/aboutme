<%@page import="bean.Work"%>
<%@page import="java.util.ArrayList"%>
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
					<li><a href="<%=request.getContextPath()%>/admin/trangchu">TRANG CHỦ</a></li>
					<li><a href="<%=request.getContextPath()%>/admin/adduser">TÀI KHOẢN</a></li>
					<li><a href="<%=request.getContextPath()%>/admin/user" >NGƯỜI DÙNG</a></li>
					<li><a href="<%=request.getContextPath()%>/admin/works" class="active">VIỆT LÀM</a></li>
					<li><a href="<%=request.getContextPath()%>/admin/logout">ĐĂNG XUẤT</a></li>
				</ul>
			</nav>
		</div>
	</div>
<div class="templatemo-content-container">
	<div class="templatemo-content-widget white-bg">
		<div class="bottom-spacing">
			<div class="float-left">
				<a class="templatemo-white-button" href="<%=request.getContextPath()%>/admin/addwork"
					title="Thêm">Thêm</a>
			</div>
			<div class="clear"></div>
		</div>
		<h2 class="text-uppercase margin-bottom-10 text-center">việc làm</h2>
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
				case 4 :out.print("<p style='color:blue; font-weight:bold' >Bạn không có quyền thêm công việc !</p>");
 					break;
	 			case 5 :out.print("<p style='color:blue; font-weight:bold' >Bạn không có quyền sửa công việc !</p>");
	 				break;
	 			case 6 :out.print("<p style='color:blue; font-weight:bold' >Bạn không có quyền xóa công việc !</p>");
	 				break;
					}
			}
		%>
			<table id="myTable" class="table-hover table-bordered table-striped">
				<thead>
					<tr>
						<th style="width:4%; text-align: center;">ID</th>
						<th>Công việc</th>
						<th>Mô tả</th>
						<th>Thời gian</th>
						<th>Hình ảnh</th>
						<th style="width:11%; text-align: center;">Chức năng</th>
					</tr>
				</thead>
				<tbody>
				<%
					ArrayList<Work> list = (ArrayList<Work>)request.getAttribute("list");
					for(Work item : list){
				%>
						<tr class="odd" role="row">
							<td class="align-center sorting_1"><%=item.getId_work() %></td>
							<td><a href="/qtri/chang-duong-edit-1.html"><%=item.getName() %></a></td>
							<td><%=item.getPreview() %></td>
							<td>Tháng <%=item.getDate() %></td>
							<td align="center"><img
								src="<%=request.getContextPath()%>/files/<%=item.getPicture() %>"
								width="100px"></td>
							<td align="center"><a href="<%=request.getContextPath()%>/admin/editwork?idW=<%=item.getId_work()%>">Sửa</a>
								/ <a href="<%=request.getContextPath()%>/admin/delwork?idW=<%=item.getId_work()%>"
								onclick="return confirmAction()">Xóa</a></td>
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