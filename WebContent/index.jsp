<%@page import="bean.Category"%>
<%@page import="model.ModelCat"%>
<%@page import="bean.CountView"%>
<%@page import="library.LibConvertStringUTF8"%>
<%@page import="bean.Infor"%>
<%@page import="javax.sound.midi.MidiDevice.Info"%>
<%@page import="model.ModelInfor"%>
<%@page import="bean.Project"%>
<%@page import="model.ModelProject"%>
<%@page import="bean.Saying"%>
<%@page import="model.ModelSaying"%>
<%@page import="bean.Acticle"%>
<%@page import="model.ModelActicle"%>
<%@page import="bean.Work"%>
<%@page import="model.ModelWorks"%>
<%@page import="model.ModelSlide"%>
<%@page import="bean.Slide"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if lt IE 7 ]> <html lang="vi" class="ie6">    <![endif]-->
<!--[if IE 7 ]>    <html lang="vi" class="ie7">    <![endif]-->
<!--[if IE 8 ]>    <html lang="vi" class="ie8">    <![endif]-->
<!--[if IE 9 ]>    <html lang="vi" class="ie9">    <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html class="no-js" lang="vi">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Phước Hưng</title>
        <meta name="description" content="About ph">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- google font  -->
        <link href='https://fonts.googleapis.com/css?family=Oxygen:400,700,300' rel='stylesheet' type='text/css'>
        <link href="https://fonts.googleapis.com/css?family=Noto+Sans" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
        <!-- Favicon
        ============================================ -->
        <link rel="shortcut icon" type="image/ico" href="<%=request.getContextPath()%>/templates/public/img/favicon.ico" />

        <!-- Datatable -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/templates/public/css/jquery.dataTables.min.css">

        <!-- style CSS
        ============================================ -->          
        <link rel="stylesheet" href="<%=request.getContextPath()%>/templates/public/css/agency.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/templates/public/css/style.css">

        <!-- JS -->    
        <script src="js/jquerys.js"></script>

        <!-- jquery-1.11.3.min js
        ============================================ -->         
        <!-- <script src="<%=request.getContextPath()%>/templates/public/js/vendor/jquery-1.11.3.min.js"></script>    -->
        <script src="<%=request.getContextPath()%>/templates/public/js/jquery-1.11.2.min.js"></script>   
        <script src="<%=request.getContextPath()%>/templates/public/js/validate.js"></script>
        <script src="<%=request.getContextPath()%>/templates/public/js/jquery.validate.js"></script>
                   
        <!-- bootstrap js
        ============================================ -->         
        <script src="<%=request.getContextPath()%>/templates/public/js/bootstrap.min.js"></script>      

        <!-- Datatable -->
        <script src="<%=request.getContextPath()%>/templates/public/js/jquery.dataTables.min.js"></script>
        
        <script src="<%=request.getContextPath()%>/templates/public/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <!--Start nav  area --> 
    <div class="nav_area" id="sticker">
        <div class="container">
            <div class="row">
                <!--logo area-->
                <div class="col-md-3 col-sm-3 col-xs-4">
                    <div class="logo"><a href="http://aboutme.jelastic.servint.net/trang-chu"><img src="<%=request.getContextPath()%>/templates/public/img/logoAdmin.jpg" alt=""></a></div>
                </div>
                <!--end logo area-->
                <!--nav area-->
                <div class="col-md-9 col-sm-9 col-xs-8">
                    <!--  nav menu-->
                    <nav class="menu">
                        <ul class="navid">
                            <li class="current"><a href="/#home">Trang chủ</a></li>
                            <li class=""><a href="/#about-me">Giới thiệu</a></li>
                            <li class=""><a href="/#mypost">Bài viết</a></li>
                            <li class=""><a href="/#portfolio">Dự án</a></li>
                            <li class=""><a href="/#contact-me">Liên hệ</a></li>
                            <li><a href="http://aboutme.jelastic.servint.net/tim-kiem"><i class="fa fa-search"></i></a></li>
                        </ul>
                    </nav>
                    <!--end  nav menu-->
                    <!--moblie menu area-->
                        <div class="dropdown mabile_menu">
                            <a data-toggle="dropdown" class="mobile-menu" href="#"><span> MENU </span><i class="fa fa-bars"></i></a>
                          <ul class="dropdown-menu mobile_menus drop_mobile navid">
                            <li class="current"><a href="/#home">Trang chủ</a></li>
                            <li class=""><a href="/#about-me">Giới thiệu</a></li>
                            <li class=""><a href="/#mypost">Bài viết</a></li>
                            <li class=""><a href="/#portfolio">Dự án</a></li>
                            <li class=""><a href="/#contact-me">Liên hệ</a></li>
                            <li><a href="http://aboutme.jelastic.servint.net/tim-kiem"><i class="fa fa-search"></i></a></li>
                          </ul>
                        </div>  
                        <!--end moblie menu-->                      
                </div>
                <!--end nav area-->
            </div>  
        </div>
    </div>
    <!--end header  area -->    
    	
<!-- HOME SLIDER -->
	<div class="slider-wrap home-1-slider" id="home">
		<div id="mainSlider" class="nivoSlider slider-image">
			<img src="<%=request.getContextPath()%>/templates/public/img/slide1.png" alt="main slider" title="#htmlcaption1"/>
			<img src="<%=request.getContextPath()%>/templates/public/img/slide2.png" alt="main slider" title="#htmlcaption2"/>
			<img src="<%=request.getContextPath()%>/templates/public/img/slide3.png" alt="main slider" title="#htmlcaption3"/>
		</div>
		<%
			int i = 0;
			ModelSlide mdSli = new ModelSlide();
			for(Slide objSli : mdSli.getList()){
				i++;
		%>
		<div id="htmlcaption<%=i %>" class="nivo-html-caption slider-caption-<%=i %>">
			<div class="slider-progress"></div>	
			<div class="container">
				<div class="row">
					<div class="col-md-12">						
						<div class="slide1-text slide-text">
							<div class="middle-text">
								<div class="left_sidet1">
									<div class="cap-title wow slideInRight" data-wow-duration=".9s" data-wow-delay="0s">
										<h1><%=objSli.getName() %></h1>
									</div>
									<div class="cap-dec wow slideInRight" data-wow-duration="1.1s" data-wow-delay="0s">
										<h2><%=objSli.getPreview() %> </h2>
									</div>	
									<div class="cap-readmore animated fadeInUpBig" data-wow-duration="1.5s" data-wow-delay=".5s">
										<a href="<%=objSli.getLink()%>" >Chi tiết</a>
									</div>
								</div>
								<div class="right_sidet1">
									<div class="slide-image1">
										<img class="wow slideInUp"  data-wow-duration="1.5s" data-wow-delay="0s" src="<%=request.getContextPath()%>/files/<%=objSli.getPicture()%>" alt="<%=objSli.getName() %>" />
									</div>									
								</div>				
							</div>
						</div>		
					</div>
				</div>
			</div>					
		</div>
		<%} %>

	</div>
	<!-- HOME SLIDER -->

<!-- About Section -->
<section id="about-me"> 
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">Admin Phước Hưng</h2>
                <h3 class="section-subheading text-muted">sơ lược về bản thân</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <ul class="timeline">
                <%
                	ModelWorks mdW = new ModelWorks();
                	int dem = 0;
                	String nameclass="";
                	for(Work objW : mdW.getListPublic()){
                		dem++;
                		if(dem%2==0){
                			nameclass="class = 'timeline-inverted' ";
                		}else{
                			nameclass="";
                		}
                %>
                                        <li <%=nameclass %>>
                        <div class="timeline-image">
                            <img class="img-circle img-responsive" src="<%=request.getContextPath()%>/files/<%=objW.getPicture() %>" alt="">
                        </div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>Tháng <%=objW.getDate() %></h4>
                                <h4 class="subheading text-bold"><%=objW.getName() %></h4>
                            </div>
                            <div class="timeline-body">
                                <p class="text-muted"><%=objW.getPreview()%></p>
                            </div>
                        </div>
                    </li>
                       <%} %>
                                        <li class="timeline-inverted">
                        <div class="timeline-image">
                            <h4>To be
                                <br>Continue
                                <br>...</h4>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</section>
<!-- end About area -->
<!-- progress area -->
<div class="progress_area bg-light-gray" id="about">
    <div class="container">
        <div class="row">
            <!-- progress content -->
            <div class="col-md-6">
                <div class="progress_text">
                    <h2><span>Skills</span></h2>
                    <p>Những kỹ năng của tôi</p>
                </div>
            </div>
            <!-- end progress content -->
            <!-- progress bar -->
            <div class="col-md-6">
                <div class="progress_content">
                    <!--single progress bar-->
                    <div class="progress  progress-bar-value">                  
                        <div class="progress-bar wow fadeInLeft animated" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="min-width: 60%; visibility: visible; animation-duration: 1.5s; animation-name: fadeInLeft;" data-wow-duration="1.5s">
                            <span class="p_text_left">HTML + CSS</span>
                            <span class="p_text_right">60%</span>
                        </div>
                    </div>
                    <!--single progress bar-->
                    <div class="progress  progress-bar-value">                  
                        <div class="progress-bar wow fadeInLeft animated" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="min-width: 50%; visibility: visible; animation-duration: 1.5s; animation-name: fadeInLeft;" data-wow-duration="1.5s">
                            <span class="p_text_left">JavaScript</span>
                            <span class="p_text_right">50%</span>
                        </div>
                    </div>
                    <!-- end single progress bar-->
                    <!--single progress bar-->
                    <div class="progress  progress-bar-value">                  
                        <div class="progress-bar wow fadeInLeft animated" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="min-width: 50%; visibility: visible; animation-duration: 1.5s; animation-name: fadeInLeft;" data-wow-duration="1.5s">
                            <span class="p_text_left">AJAX</span>
                            <span class="p_text_right">50%</span>
                        </div>
                    </div>
                    <!-- end single progress bar-->
                    <!--single progress bar-->
                    <div class="progress  progress-bar-value">                  
                        <div class="progress-bar wow fadeInLeft animated" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="min-width: 95%; visibility: visible; animation-duration: 1.5s; animation-name: fadeInLeft;" data-wow-duration="1.5s">
                            <span class="p_text_left">JSP-SERVLET</span>
                            <span class="p_text_right">95%</span>
                        </div>
                    </div>
                    <!-- end single progress bar-->
                    <!--single progress bar-->
                    <div class="progress  progress-bar-value">                  
                        <div class="progress-bar wow fadeInLeft animated" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="min-width: 70%; visibility: visible; animation-duration: 1.5s; animation-name: fadeInLeft;" data-wow-duration="1.5s">
                            <span class="p_text_left">JAVA SWING</span>
                            <span class="p_text_right">70%</span>
                        </div>
                    </div>
                    <!-- end single progress bar-->
                </div>
            </div>
            <!-- end progress bar -->
        </div>
    </div>  
</div>
<!--end  progress area -->
<div class="portfolio_area" id="mypost">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">Bài viết</h2>                
            </div>
        </div>          
        <div class="row">
            <div class="col-md-12">
                <div class="portfolio_nav">
                    <ul>
                        <li class="active filter" data-filter=".Tat-Ca">Tất cả</li>
                        <%
                        	ModelCat mdCat = new ModelCat();
                        	int k=0;
                        	for(Category objCat : mdCat.getListCat()){
                        		k++;
                        	
                        %>
                                                <li class="filter" data-filter=".chuyenmuc<%=k%>">
                            <%=objCat.getName() %>                            <a href="/danh-muc/Bai-viet-cua-toi-2.html">
                                <i class="fa fa-play-circle" aria-hidden="true" style="font-size: 20px; line-height: 20px;"></i>
                            </a>
                        </li>
                        <%} %>
                        
                        
                                            </ul>
                </div>
            </div>
            <div class="project_maxitup">
            <!--single portfolio item-->
            <%
            	ModelActicle mdATC = new ModelActicle();
            	for(Acticle objATC : mdATC.getListAll()){
            		String url=request.getContextPath()+"/chi-tiet/"+objATC.getId_acticle()+"/"+LibConvertStringUTF8.createSlug(objATC.getNameATC())+".html";
            
            %>
                        <div class="col-md-4 col-sm-6 mix Tat-Ca" >
                <div class="portfolio">
                    <div class="single_protfolio">
                        <div class="prot_imag">
                            <a class="venobox" href="<%=url%>" target="_blank">
                                <img src="<%=request.getContextPath()%>/files/<%=objATC.getPicture() %>" alt="<%=objATC.getNameATC() %>">
                            </a>
                            <div class="hover_port_text">
                                <h2><a href="<%=url%>"><%=objATC.getNameATC() %></a></h2>
                                <p><%=objATC.getNameCat()%></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%} %>
                        <!-- end single portfolio item-->
            <!--single portfolio item-->
            <%
            	int cm=0;
            	for(Category layIdCat : mdCat.getListCat()){
            		cm++;
            	for(Acticle ObjId : mdATC.getListByIdCat(layIdCat.getId_cat())){
            		
            	String url=request.getContextPath()+"/chi-tiet/"+ObjId.getId_acticle()+"/"+LibConvertStringUTF8.createSlug(ObjId.getNameATC())+".html";
            %>
                        <div class="col-md-4 col-sm-6 mix chuyenmuc<%=cm%>" >
                <div class="portfolio">
                    <div class="single_protfolio">
                        <div class="prot_imag">
                            <a class="venobox" href="<%=url%>">
                                <img src="<%=request.getContextPath()%>/files/<%=ObjId.getPicture() %>" alt="<%=ObjId.getNameATC()%>">
                            </a>
                            <div class="hover_port_text">
                                <h2><a href="<%=url%>"><%=ObjId.getNameATC()%></a></h2>
                                <p><%=ObjId.getNameCat()%></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%} 
            	}%>
            
                        <!-- end single portfolio item-->
            </div>          
        </div>
    </div>  
</div>
<!--end portfolio area -->
<!-- client  area -->
<div class="client_area">
    <div class="container">
        <div class="row">
            <div class="client_own curosel-style client_style">
                   	<%
                   		ModelSaying mdSay = new ModelSaying();
                   		for(Saying objSay : mdSay.getList()){
                   	%>
                    	   	<div class="col-md-12">
			                    <div class="client">
			                        <div class="client_img">
			                            <a href="#"><img src="<%=request.getContextPath()%>/files/<%=objSay.getPicture() %>" alt="<%=objSay.getAuthor() %>" width="150" height="150"></a>
			                        </div>
			                    </div>
			                    <div class="client_content">
			                        <div class="client_text">
			                            <h2><span>Danh ngôn</span></h2>
			                            <p><%=objSay.getContent()%></p>
			                            <a href="#"><%=objSay.getAuthor()%><span></span></a>
			                        </div>
			                    </div>
                			</div>
                		<%} %>
                <div class="owl-controls clickable"><div class="owl-buttons"><div class="owl-prev disabled"><i class="fa fa-angle-left"></i></div><div class="owl-next"><i class="fa fa-angle-right"></i></div></div></div></div>
        </div>
    </div>  
</div>
<!-- end client  area -->
<!-- Portfolio Grid Section -->
<section id="portfolio">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">My Project</h2>
                <h3 class="section-subheading text-muted">Các dự án tôi đã thực hiện.</h3>
            </div>
        </div>
        <div class="row">
        	<%
				ModelProject mdPro = new ModelProject();
        		int modal = -1;
        		for(Project objPro : mdPro.getListLimit3()){
        			modal++;
        			
        	%>
            <div class="col-md-4 col-sm-6 portfolio-item">
                <a href="#modal<%=modal %>" class="portfolio-link" data-toggle="modal">
                    <div class="portfolio-hover">
                        <div class="portfolio-hover-content">
                            <i class="fa fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img src="<%=request.getContextPath()%>/files/<%=objPro.getPicture() %>" class="img-responsive" alt="<%=objPro.getName()%>">
                </a>
                <div class="portfolio-caption">
                    <h4>
                        <a href="<%=objPro.getLink()%>" title="<%=objPro.getLink()%>" target="_blank"><%=objPro.getName()%></a>
                    </h4>
                    <p class="text-muted"><%=objPro.getPreview()%></p>
                </div>
            </div>
                <%} %>
          
         </div>
    </div>
</section>

<!--counter up area -->
<div class="counterup_area" id="work">
    <div class="container">
        <div class="row">
            <!--single counterup item-->
            <div class=" col-sm-4 col-md-4 col-lg-4">
                <div class="counter_up">
                    <div class="iconcounter"><i class="fa fa-coffee"></i></div>
                    <div class="counter">
                    <%
                    	CountView view = (CountView)request.getAttribute("objView");
                    %>
                        <h1 class="number"><%=view.getView() %></h1>
                        <p class="text">Lượt xem</p>
                    </div>
                </div>
            </div>              
            <!--end single counterup item-->
            <!--single counterup item-->
            <div class=" col-sm-4 col-md-4 col-lg-4">
                <div class="counter_up">
                    <div class="iconcounter cb2"><i class="fa fa-download"></i></div>
                    <div class="counter ">
                        <h1 class="number cn2"><%=mdATC.countActicle()%></h1>
                        <p class="text">Số bài viết</p>
                    </div>
                </div>
            </div>
            <!--end single counterup item-->
            <!--single counterup item-->
            <div class=" col-sm-4 col-md-4 col-lg-4">
                <div class="counter_up">
                    <div class="iconcounter cb3"><i class="fa fa-heart"></i></div>
                    <div class="counter">
                        <h1 class="number cn3"><%=mdPro.countProject()%></h1>
                        <p class="text">Số dự án</p>
                    </div>
                </div>
            </div>
            <!--end single counterup item-->
        </div>      
    </div>  
</div>
<!--end counterup area -->
<div class="footer_area" id="contact-me">
    <div class="container">
        <div class="row">
            <!--section title-->
            <div class=" col-sm-12 col-md-12 col-lg-12">    
                <div class="section_title service_color">
                    <h2 class="title"><span>Liên hệ</span></h2>
                </div>
            </div>
            <!--end section title-->
        </div>      
        <div class="row">
            <div class="col-sm-4 col-md-4 col-lg-4">
            <%
            	ModelInfor mdInf = new ModelInfor();
            	Infor itemInf = mdInf.getItemByID(1);
            %>
                <div class="single_address fix">
                    <div class="address_icon"><span><i class="fa fa-map-marker"></i></span></div>
                    <div class="address_text"><p><span>Address: </span><%=itemInf.getAddress() %></p></div>
                </div>
                
                <div class="single_address fix">
                    <div class="address_icon"><span><i class="fa fa-phone"></i></span></div>
                    <div class="address_text"><p><span>Phone: </span><%=itemInf.getPhone() %></p></div>
                </div>
                            <div class="single_address fix">
                    <div class="address_icon"><span><i class="fa fa-envelope-o"></i></span></div>
                    <div class="address_text"><p><span>Email: </span><%=itemInf.getEmail() %></p></div>
                </div>
                            <div class="single_address fix">
                    <div class="address_icon"><span><i class="fa fa-skype"></i></span></div>
                    <div class="address_text"><p><span>Skype: </span><%=itemInf.getSkype()%></p></div>
                </div>
                
            </div>
            <div class="col-sm-4 col-md-4 col-lg-4">
                
                <div class="single_address fix">
                    <div class="address_icon"><span><i class="fa fa-wordpress"></i></span></div>
                    <div class="address_text">
                        <p>
                            <span>Wordpress: </span>
                            <a href="<%=itemInf.getLinkggp()%>" title="Wordpress" style="color: #dddddd"><%=itemInf.getWordpress() %></a>
                        </p>
                    </div>
                </div>
                    
                <div class="single_address fix">
                    <div class="address_icon"><span><i class="fa fa-facebook"></i></span></div>
                    <div class="address_text"><p><span>Facebook: </span><a href="<%=itemInf.getLinkface() %>" title="Wordpress" style="color: #dddddd"><%=itemInf.getFacebook() %></a></p></div>
                </div>
                    
                <div class="single_address fix">
                    <div class="address_icon"><span><i class="fa fa-twitter"></i></span></div>
                    <div class="address_text"><p><span>Twitter: </span><a href="<%=itemInf.getLinktwt() %>" title="Wordpress" style="color: #dddddd"> <%=itemInf.getTwitter() %></a></p></div>
                </div>                  
                    
                <div class="single_address fix">
                    <div class="address_icon"><span><i class="fa fa-google-plus"></i></span></div>
                    <div class="address_text"><p><span>Google Plus: </span><a href="<%=itemInf.getLinkggp() %>" title="Wordpress" style="color: #dddddd"><%=itemInf.getGoogleplus() %></a></p></div>
                </div>                  
                    
            </div>
            <div class="col-sm-4 col-md-4 col-lg-4">
                <form id="formlienhe" action="javascript:void(0);" method="post" novalidate="novalidate">
                    <div class="contract_us">
                        <div class="inputt input_change">
                            <input type="text" name="hoten" class="form-control" id="name" placeholder="Name">
                            <span class="message_icon"><i class="fa fa-user"></i></span>
                        </div>
                        <div class="inputt input_change">
                            <input type="email" name="email" class="form-control" id="email" placeholder="Email">
                            <span class="message_icon"><i class="fa fa-envelope-o"></i></span>
                        </div>
                        <div class="inputt input_change">
                            <input type="text" name="phone" class="form-control" id="phone" placeholder="Phone">
                            <span class="message_icon"><i class="fa fa-phone"></i></span>
                        </div>
                        <div class="inputt">
                            <textarea class="form-control" name="noidung" rows="4" id="mes" placeholder="Message"></textarea>
                            <span class="message_icon"><i class="fa fa-external-link"></i></span>
                        </div>
                        <div class="sunmite_button">
                            <div id="success"></div>
                            <!-- <input type="submit" name="sendcontact" value="Send Messeage" id="submit"  /> -->
                            <button name="sendcontact" id="submit">Send Message</button>
                        </div>
                    </div>
                </form>
            </div>              
        </div>
    </div>          
</div>

<!-- Portfolio Modal Dự án -->
<%
	int modall=-1;
	for(Project objP : mdPro.getListLimit3()){
		modall++;
	
%>
<div class="portfolio-modal modal fade" id="modal<%=modall %>" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <!-- Project Details Go Here -->
                            <h2><%=objP.getName() %></h2>
                            <p><%=objP.getPreview() %></p>
                            <img class="img-responsive img-centered" src="<%=request.getContextPath()%>/files/<%=objP.getPicture() %>" alt="<%=objP.getName()%>">
                            <p>Link dự án: <a href="<%=objP.getLink() %>" title="<%=objP.getLink() %>" target="_blank"><%=objP.getLink() %></a></p>
                            <button class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%} %>
 <%@include file="/templates/public/inc/footer.jsp" %>
   