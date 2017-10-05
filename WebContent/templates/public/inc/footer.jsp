<%@page import="bean.Advs"%>
<%@page import="model.ModelAdvs"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- Clients Aside -->
    <aside class="clients">
        <div class="container">
            <div class="row">
                <%
                	ModelAdvs mdAdvs = new ModelAdvs();
                	for(Advs item : mdAdvs.getListlimit()){
                %>
                <div class="col-md-3 col-sm-6">
                    <a href="<%=item.getLink()%>">
                        <img src="<%=request.getContextPath()%>/files/<%=item.getPicture() %>" class="img-responsive img-centered" alt="<%=item.getName()%>">
                    </a>
                </div>
                <%} %>
            </div>
        </div>
    </aside>
	
	<div class="lentren">
        <a href="#" title="Về đầu trang">
            <button class="btn btn-default" aria-label="Left Align">
                <i class="fa fa-chevron-up"></i>
            </button>
        </a>
    </div>

    <div class="footer_bottom_area" id="contact">
        <div class="container">
            <div class="row">
                <div class=" col-sm-12 col-md-12 col-lg-12">
                    <div class="footer_text">
                        <p>Design by <a href="https://www.facebook.com/vinaenter.edu">Phuoc Hung</a>.</p>
                    </div>
                </div>
            </div>
        </div>  
    </div>

        <!-- owl.carousel.min js
        ============================================ -->       
        <script src="<%=request.getContextPath()%>/templates/public/js/owl.carousel.min.js"></script>
    
        <!-- plugins js
        ============================================ -->      
          
        <script src="<%=request.getContextPath()%>/templates/public/js/plugins.js"></script>   
        <!-- counterup js
        ============================================ -->        
        <script src="<%=request.getContextPath()%>/templates/public/js/jquery.counterup.min.js"></script>
        <script src="<%=request.getContextPath()%>/templates/public/js/waypoints.min.js"></script>
        <!-- MixItUp js-->        
        <script src="<%=request.getContextPath()%>/templates/public/js/jquery.mixitup.js"></script>
         <!-- Nivo Slider JS -->
        <script src="<%=request.getContextPath()%>/templates/public/js/jquery.nivo.slider.pack.js"></script>       
        <script src="<%=request.getContextPath()%>/templates/public/js/jquery.nav.js"></script>           
        <!-- wow js
        ============================================ -->       
        <script src="<%=request.getContextPath()%>/templates/public/js/wow.js"></script>
        <!--Activating WOW Animation only for modern browser-->
        <!--[if !IE]><!-->
        <script type="text/javascript"> new WOW().init(); </script>
        <!--<![endif]-->
        <!-- Add venobox ja -->
        <script type="text/javascript" src="<%=request.getContextPath()%>/templates/public/venobox/venobox.min.js"></script>       
        <!-- main js
        ============================================ -->           
        <script src="<%=request.getContextPath()%>/templates/public/js/main.js"></script>
        <script src="<%=request.getContextPath()%>/templates/public/js/jqBootstrapValidation.js"></script>
        <script src="<%=request.getContextPath()%>/templates/public/js/contact_me.js"></script>

    </body>
</html>
