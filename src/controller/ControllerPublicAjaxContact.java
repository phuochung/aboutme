package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Acticle;
import bean.Contact;
import model.ModelActicle;
import model.ModelContact;

/**
 * Servlet implementation class ControllerAdminActicle
 */
@MultipartConfig
public class ControllerPublicAjaxContact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerPublicAjaxContact() {
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
		ModelContact mdCon = new ModelContact();
		String name = request.getParameter("aname");
		String phone = request.getParameter("aphone");
		String email = request.getParameter("aemail");
		String message = request.getParameter("amessage");
		Contact contact = new Contact(0, name, email, phone, message);
		int a = mdCon.sendCont(contact);
		
	}

}
