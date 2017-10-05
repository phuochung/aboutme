<%@page import="bean.Acticle"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp"%>
<div class="mobile-menu-icon">
	<i class="fa fa-bars"></i>
</div>
<nav class="templatemo-left-nav">
	<ul>
		<li><a href="#" class="active"><i class="fa fa-book fa-fw"></i>BÀI
				VIẾT</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/danhmuc"><i class="fa fa-folder-open fa-fw"></i>DANH
				MỤC</a></li>
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
				<a class="templatemo-white-button"
					href="<%=request.getContextPath()%>/admin/addacticle"
					title="Thêm bài viết">Thêm bài viết</a>
			</div>
			<div class="clear"></div>
		</div>
		<h2 class="text-uppercase margin-bottom-10 text-center">Bài viết</h2>
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
					out.print("<p style='color:blue; font-weight:bold' >Bạn không có quyền sửa bài viết này !</p>");
					break;
				case 5:
					out.print("<p style='color:blue; font-weight:bold' >Bạn không có quyền xóa bài viết này !</p>");
					break;
				case 6:
					out.print("<p style='color:blue; font-weight:bold' >Chỉ xóa được những bài viết bạn đăng, những bài viết của người khác thì không có quyền xóa !</p>");
					break;
				case 7:
					out.print("<p style='color:blue; font-weight:bold' >Bạn là member nên không có quyền đăng bài viết!</p>");
					break;	
				}
			}
		%>
		<form action="" method="POST">
			<div class="table-responsive">
				<table id="myTable" class="table-hover table-bordered table-striped">
					<thead>
						<tr class="text-center">
							<th>#</th>
							<th class="hidden">ID</th>
							<th>Tên</th>
							<th>Danh mục</th>
							<th>Trạng thái</th>
							<th>Hình ảnh</th>
							<th>Ngày đăng</th>
							<th>Chức năng</th>
							<th>
								<div class="margin-right-15 templatemo-inline-block">
									Chọn: <input type="checkbox" name="chkAll" id="chkAll" value="" />
									<label for="chkAll" class="font-weight-400"><span></span></label>
									<input type="submit" name="dels" id="dels" value="Xóa"
										onclick="return valDels();" />
								</div>
							</th>
						</tr>

					</thead>

					<tbody>
						<%
							ArrayList<Acticle> list = (ArrayList<Acticle>) request.getAttribute("listATC");
							for (Acticle item : list) {
						%>
						<tr class="odd" role="row">
							<td class="text-center sorting_1"><%=item.getId_acticle()%></td>
							<td class="id_act text-center hidden"><%=item.getId_acticle() %></td>
							<td><a href="<%=request.getContextPath()%>/admin/editacticle?idA=<%=item.getId_acticle()%>"><%=item.getNameATC()%></a></td>
							<td><%=item.getNameCat()%></td>
							<td class="edit_active text-center">
								<%
									if(item.getIs_active()==1){
								%>
								<a
									href="javascript:void(0)" title="Ngừng kích hoạt"> <img
										src="<%=request.getContextPath()%>/templates/admin/images/tick-circle.gif" alt="">
										
								</a> 
								<%
									}else if(item.getIs_active()==0){
								%>
								<a class="noactive"
									href="javascript:void(0)" title=" kích hoạt"> <img
										src="<%=request.getContextPath()%>/templates/admin/images/minus-circle.gif" alt="">
								</a> 
								<%} %>
								
							</td>
							<td align="center"><img
								src="<%=request.getContextPath()%>/files/<%=item.getPicture()%>"
								width="100px"/></td>
							<td align="center"><%=item.getDate()%></td>
							<td align="center"><a
								href="<%=request.getContextPath()%>/admin/editacticle?idA=<%=item.getId_acticle()%>">
									Sửa </a>/
							<a href="<%=request.getContextPath()%>/admin/delacticle?idA=<%=item.getId_acticle()%>"
									onclick="return confirmAction()"> Xóa </a></td>
							<td class="text-center">
								<div class="margin-right-15 templatemo-inline-block">
									<input id="<%=item.getId_acticle() %>" name="iddel[]" value="<%=item.getId_acticle() %>" type="checkbox">
									<label class="font-weight-400" for="<%=item.getId_acticle() %>"> <span></span>
									</label>
								</div>
							</td>
						</tr>
						<%
							}
						%>

					</tbody>
				</table>
			</div>
		</form>
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
    $('#myTable').DataTable();
});
</script>
       
 <script type="text/javascript">
	function confirmAction() {
	return confirm("Bạn có chắc muốn xóa?")
	}
</script> 

<script type="text/javascript">
$(function(){
	$(document).on('click','#myTable .edit_active a', function(){
		var is_active = 1;
		var id_act = 0;
		if($(this).hasClass('noactive')){
			is_active = 0;
		}
		id_act = $(this).parent().siblings('.id_act').html();	
		
		var $_point = $(this);
		$.ajax({
			url: '<%=request.getContextPath()%>/admin/ajax/acticle',
			type: 'POST',
			cache: false,
			data: {
				aid_act : id_act,
				ais_active: is_active
			},
			success: function(data){
				$_point.parent().html(data);
			},
			error: function (){
				alert('Có lỗi xảy ra');
			}
		});		
	});
});
</script>


<script type="text/javascript">
function valDels()
{
    var checkedAtLeastOne = false;
    $('input[type="checkbox"][name="iddel[]"]').each(function() {
        if ($(this).is(":checked")) {
            checkedAtLeastOne = true;
        }
    });
    
    if (checkedAtLeastOne == true){
		return confirm('Bạn có muốn xóa các mẫu tin đã chọn?');
    } else {
    	alert('Vui lòng chọn ít nhất 1 tin để xóa');
    	return false;
    }
}

$('#chkAll').click(function(event) {
  if(this.checked) {
      // Iterate each checkbox
      $(':checkbox').each(function() {
          this.checked = true;
      });
  }
  else {
    $(':checkbox').each(function() {
          this.checked = false;
      });
  }
});

</script>
	<%@include file="/templates/admin/inc/footer.jsp"%>