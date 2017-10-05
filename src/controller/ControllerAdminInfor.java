package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import bean.Advs;
import bean.Infor;
import bean.Project;
import bean.Saying;
import bean.User;
import library.GetFileName;
import library.LibraryCheckUser;
import model.ModelAdvs;
import model.ModelInfor;
import model.ModelProject;
import model.ModelSaying;

/**
 * Servlet implementation class ControllerAdminActicle
 */
@MultipartConfig
public class ControllerAdminInfor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminInfor() {
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
		ModelInfor mdInf = new ModelInfor();
		User Ulogin = (User)session.getAttribute("sObjUser");
		Infor item = mdInf.getItemByID(1);
		if(request.getParameter("sua")!=null){
			if("Ad".equals(Ulogin.getRank())){
				String address = new String(request.getParameter("diachi").getBytes(
						"ISO-8859-1"), "UTF-8");
				int phone = Integer.valueOf(request.getParameter("sdt"));
				String email = new String(request.getParameter("email").getBytes(
						"ISO-8859-1"), "UTF-8");
				String skype = new String(request.getParameter("skype").getBytes(
						"ISO-8859-1"), "UTF-8");
				String wordpress = new String(request.getParameter("wordpress").getBytes(
						"ISO-8859-1"), "UTF-8");
				String facebook = new String(request.getParameter("facebook").getBytes(
						"ISO-8859-1"), "UTF-8");
				String linkface = new String(request.getParameter("lfacebook").getBytes(
						"ISO-8859-1"), "UTF-8");
				String twitter = new String(request.getParameter("twitter").getBytes(
						"ISO-8859-1"), "UTF-8");
				String linktwt = new String(request.getParameter("ltwitter").getBytes(
						"ISO-8859-1"), "UTF-8");
				String googleplus = new String(request.getParameter("ugoogleplus").getBytes(
						"ISO-8859-1"), "UTF-8");
				String linkggp = new String(request.getParameter("lgoogleplus").getBytes(
						"ISO-8859-1"), "UTF-8");
				Infor objInf = new Infor(0, address, phone, email, skype, wordpress, facebook, linkface, twitter, linktwt, googleplus, linkggp);
				if(mdInf.editInf(objInf)>0){
					Infor obj = mdInf.getItemByID(1);
					request.setAttribute("item", obj);
					RequestDispatcher rd = request.getRequestDispatcher("/admin/infor.jsp?msg=1");
					rd.forward(request, response);
				}else{
					request.setAttribute("item", item);
					RequestDispatcher rd = request.getRequestDispatcher("/admin/infor.jsp?msg=0");
					rd.forward(request, response);
				}
			}else{
				request.setAttribute("item", item);
				RequestDispatcher rd = request.getRequestDispatcher("/admin/infor.jsp?msg=2");
				rd.forward(request, response);
			}
			
		}else{
			request.setAttribute("item", item);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/infor.jsp");
			rd.forward(request, response);
		}
		
	}

}
