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

import bean.Acticle;
import bean.Advs;
import bean.Category;
import bean.Project;
import bean.Saying;
import bean.User;
import library.GetFileName;
import library.LibraryCheckUser;
import model.ModelActicle;
import model.ModelAdvs;
import model.ModelCat;
import model.ModelProject;
import model.ModelSaying;

/**
 * Servlet implementation class ControllerAdminActicle
 */
@MultipartConfig
public class ControllerAdminEditActicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminEditActicle() {
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
		ModelActicle mdATC = new ModelActicle();
		ModelCat mdCat = new ModelCat();
		int idATC=0;
		if(request.getParameter("idA")!=null){
			idATC = Integer.parseInt(request.getParameter("idA"));
		}
		ArrayList<Category> itemCat = mdCat.getListCat();
		Acticle item = mdATC.getItemByID(idATC);
		if((("Member".equalsIgnoreCase(Ulogin.getRank()))||("Mod".equalsIgnoreCase(Ulogin.getRank())))&&(!item.getUser().equalsIgnoreCase(Ulogin.getFullname()))){
			response.sendRedirect(request.getContextPath()+"/admin/acticle?msg=4");
			return;
		}
		if(request.getParameter("sua")!=null){
			String tentin = new String(request.getParameter("tentin").getBytes(
					"ISO-8859-1"), "UTF-8");
			int idCat =Integer.valueOf(request.getParameter("danhmuc"));
			String mota = new String(request.getParameter("mota").getBytes(
					"ISO-8859-1"), "UTF-8");
			String chitiet = new String(request.getParameter("cktext").getBytes(
					"ISO-8859-1"), "UTF-8");
			Part part = request.getPart("hinhanh");
			String getfileName = GetFileName.getFileName(part);
			if (!"".equals(getfileName)) {
				if(!"".equals(item.getPicture())){
					String urlImgcu=request.getServletContext().getRealPath("")+File.separator+"files"+File.separator+item.getPicture();
					File fileDel=new File(urlImgcu);
					fileDel.delete();
				}
				//System.out.println(getfileName);
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

			}else{
				getfileName=item.getPicture();
			}
			Acticle Obj = new Acticle(idATC, tentin, idCat, 0, getfileName, null, mota, chitiet, null, 0);
			if(mdATC.editATC(Obj)>0){
				response.sendRedirect(request.getContextPath()+"/admin/acticle?msg=2");
				return;
			}else{
				response.sendRedirect(request.getContextPath()+"/admin/acticle?msg=0");
				return;
			}
				
		}else{
			
			request.setAttribute("item", item);
			request.setAttribute("itemCat", itemCat);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/editActicle.jsp");
			rd.forward(request, response);
		}
		
	}

	}

