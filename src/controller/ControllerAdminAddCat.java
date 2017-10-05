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
import bean.Category;
import bean.User;
import library.LibraryCheckUser;
import model.ModelActicle;
import model.ModelCat;

/**
 * Servlet implementation class ControllerAdminActicle
 */

public class ControllerAdminAddCat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminAddCat() {
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
		if(("Member".equals(Ulogin.getRank()))||("Mod").equals(Ulogin.getRank())){
			response.sendRedirect(request.getContextPath()+"/admin/danhmuc?msg=4");
			return;
		}
		ModelCat mdCat = new ModelCat();
		if(request.getParameter("them")!=null){
			String ten = new String(request.getParameter("ten").getBytes(
					"ISO-8859-1"), "UTF-8");
			Category cat = new Category(0, ten);
			if(mdCat.addCat(cat)>0){
				response.sendRedirect(request.getContextPath()+"/admin/danhmuc?msg=1");
				return;
			}
			else{
				response.sendRedirect(request.getContextPath()+"/admin/danhmuc?msg=0");
				return;
			}
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("/admin/addCat.jsp");
			rd.forward(request, response);
		}
		
	}

}
