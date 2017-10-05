package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Acticle;
import bean.User;
import library.LibraryCheckUser;
import model.ModelActicle;

/**
 * Servlet implementation class ControllerAdminActicle
 */
@MultipartConfig
public class ControllerAdminActicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminActicle() {
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
		//System.out.println(request.getServletContext().getRealPath(""));
		if(!LibraryCheckUser.checkUser(request, response)){
			return;
		}
		HttpSession session = request.getSession();
		User Ulogin = (User)session.getAttribute("sObjUser");
		ModelActicle mdATC = new ModelActicle();
		int result=0;
		if(request.getParameter("dels")!=null){
			for(String id : request.getParameterValues("iddel[]")){
				int idATC=Integer.valueOf(id);
				Acticle obj = mdATC.getItemByID(idATC);
				if((("Member".equalsIgnoreCase(Ulogin.getRank()))||("Mod".equalsIgnoreCase(Ulogin.getRank())))&&(!obj.getUser().equalsIgnoreCase(Ulogin.getFullname()))){
					//bai viet k phai cua minh nen khong xoa dc
				}
				else if(mdATC.delCat(idATC)>0){
					String urlImg = request.getServletContext().getRealPath("")+File.separator+"files"+File.separator+obj.getPicture();
					File file=new File(urlImg);
					file.delete();
					result=1;
				}
				
			}
			if(result==1 && "Ad".equalsIgnoreCase(Ulogin.getRank())){
				response.sendRedirect(request.getContextPath()+"/admin/acticle?msg=3");
				return;
			}
			else if(result==1){
				response.sendRedirect(request.getContextPath()+"/admin/acticle?msg=6");
				return;
			}
			else{
				response.sendRedirect(request.getContextPath()+"/admin/acticle?msg=0");
				return;
			}
		}
		else{
			ArrayList<Acticle> listATC = mdATC.getList();
			request.setAttribute("listATC", listATC);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/acticle.jsp");
			rd.forward(request, response);
		}
		
	}

}
