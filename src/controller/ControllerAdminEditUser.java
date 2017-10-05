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
import javax.websocket.Session;

import org.apache.tomcat.util.buf.CharChunk;

import bean.Project;
import bean.Saying;
import bean.User;
import library.GetFileName;
import library.LibStringMd5;
import library.LibraryCheckUser;
import model.ModelProject;
import model.ModelRank;
import model.ModelSaying;
import model.ModelUser;

/**
 * Servlet implementation class ControllerAdminActicle
 */
@MultipartConfig
public class ControllerAdminEditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminEditUser() {
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
		ModelUser mdUser = new ModelUser();
		ModelRank mdRank = new ModelRank();
		int idUser=0;
		if(request.getParameter("idU")!=null){
			idUser = Integer.parseInt(request.getParameter("idU"));
		}
		
		User item = mdUser.getItemByID(idUser);
		User Ucheck=(User)session.getAttribute("sObjUser");
		if(((Ucheck.getRank().equals("Mod"))||(Ucheck.getRank().equals("Member")))&&(Ucheck.getId_user()!=idUser)){
			response.sendRedirect(request.getContextPath()+"/admin/user?msg=4");
			return;
		}
		if(request.getParameter("sua")!=null){
			String fullname = new String(request.getParameter("fullname").getBytes(
					"ISO-8859-1"), "UTF-8");
			String rank = new String(request.getParameter("cap").getBytes(
					"ISO-8859-1"), "UTF-8");
			String pass = new String(request.getParameter("password").getBytes(
					"ISO-8859-1"), "UTF-8");
			pass=LibStringMd5.LibStringMd5(pass);
			User objU = new User(0, item.getUsername(), pass, fullname, rank);
			if(mdUser.editUser(objU)>0){
				response.sendRedirect(request.getContextPath()+"/admin/user?msg=2");
				return;
			}else{
				response.sendRedirect(request.getContextPath()+"/admin/user?msg=0");
				return;
			}
		}else{
			request.setAttribute("listRank", mdRank.getList());
			request.setAttribute("item", item);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/editUser.jsp");
			rd.forward(request, response);
		}
		
	}

}
