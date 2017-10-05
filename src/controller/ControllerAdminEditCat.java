package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Category;
import bean.User;
import library.LibraryCheckUser;
import model.ModelCat;

/**
 * Servlet implementation class ControllerAdminActicle
 */
@MultipartConfig
public class ControllerAdminEditCat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminEditCat() {
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
			response.sendRedirect(request.getContextPath()+"/admin/danhmuc?msg=5");
			return;
		}
		ModelCat mdCat = new ModelCat();
		int idCat=0;
		if(request.getParameter("idC")!=null){
			idCat = Integer.parseInt(request.getParameter("idC"));
		}
		if(request.getParameter("sua")!=null){
			String name = new String(request.getParameter("ten").getBytes(
					"ISO-8859-1"), "UTF-8");
			Category objC = new Category(idCat, name);
			if(mdCat.editCat(objC)>0){
				response.sendRedirect(request.getContextPath()+"/admin/danhmuc?msg=2");
				return;
			}else{
				response.sendRedirect(request.getContextPath()+"/admin/danhmuc?msg=0");
				return;
			}
		}else{
			request.setAttribute("objCat", mdCat.getNameCat(idCat));
			RequestDispatcher rd = request.getRequestDispatcher("/admin/editCat.jsp");
			rd.forward(request, response);
		}
		
	}

}
