<%@page import="bean.Category"%>
<%@page import="model.ModelCat"%>
<%@page import="library.LibConvertStringUTF8"%>
<%@page import="bean.Saying"%>
<%@page import="model.ModelSaying"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Acticle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/templates/public/inc/header.jsp" %>
    <!--Chèn comment Facebook-->
			<script>
			  window.fbAsyncInit = function() {
				FB.init({
				  appId      : '1768827193344936',
				  xfbml      : true,
				  version    : 'v2.5'
				});
			  };

			  (function(d, s, id){
				 var js, fjs = d.getElementsByTagName(s)[0];
				 if (d.getElementById(id)) {return;}
				 js = d.createElement(s); js.id = id;
				 js.src = "//connect.facebook.net/en_US/sdk.js";
				 fjs.parentNode.insertBefore(js, fjs);
			   }(document, 'script', 'facebook-jssdk'));
			</script>
			

<!--Chèn comment Facebook-->
<div class="cachtop"></div>
<div class="container-fluid white-bg">
	<div class="container">
		<div class="row">
		<%
			Acticle objdetail = (Acticle)request.getAttribute("item");
		%>
	    	<div class="col-sm-8 noidungbaiviet">
	    		<h1 class="tieude"><%=objdetail.getNameATC() %></h1>
	    		<p class="thoigian pull-left">Ngày <%=objdetail.getDate() %> GMT +7</p>
	    		<p class="luotxem pull-right icon-eye-open"><i class="fa fa-eye" aria-hidden="true"></i> <%=objdetail.getLuotxem() %></p>
	    		<p class="clearfix"></p>
	    		<hr>
    			<p> <%=objdetail.getDetail() %></p>
    			<div class="fb-comments fb_iframe_widget fb_iframe_widget_fluid" data-href="http://aboutme.pro/Tuoi-tho-toi-82.html" data-width="100%" data-numposts="5" fb-xfbml-state="rendered">
    				<span style="height: 173px;">
    					<iframe id="f32f8c804b295" name="f9dc29e8e7e6ac" scrolling="no" title="Facebook Social Plugin" class="fb_ltr fb_iframe_widget_lift" src="https://www.facebook.com/plugins/comments.php?api_key=1768827193344936&amp;channel_url=http%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2FfTmIQU3LxvB.js%3Fversion%3D42%23cb%3Dfffe6987b7be3%26domain%3Daboutmeex.vinaenter.edu.vn%26origin%3Dhttp%253A%252F%252Faboutmeex.vinaenter.edu.vn%252Ff3c273a494a288%26relation%3Dparent.parent&amp;href=http%3A%2F%2Faboutme.pro%2FTuoi-tho-toi-82.html&amp;locale=en_US&amp;numposts=5&amp;sdk=joey&amp;version=v2.5&amp;width=100%25" style="border: none; overflow: hidden; height: 173px; width: 100%;">
    					</iframe>
    				</span>
    			</div>
	    	</div>
	    	<div class="col-sm-4 right-bar">
	    		<div class="col-sm-12">
	    			<h4 class="cat-right-bar">Bài viết mới nhất</h4>
	    			<ul class="newpost">
	    			<%
	    				ArrayList<Acticle> listTMN = (ArrayList<Acticle>)request.getAttribute("listTMN");
	    				for(Acticle objTMN : listTMN){
	    	          	String url=request.getContextPath()+"/chi-tiet/"+objTMN.getId_acticle()+"/"+LibConvertStringUTF8.createSlug(objTMN.getNameATC())+".html";
	    			%>
	    				<li class="btn-open-popover" data-content="<%=objTMN.getPreview()%>" data-placement="bottom" title="" data-original-title="<%=objTMN.getNameATC() %>">
	    					<h5><a href="<%=url%>" title="<%=objTMN.getNameATC() %>"> <%=objTMN.getNameATC() %></a>
	    						<span class="ngay-dang"> - <%=objTMN.getDate() %></span>
	    					</h5>
	    				</li>
	    			<%} %>
	    			</ul>
	    		</div>
	    		<div class="col-sm-12">
	    			<h4 class="cat-right-bar">Chuyên mục</h4>
	    			<ul class="chuyenmuc">
	    				<%
	    					ModelCat mdCat = new ModelCat();
	    					for(Category objCat : mdCat.getListCat()){
	    				%>
	    				                        <li><h5><a href="<%=request.getContextPath()%>/danh-muc/<%=objCat.getId_cat() %>/<%=LibConvertStringUTF8.createSlug(objCat.getName()) %>.html" title="<%=objCat.getName()%>"><%=objCat.getName()%></a></h5></li>
                                                
                                                
                                                <%} %>
                        	    			</ul>
	    		</div>
	    		<div class="col-sm-12">
	    			<h4 class="cat-right-bar">Danh ngôn</h4>
	    			<ul class="trichdan">
	    			<%
	    				ModelSaying mdSay = new ModelSaying();
	    				for(Saying objSay : mdSay.getList()){
	    			%>
	    					    				<li>
	    					<p class="text-justify"><%=objSay.getContent() %></p>
	    					<p class="text-right"><em><%=objSay.getAuthor() %></em></p>
	    				</li>
	    				<%} %>	   
	    					    			</ul>
	    		</div>
	    	</div>
    	</div>
	</div>
</div>

<script type="text/javascript">
    $(function () {
      //popover normal
      $('.btn-open-popover').popover({
        trigger: 'hover',
      });
    });
  </script>
    <!-- Clients Aside -->
  <%@include file="/templates/public/inc/footer.jsp"%>