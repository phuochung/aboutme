<%@page import="model.ModelActicle"%>
<%@page import="model.ModelUser"%>
<%@page import="bean.User"%>
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
					<li><a href="<%=request.getContextPath()%>/admin/user" class="active">NGƯỜI DÙNG</a></li>
					<li><a href="<%=request.getContextPath()%>/admin/works">VIỆT LÀM</a></li>
					<li><a href="<%=request.getContextPath()%>/admin/logout">ĐĂNG XUẤT</a></li>
				</ul>
			</nav>
		</div>
	</div>
	<div class="templatemo-content-container">
		<div class="templatemo-content-widget white-bg">
			<div class="bottom-spacing">
				<div class="float-left">
					<a class="templatemo-white-button" href="<%=request.getContextPath()%>/admin/adduser"
						title="Thêm người dùng">Thêm người dùng</a>
				</div>
				<div class="clear"></div>
			</div>
			<h2 class="text-uppercase margin-bottom-10 text-center">Người
				dùng</h2>
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
				case 4:
					out.print("<p style='color:blue; font-weight:bold' >Bạn không có quyền sửa user này!</p>");
					break;
				case 5:
					out.print("<p style='color:red; font-weight:bold' >Bạn không có quyền xóa user này!</p>");
					break;
				case 6:
					out.print("<p style='color:red; font-weight:bold' >Ố ô...không được xóa admin nhé!</p>");
					break;
				case 7:
					out.print("<p style='color:red; font-weight:bold' >Bạn không có quyền thêm người dùng!</p>");
					break;
				}
				
			}
		%>
			<div class="table-responsive">
				<table id="myTable" class="table-hover table-bordered table-striped">
				<thead>
					<tr>
						<th style="width:4%; text-align: center;">ID</th>
						<th>Username</th>
						<th>Fullname</th>
						<th>Cấp bậc</th>
						<th style="width:11%; text-align: center;">Chức năng</th>
					</tr>
				</thead>
				<tbody>
				<%
					ArrayList<User> list = (ArrayList<User>)request.getAttribute("list");
					for(User item : list){
				%>
							<tr class="odd" role="row">
								<td class="align-center sorting_1"><%=item.getId_user() %></td>
								<td><a href="/qtri/user-edit-1.html"><%=item.getUsername() %></a></td>
								<td class="align-center"><%=item.getFullname() %></td>
								<td class="align-center"><%=item.getRank() %></td>
								<td align="center"><a href="<%=request.getContextPath()%>/admin/edituser?idU=<%=item.getId_user()%>">
										Sửa </a> / <a href="<%=request.getContextPath()%>/admin/deluser?idU=<%=item.getId_user()%>"
									onclick="return confirmAction()"> Xoá </a></td>
							</tr>
					<%} %>
				</tbody>
				</table>
		</div>
	</div>
<script type="text/javascript">
	function confirmAction() {
	return confirm("Bạn có chắc muốn xóa người dùng này và tất cả bài viết của họ.Cách an toàn là sửa người dùng này về cấp bậc member để họ không thể đăng bài, nhưng bài viết cũ của họ vẫn còn.?");
	}
</script> 
<script type="text/javascript">
	$(document).ready(function(){
    $('#myTable').DataTable();
});
</script>

<script type="text/javascript" src="<%=request.getContextPath()%>/templates/admin/js/loader.js"></script> 
  	<script type="text/javascript">
	    google.charts.load("current", {packages:['corechart']});
	    google.charts.setOnLoadCallback(drawChart);
	    function drawChart() {
	      var data = google.visualization.arrayToDataTable([
	        ["Tên", "Số lượng", { role: "style" } ],
			<%
	        	ModelActicle mdATC = new ModelActicle();
	        	for(User itemU : list){
			%>
	        
	        ["<%=itemU.getFullname()%>", <%=mdATC.getcountATCByUser(itemU.getFullname())%>, "#333b48"],
		<%}%>
	
	        
	      ]);
	
	      var view = new google.visualization.DataView(data);
	      view.setColumns([0, 1,
	       { calc: "stringify",
	         sourceColumn: 1,
	         type: "string",
	         role: "annotation" },
	       2]);
	
	      var options = {
	        title: "Số bài viết của người dùng",
	        bar: {groupWidth: "95%"},
	        legend: { position: "none" },
	      };
	      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
	      chart.draw(view, options);
	  	}
 	 </script>
		<div class="templatemo-flex-row flex-content-row">
			<div class="templatemo-content-widget white-bg col-2">
				<i class="fa fa-times"></i>
				<div id="columnchart_values"></div>
			</div>
			<div class="templatemo-content-widget white-bg col-2">
				<i class="fa fa-times"></i>
				<h2 class="text-uppercase"
					style="text-align: center; padding-bottom: 10px;">Thống kê</h2>
				<table
					class="table table-striped table-bordered templatemo-user-table">
					<thead>
						<tr align="center">
							<td>Cấp bậc</td>
							<td>Số user</td>
						</tr>
					</thead>
					<tbody>
					<%
						ModelUser mdU = new ModelUser();
					%>
						<tr align="center">
							<td>Ad</td>
							<td><%=mdU.getcountSoUserByRank("Ad")%></td>
						</tr>
						<tr align="center">
							<td>Mod</td>
							<td><%=mdU.getcountSoUserByRank("Mod")%></td>
						</tr>
						<tr align="center">
							<td>Member</td>
							<td><%=mdU.getcountSoUserByRank("Member")%></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
<%@include file="/templates/admin/inc/footer.jsp" %>
	