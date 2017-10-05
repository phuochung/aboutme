<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<footer class="text-right">
	<p>Design By Phước Hưng</p>
</footer>
         
        </div>  
      </div>
    </div>
    <script type="text/javascript" src="<%=request.getContextPath()%>/templates/admin/js/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->

    <script type="text/javascript" src="<%=request.getContextPath()%>/templates/admin/js/templatemo-script.js"></script>      <!-- Templatemo Script -->    

	<script>
      $(document).ready(function(){
        // Content widget with background image
        var imageUrl = $('img.content-bg-img').attr('src');
        $('.templatemo-content-img-bg').css('background-image', 'url(' + imageUrl + ')');
        $('img.content-bg-img').hide();        
      });
    </script>	
  </body>
</html>