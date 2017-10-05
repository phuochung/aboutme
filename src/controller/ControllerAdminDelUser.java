package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Acticle;
import bean.User;
import library.LibraryCheckUser;
import model.ModelActicle;
import model.ModelCat;
import model.ModelUser;

/**
 * Servlet implementation class ControllerAdminActicle
 */

public class ControllerAdminDelUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminDelUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		if(!LibraryCheckUser.checkUser(request, response)){
			return;
		}
		HttpSession session = request.getSession();
		User checkU = (User)session.getAttribute("sObjUser");
		ModelUser mdU = new ModelUser();
		ModelActicle mdATC = new ModelActicle();
		int idU=0;
		if(request.getParameter("idU")!= null){
			 idU = Integer.parseInt(request.getParameter("idU"));
			 User user = mdU.getItemByID(idU);
			 String rank = user.getRank();
			 if("Ad".equals(rank)){
				 //response.getWriter().print("<p>Không đc xóa ad nhé !</p>");
				 response.sendRedirect(request.getContextPath()+"/admin/user?msg=6");
				 return;
			 }
			 if(!(checkU.getRank().equals("Ad"))&&(checkU.getId_user()!=idU)){
				 response.sendRedirect(request.getContextPath()+"/admin/user?msg=5");
				 return;
			 }
			 if(!(checkU.getRank().equals("Ad"))&&(checkU.getId_user()==idU)){
				 if(mdU.delUser(idU)>0){
					 mdATC.delATCByFullname(user.getFullname());
					 response.sendRedirect(request.getContextPath()+"/admin/logout");
					 return;
				 }
			 }
			 if(checkU.getRank().equals("Ad")){
				 if(mdU.delUser(idU)>0){
					 mdATC.delATCByFullname(user.getFullname());
					 response.sendRedirect(request.getContextPath()+"/admin/user?msg=3");
					 return;
				 }
				 else{
					 response.sendRedirect(request.getContextPath()+"/admin/user?msg=0");
					 return;
				 }
			 }
			 
			
			
		}
	}
}
