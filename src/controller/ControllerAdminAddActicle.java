package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.websocket.Session;

import org.apache.tomcat.util.buf.UEncoder;

import bean.Acticle;
import bean.Category;
import bean.User;
import library.GetFileName;
import library.LibraryCheckUser;
import model.ModelActicle;
import model.ModelCat;

/**
 * Servlet implementation class ControllerAdminActicle
 */
@MultipartConfig
public class ControllerAdminAddActicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminAddActicle() {
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
		HttpSession session = request.getSession();
		if(!LibraryCheckUser.checkUser(request, response)){
			return;
		}
		User user = (User)session.getAttribute("sObjUser");
		if("Member".equals(user.getRank())){
			response.sendRedirect(request.getContextPath()+"/admin/acticle?msg=7");
			return;
		}
		ModelCat mdCat = new ModelCat();
		ModelActicle mdATC = new ModelActicle();
		if(request.getParameter("submit")!=null){
			String tentin = new String(request.getParameter("tentin").getBytes(
					"ISO-8859-1"), "UTF-8");
			int idCat = Integer.parseInt(request.getParameter("danhmuc"));
			String mota = new String(request.getParameter("mota").getBytes(
					"ISO-8859-1"), "UTF-8");
			String chitiet = new String(request.getParameter("chitiet")
					.getBytes("ISO-8859-1"), "UTF-8");
			Part part = request.getPart("hinhanh");
			String getfileName = GetFileName.getFileName(part);
			if (!"".equals("getfileName")) {
				System.out.println(getfileName);
				String UrlDir = request.getServletContext().getRealPath("")
						+ File.separator + "files";
				File fileDir = new File(UrlDir);
				if (!fileDir.exists()) {
					fileDir.mkdir();
				}
				String urlImg = UrlDir + File.separator + getfileName;
				System.out.println(urlImg);
				OutputStream out = null;
				InputStream filecontent = null;
				try {
					out = new FileOutputStream(new File(urlImg));
					filecontent = part.getInputStream();
					int read = 0;
					final byte[] bytes = new byte[1024];
					while ((read = filecontent.read(bytes)) != -1) {
						out.write(bytes, 0, read);
					}
				} catch (FileNotFoundException fne) {
					fne.printStackTrace();
				} finally {
					if (out != null) {
						out.close();
					}
					if (filecontent != null) {
						filecontent.close();
					}
				}

			}
			int read=0;
			int is_active=1;
			SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
			String date=sdf.format(new Date());
			
			Acticle item = new Acticle(0, tentin, idCat, is_active, getfileName, date, mota, chitiet, user.getFullname(), read);
			if(mdATC.addATC(item)>0){
				response.sendRedirect(request.getContextPath()+"/admin/acticle?msg=1");
				return;
			}
			else{
				response.sendRedirect(request.getContextPath()+"/admin/acticle?msg=0");
				return;
			}
		}else{
			ArrayList<Category> listCat = mdCat.getListCat();
			request.setAttribute("listCat", listCat);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/addActicle.jsp");
			rd.forward(request, response);
		}
		
	}

}
