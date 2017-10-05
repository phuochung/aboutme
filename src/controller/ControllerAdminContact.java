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
import bean.Advs;
import bean.Contact;
import bean.User;
import library.LibraryCheckUser;
import model.ModelActicle;
import model.ModelAdvs;
import model.ModelCat;
import model.ModelContact;

/**
 * Servlet implementation class ControllerAdminActicle
 */

public class ControllerAdminContact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminContact() {
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
		int result=0;
		ModelContact mdCon = new ModelContact();
		if(request.getParameter("dels")!=null){
			User Ulogin = (User)session.getAttribute("sObjUser");
			if(!"Ad".equals(Ulogin.getRank())){
				for(String id : request.getParameterValues("iddel[]")){
					int idC=Integer.valueOf(id);
					result = mdCon.delCon(idC);
				}
				if(result>0){
					response.sendRedirect(request.getContextPath()+"/admin/contact?msg=3");
					return;
				}else{
					response.sendRedirect(request.getContextPath()+"/admin/contact?msg=0");
					return;
				}
			}else{
				response.sendRedirect(request.getContextPath()+"/admin/contact?msg=4");
				return;
			}
			
		}else{
			ArrayList<Contact> listCon= mdCon.getList();
			request.setAttribute("listCon", listCon);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/contact.jsp");
			rd.forward(request, response);
		}
		
	}

}
