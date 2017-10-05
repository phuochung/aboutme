<%@page import="bean.Contact"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp"%>
<div class="mobile-menu-icon">
	<i class="fa fa-bars"></i>
</div>
<nav class="templatemo-left-nav">
	<ul>
		<li><a href="<%=request.getContextPath()%>/admin/acticle" ><i class="fa fa-book fa-fw"></i>BÀI
				VIẾT</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/danhngon"><i class="fa fa-folder-open fa-fw"></i>DANH
				MỤC</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/project"><i
				class="fa fa-database fa-fw"></i>DỰ ÁN</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/danhngon"><i
				class="fa fa-comment fa-fw"></i>DANH NGÔN</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/advs"><i class="fa fa-money fa-fw"></i>QUẢNG
				CÁO</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/contact" class="active"><i
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
		<div class="bottom-spacing"></div>
		<h2 class="text-uppercase margin-bottom-10 text-center">LIÊN HỆ</h2>
		<form action="" method="POST">
			<div class="table-responsive">
			<%
		 	int msg=0;
		 	if(request.getParameter("msg")!=null){
		 		msg=Integer.parseInt(request.getParameter("msg"));
		 		switch(msg){
		 			case 0 : out.print("<p style='color:blue; font-weight:bold' >có lỗi trong quá trình thức hiện !</p>");
		 			break;
		 			case 3 :out.print("<p style='color:blue; font-weight:bold' >xóa thành công !</p>");
		 			break;
		 			case 4 :out.print("<p style='color:blue; font-weight:bold' >Bạn không có quyền xóa liên hệ !</p>");
		 			break;
		 		}
		 	}
		 %>		
					<table id="myTable" class="table-hover table-bordered table-striped">
					<thead>
						<tr class="text-center">
							<th>#</th>
							<th class="hidden">ID</th>
							<th>Họ tên</th>
							<th>Email</th>
							<th>Phone</th>
							<th>Nội dung</th>
							<th>Chức năng</th>
							<th>
								<div class="margin-right-15 templatemo-inline-block">                      
								Chọn:
					              <input type="checkbox" name="chkAll" id="chkAll" value="" />
					              <label for="chkAll" class="font-weight-400"><span></span></label>
					              <input type="submit" name="dels" id="dels" value="Xóa" onclick="return valDels();" />
					            </div>
							</th>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<Contact> alCon = (ArrayList<Contact>)request.getAttribute("listCon");
							for(Contact item : alCon){						
						%>
							<tr class="odd" role="row">
								<td class="align-center sorting_1"><%=item.getId_contact() %></td>
								<td class="align-center hidden"><%=item.getId_contact()%></td>
								<td class="align-center"><%=item.getName() %></td>
								<td class="align-center"><%=item.getEmail() %></td>
								<td class="align-center"><%=item.getPhone() %></td>
								<td class="align-center"><%=item.getMessage() %></td>
								<td align="center"><a href="<%=request.getContextPath()%>/admin/delcon?idC=<%=item.getId_contact() %>"
									onclick="return confirmAction()">Xóa</a></td>
								<td class="text-center">
									<div class="margin-right-15 templatemo-inline-block">
										<input id="<%=item.getId_contact()%>" name="iddel[]" value="<%=item.getId_contact()%>" type="checkbox">
										<label class="font-weight-400" for="<%=item.getId_contact()%>"> <span></span>
										</label>
									</div>
								</td>
							</tr>
						<%} %>	
						</tbody>
					</table>
					
			</div>
		</form>
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