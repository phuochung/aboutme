package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import model.ModelUser;

/**
 * Servlet implementation class ControllerPublicAbout
 */
@MultipartConfig
public class ControllerAdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		
		ModelUser mdU = new ModelUser();
		HttpSession session=request.getSession();
		if(request.getParameter("submit")!=null){
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			User objUser=mdU.getUserByUserPass(username, password);
			if(objUser != null){
				session.setAttribute("sObjUser", objUser);
				response.sendRedirect(request.getContextPath()+"/admin/trangchu");
				return;
			}else{
				response.sendRedirect(request.getContextPath()+"/admin/login?msg=0");
				return;
			}
		}else{
			RequestDispatcher rd=request.getRequestDispatcher("/admin/login.jsp");
			rd.forward(request, response);
		}
		
	}
	
}
