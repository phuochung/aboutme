<%@page import="library.LibConvertStringUTF8"%>
<%@page import="bean.Acticle"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp"%>
<div class="cachtop"></div>
<div class="container-fluid white-bg">
	<div class="container">
		<div class="table-responsive">
			<table id="myTable" class="table-hover table-striped">
		        <thead>
		            <tr>
		                <th class="text-center">Tên bài viết</th>
		                <th class="text-center">Danh mục</th>
		                <th class="text-center">Ngày đăng</th>
		                <th class="text-center">Người đăng</th>
		            </tr>
		        </thead>
		        <tbody>
		        <%
		        	ArrayList<Acticle> list = (ArrayList<Acticle>)request.getAttribute("list");
		        	for(Acticle objATC : list){
                		String url=request.getContextPath()+"/chi-tiet/"+objATC.getId_acticle()+"/"+LibConvertStringUTF8.createSlug(objATC.getNameATC())+".html";

		        %>
		            <tr>
		                <td>
		                	<a href="<%=url%>" class="btn-open-popover" data-content="<%=objATC.getPreview() %>" data-placement="bottom" title="<%=objATC.getNameATC() %>"><%=objATC.getNameATC() %></a>
		                	<span class="hidden">
		                		<%=objATC.getPreview()%>               			
	                		</span>
		                </td>
		                <td class="text-center">
		                	<a href="<%=request.getContextPath()%>/danh-muc/<%=objATC.getId_cat() %>/<%=LibConvertStringUTF8.createSlug(objATC.getNameCat()) %>.html"><%=objATC.getNameCat() %></a>
		                	<span class="hidden"><%=objATC.getNameCat()%></span>
		                	</td>
		                <td class="text-center"><%=objATC.getDate()%></td>
		                <td class="text-center"><%=objATC.getUser()%></td>
		            </tr>
		           <%} %> 		           
		        </tbody>
		    </table>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
    $('#myTable').DataTable();
});
</script>
<script type="text/javascript">
    $(function () {
      //popover normal
      $('.btn-open-popover').popover({
        trigger: 'hover',
      });
    });
  </script>

<%@include file="/templates/public/inc/footer.jsp"%>