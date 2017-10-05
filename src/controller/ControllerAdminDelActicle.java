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

/**
 * Servlet implementation class ControllerAdminActicle
 */

public class ControllerAdminDelActicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminDelActicle() {
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
		User Ulogin = (User)session.getAttribute("sObjUser");
		
		ModelActicle mdATC = new ModelActicle();
		if(request.getParameter("idA")!=null){
			int idATC = Integer.valueOf(request.getParameter("idA"));
			Acticle item = mdATC.getItemByID(idATC);
			if((("Member".equalsIgnoreCase(Ulogin.getRank()))||("Mod".equalsIgnoreCase(Ulogin.getRank())))&&(!item.getUser().equalsIgnoreCase(Ulogin.getFullname()))){
				response.sendRedirect(request.getContextPath()+"/admin/acticle?msg=5");
				return;
			}
			if(mdATC.delCat(idATC)>0){
				response.sendRedirect(request.getContextPath()+"/admin/acticle?msg=3");
				return;
			}else{
				response.sendRedirect(request.getContextPath()+"/admin/acticle?msg=0");
				return;
			}
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("/admin/acticle.jsp");
			rd.forward(request, response);
		}
		
			}

}
