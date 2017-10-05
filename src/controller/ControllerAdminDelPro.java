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
import model.ModelProject;

/**
 * Servlet implementation class ControllerAdminActicle
 */

public class ControllerAdminDelPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminDelPro() {
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
			response.sendRedirect(request.getContextPath()+"/admin/project?msg=6");
			return;
		}
		ModelProject mdPro = new ModelProject();
		if(request.getParameter("idP")!=null){
			int idPro = Integer.valueOf(request.getParameter("idP"));
			if(mdPro.delPro(idPro)>0){
				response.sendRedirect(request.getContextPath()+"/admin/project?msg=3");
				return;
			}else{
				response.sendRedirect(request.getContextPath()+"/admin/project?msg=0");
				return;
			}
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("/admin/project.jsp");
			rd.forward(request, response);
		}
	}

}
