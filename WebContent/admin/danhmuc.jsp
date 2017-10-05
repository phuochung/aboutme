
<%@page import="model.ModelActicle"%>
<%@page import="bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/templates/admin/inc/header.jsp"%>
<div class="mobile-menu-icon">
	<i class="fa fa-bars"> </i>
</div>
<nav class="templatemo-left-nav">
	<ul>
		<li><a href="<%=request.getContextPath()%>/admin/acticle"><i class="fa fa-book fa-fw"></i>BÀI VIẾT</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/danhmuc" class="active"><i
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
		<li><a href="<%=request.getContextPath()%>/admin/slide"><i class="fa fa-sliders fa-fw"></i>SLIDE
				HOME</a></li>
	</ul>
</nav>

</div>
<!-- Main content -->
<%@include file="/templates/admin/inc/navbar.jsp"%>
<div class="templatemo-content-container">
	<div class="templatemo-content-widget white-bg">
		<div class="bottom-spacing">
			<div class="float-left">
				<a class="templatemo-white-button" title="Thêm danh mục"
					href="<%=request.getContextPath()%>/admin/addcat">Thêm danh mục</a>
			</div>
			<div class="clear"></div>
		</div>
		<h2 class="text-uppercase margin-bottom-10 text-center">Danh mục</h2>
		<%
		 	int msg=0;
		 	if(request.getParameter("msg")!=null){
		 		msg=Integer.parseInt(request.getParameter("msg"));
		 		switch(msg){
		 			case 0 : out.print("<p style='color:blue; font-weight:bold' >có lỗi trong quá trình thức hiện !</p>");
		 			break;
		 			case 1 : out.print("<p style='color:blue; font-weight:bold' >Thêm thành công !</p>");
		 			break;
		 			case 2 :out.print("<p style='color:blue; font-weight:bold' >sửa thành công !</p>");
		 			break;
		 			case 3 :out.print("<p style='color:blue; font-weight:bold' >xóa thành công !</p>");
		 			break;
		 			case 4 :out.print("<p style='color:blue; font-weight:bold' >Bạn không có quyền thêm danh muc !</p>");
		 			break;
		 			case 5 :out.print("<p style='color:blue; font-weight:bold' >Bạn không có quyền sửa danh muc !</p>");
		 			break;
		 			case 6 :out.print("<p style='color:blue; font-weight:bold' >Bạn không có quyền xóa danh muc !</p>");
		 			break;
		 		}
		 	}
		 %>		
		<div class="table-responsive">
				
				<table id="myTable" class="table-hover table-bordered table-striped">
				<thead>
					<tr>
						<th style="width:4%; text-align: center;">ID</th>
						<th>Tên danh mục</th>
						<th style="width:11%; text-align: center;">Chức năng</th>
					</tr>
				</thead>
				<tbody>
					<%
						ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("listCat");
						for(Category item : list){
					%>
						<tr class="odd" role="row">
							<td class="align-center id-cat sorting_1"><%=item.getId_cat() %></td>
							<td class="tencm"><a href="javascript:void(0)"><%=item.getName() %></a></td>
							<td width="30%" align="center"><a href="<%=request.getContextPath()%>/admin/delcat?idC=<%=item.getId_cat()%>"onclick="return confirmAction()" > Xóa </a></td>
						</tr>
						<%} %>
						
					</tbody>
				</table>
				
		</div>
	</div>
	
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
<script type="text/javascript">
	$(document).ready(function() {
		$('#myTable').DataTable();
	});
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
		    	ModelActicle mdATC = new ModelActicle();
		     	ArrayList<Category> listCat=(ArrayList<Category>)request.getAttribute("listCat");
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