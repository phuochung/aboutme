<%@page import="library.LibConvertStringUTF8"%>
<%@page import="bean.Acticle"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file = "/templates/public/inc/header.jsp" %> 
<div class="cachtop"></div>
<div class="container">
<%
	Category objCat = (Category)request.getAttribute("objCat");
%>
    <h1 class="text-center">
       <%=objCat.getName() %>  </h1>

</div>

<div class="container-fluid white-bg">
    <div class="container">
        <div class="row">
            <div class="tincohinh">
                <ul class="cacbaiviet">
                <%
                	int i=0;
                String theul = "";
                	ArrayList<Acticle> list = (ArrayList<Acticle>)request.getAttribute("list");
                	for(Acticle item : list){
                		String url=request.getContextPath()+"/chi-tiet/"+item.getId_acticle()+"/"+LibConvertStringUTF8.createSlug(item.getNameATC())+".html";
                		i++;
                		if(i==3){
                			theul= "</ul></div> </div> <div class='row'> <div class='tincohinh'><ul class='cacbaiviet'>";
                	                
                		}else{
                			theul = "";
                		}
                %>
                                        <li class="col-sm-4">
                        <div class="hinhanh">
                            <a href="<%=url%>" title="<%=item.getNameATC()%>">
                                <img src="<%=request.getContextPath()%>/files/<%=item.getPicture() %>" alt="<%=item.getNameATC() %>" class="img-responsive"/>
                            </a>
                            <div class="chuyenmuc">
                                <a href="" title="Chuyên mục">
                                    <span class="label label-success"><%=item.getNameCat()%></span>
                                </a>
                            </div>
                        </div>
                        
                        <h3><a href="<%=url%>" title="<%=item.getNameATC()%>"><%=item.getNameATC()%></a></h3>
                        <p class="motabaiviet">
                            <span><%=item.getPreview()%></span>
                            <a href="<%=url%>" title="<%=item.getNameATC()%>" class="doctiep">Đọc tiếp</a>
                        </p>
                    </li>
                    <%=theul %>
                    <%}%>

                                    </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="pagination-wrap"> 
                    <ul class="pagination">
                        <!-- <li class="active"><a href="#" title="">1</a></li>-->
                        <!-- <li><a href="#" title="">2</a></li> -->
                        <li>
                        	<%
                        		int idCat = (Integer)request.getAttribute("idCat");
                    			int pageht = (Integer)request.getAttribute("page");
                   	     		int sotrang = (Integer)request.getAttribute("sotrang");
                   	     		String url2=request.getContextPath()+"/danh-muc/"+idCat+"/page/"+(pageht+1);
                        		for(int j=1;j<=sotrang;j++){
                        			String url1=request.getContextPath()+"/danh-muc/"+idCat+"/page/"+j;
                        			
                        			if(pageht==j){
                        	%>
                        	<strong><a href="<%=url1%>" data-ci-pagination-page="<%=j%>" ><%=j %></a></strong>
                        	<%
                        			}else{
                        	%>
                          	<a href="<%=url1%>" data-ci-pagination-page="<%=j%>" ><%=j %></a>
                        	<%} %>
                        	
                        	<%} %>
                        	<a href="<%=url2%>" data-ci-pagination-page="2" rel="next">&gt;</a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file = "/templates/public/inc/footer.jsp" %>