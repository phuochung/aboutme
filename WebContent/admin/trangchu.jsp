<%@page import="model.ModelUser"%>
<%@page import="model.ModelActicle"%>
<%@page import="bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ModelInfor"%>
<%@page import="bean.Infor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/templates/admin/inc/header2.jsp"%>
</div>
<!-- Main content -->
<div class="templatemo-content col-1 light-gray-bg">
	<div class="templatemo-top-nav-container">
		<div class="row">
			<nav class="templatemo-top-nav col-lg-12 col-md-12">
				<ul class="text-uppercase">
					<li><a href="<%=request.getContextPath()%>/admin/trangchu" class="active">TRANG CHỦ</a></li>
					<li><a href="<%=request.getContextPath()%>/admin/adduser">TÀI KHOẢN</a></li>
					<li><a href="<%=request.getContextPath()%>/admin/user">NGƯỜI DÙNG</a></li>
					<li><a href="<%=request.getContextPath()%>/admin/works">VIỆT LÀM</a></li>
					<li><a href="<%=request.getContextPath()%>/admin/logout">ĐĂNG XUẤT</a></li>
				</ul>
			</nav>
		</div>
	</div>
	<div class="templatemo-content-container">
		<div class="templatemo-flex-row flex-content-row">
			<div class="templatemo-content-widget white-bg col-2">
				<i class="fa fa-times"></i>
				<div class="square"></div>
				<%
					User objU = (User)session.getAttribute("sObjUser");
				%>
				<h2 class="templatemo-inline-block"><%=objU.getFullname() %></h2>
				<hr>
				<%
					ModelInfor mdIn = new ModelInfor();
					Infor infor =mdIn.getItemByID(1);
				%>
				<p>Chương trình được viết bằng Eclipse</p>
				<p>Thực hiện: Phước Hưng</p>
				<p>Email: <%=infor.getEmail()%></p>
				<p>Số ĐT: <%=infor.getPhone() %></p>
			</div>
			<div class="templatemo-content-widget white-bg col-2">
				<a class="templatemo-white-button" href="<%=request.getContextPath()%>/admin/addcat"
					title="Add">Add</a>
				<h2 class="text-uppercase"
					style="text-align: center; padding-bottom: 10px;">Danh mục tin</h2>
				<table
					class="table table-striped table-bordered templatemo-user-table">
					<thead>
						<tr align="center">
							<td>id</td>
							<td>Tên chuyên mục</td>
							<td>Sửa</td>
							<td>Xóa</td>
						</tr>
					</thead>
					<tbody>
					<%
						ArrayList<Category> listCat=(ArrayList<Category>)request.getAttribute("listCat");
						for(Category itemCat : listCat){
					%>
						<tr align="center">
							<td align="center"><%=itemCat.getId_cat() %></td>
							<td><%=itemCat.getName() %></td>
							<td align="center">
								<a href="<%=request.getContextPath()%>/admin/editcat?idC=<%=itemCat.getId_cat()%>">Sửa</a>
							</td>
							<td align="center"><a href="<%=request.getContextPath()%>/admin/delcat?idC=<%=itemCat.getId_cat()%>"
								onclick="return confirmAction()">Xóa</a></td>
						</tr>
						<%} %>
						
					</tbody>
				</table>
			</div>

		</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/templates/admin/js/loader.js"></script> 
  	<script type="text/javascript">
	    google.charts.load("current", {packages:['corechart']});
	    google.charts.setOnLoadCallback(drawChart);
	    function drawChart() {
	      var data = google.visualization.arrayToDataTable([
	        ["Tên", "Số lượng", { role: "style" } ],
			<%
				ArrayList<User> listUser = (ArrayList<User>)request.getAttribute("listUser");
	        	ModelActicle mdATC = new ModelActicle();
	        	for(User itemU : listUser){
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
		<!-- Second row ends -->
<div
		class="templatemo-flex-row flex-content-row templatemo-overflow-hidden">
		<!-- overflow hidden for iPad mini landscape view-->
		<div class="col-1 templatemo-overflow-hidden">
			<div
				class="templatemo-content-widget white-bg templatemo-overflow-hidden">
				<i class="fa fa-times"></i>
				<div class="templatemo-flex-row flex-content-row">
					<div class="col-1 col-lg-6 col-md-12">
						<h2 class="text-center">
							Biểu đồ tròn
						</h2>
						<div id="pie_chart_div" class="templatemo-chart"></div>
						<!-- Pie chart div -->
					</div>
					<div class="col-1 col-lg-6 col-md-12">
						<h2 class="text-center">
							Biểu đồ cột
						</h2>
						<div id="bar_chart_div" class="templatemo-chart"></div>
						<!-- Bar chart div -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="text-right">
		<p>
			Design By Phước Hưng
		</p>
	</footer>
</div>
<script type="text/javascript">
	function confirmAction() {
		return confirm("Bạn có chắc muốn xóa?")
	}
</script>

<!-- JS -->
<
<script type="text/javascript"
	src="<%=request.getContextPath()%>/templates/admin/js/jquery-migrate-1.2.1.min.js"></script>
<!--  jQuery Migrate Plugin -->
<script src="https://www.google.com/jsapi"></script>
<!-- Google Chart -->
<script>
	/* Google Chart 
	-------------------------------------------------------------------*/
	// Load the Visualization API and the piechart package.
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});

	// Set a callback to run when the Google Visualization API is loaded.
	google.setOnLoadCallback(drawChart);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	
	function drawChart() {
		
		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Topping');
		data.addColumn('number', 'Slices');
		data.addRows([ 
		     <%
		     	for(Category objCat : listCat){
		     %>
		               [ '<%=objCat.getName()%>', <%=mdATC.countByIDCat(objCat.getId_cat())%> ],
		             <% }%>  
		]);

		// Set chart options
		var options = {
			'title' : 'Số bài viết'
		};

		// Instantiate and draw our chart, passing in some options.
		var pieChart = new google.visualization.PieChart(document
				.getElementById('pie_chart_div'));
		pieChart.draw(data, options);

		var barChart = new google.visualization.BarChart(document
				.getElementById('bar_chart_div'));
		barChart.draw(data, options);
	}

	$(document).ready(function() {
		if ($.browser.mozilla) {
			//refresh page on browser resize
			// http://www.sitepoint.com/jquery-refresh-page-browser-resize/
			$(window).bind('resize', function(e) {
				if (window.RT)
					clearTimeout(window.RT);
				window.RT = setTimeout(function() {
					this.location.reload(false); /* false to get page from cache */
				}, 200);
			});
		} else {
			$(window).resize(function() {
				drawChart();
			});
		}
	});
</script>
	<script type="text/javascript" 
		src="<%=request.getContextPath()%>/templates/admin/js/templatemo-script.js"></script>
	<!-- Templatemo Script -->

</body>
</html>