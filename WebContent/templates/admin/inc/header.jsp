<%@page import="bean.User"%>
<html lang="en">
<head>
        <title>Administrator | Phuoc Hung</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">  
        <meta name="description" content="Trung tâm đào tạo lập trình VineEnter">
        <meta name="author" content="vinaenter">

         <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
         <!-- Datatable -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/templates/admin/css/jquery.dataTables.min.css">
        <link href="<%=request.getContextPath()%>/templates/admin/css/font-awesome.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/templates/admin/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/templates/admin/css/templatemo-style.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/templates/admin/css/style.css" rel="stylesheet">
        <link rel="shortcut icon" type="image/ico" href="<%=request.getContextPath()%>/templates/admin/css/images/favicon_admin.png" />
        
        <!-- JS -->
        <script src="<%=request.getContextPath()%>/templates/admin/js/jquery-1.11.2.min.js"></script>
        <script src="<%=request.getContextPath()%>/templates/admin/js/bootstrap.min.js"></script>
        <!-- Datatable -->
        <script src="<%=request.getContextPath()%>/templates/admin/js/jquery.dataTables.min.js"></script>

        <script type="text/javascript" src="<%=request.getContextPath()%>/templates/admin/js/jquery.validate.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/templates/admin/js/validate.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/libraries/ckeditor/ckeditor.js"></script>
        

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="templatemo-flex-row">
<div class="templatemo-sidebar">
  <header class="templatemo-site-header">
    <div class="square"></div>
    <%
    	User user = (User)session.getAttribute("sObjUser");
    %>
    <h1><%=user.getFullname() %></h1>
  </header>
  <div class="profile-photo-container">
    <img src="<%=request.getContextPath()%>/templates/admin/images/abc.jpg" alt="Profile Photo" class="img-responsive"> 
    <div class="profile-photo-overlay"></div>
  </div>      
  <!-- Search box -->
  <!-- <form class="templatemo-search-form" role="search">
    <div class="input-group">
        <button type="submit" class="fa fa-search"></button>
        <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">           
    </div>
  </form> -->