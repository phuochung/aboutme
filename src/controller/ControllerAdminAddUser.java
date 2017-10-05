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
import library.LibStringMd5;
import library.LibraryCheckUser;
import model.ModelUser;

/**
 * Servlet implementation class ControllerAdminActicle
 */
@MultipartConfig
public class ControllerAdminAddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminAddUser() {
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
		User user = (User)session.getAttribute("sObjUser");
		if(!user.getRank().equals("Ad")){
			response.sendRedirect(request.getContextPath()+"/admin/user?msg=7");
			return;		}
		ModelUser mdU = new ModelUser();
		if(request.getParameter("them")!=null){
			String username = new String(request.getParameter("username").getBytes(
					"ISO-8859-1"), "UTF-8");
			String fullname = new String(request.getParameter("fullname").getBytes(
					"ISO-8859-1"), "UTF-8");
			String rank = new String(request.getParameter("cap").getBytes(
					"ISO-8859-1"), "UTF-8");
			String pass = new String(request.getParameter("password").getBytes(
					"ISO-8859-1"), "UTF-8");
			pass=LibStringMd5.LibStringMd5(pass);
			User objU = new User(0, username, pass, fullname, rank);
			if(mdU.addUser(objU)>0){
				response.sendRedirect(request.getContextPath()+"/admin/user?msg=1");
				return;
			}
			else{
				response.sendRedirect(request.getContextPath()+"/admin/user?msg=0");
				return;
			}
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("/admin/addUser.jsp");
			rd.forward(request, response);
		}
		
	}

}
