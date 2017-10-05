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
import bean.Project;
import bean.Saying;
import bean.Slide;
import bean.User;
import library.GetFileName;
import library.LibraryCheckUser;
import model.ModelAdvs;
import model.ModelProject;
import model.ModelSaying;
import model.ModelSlide;

/**
 * Servlet implementation class ControllerAdminActicle
 */
@MultipartConfig
public class ControllerAdminEditSlide extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminEditSlide() {
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
			response.sendRedirect(request.getContextPath()+"/admin/slide?msg=5");
			return;
		}
		ModelSlide mdSli = new ModelSlide();
		
		int idSli=0;
		if(request.getParameter("idS")!=null){
			idSli = Integer.parseInt(request.getParameter("idS"));
		}
		Slide item = mdSli.getItemByID(idSli);
		if(request.getParameter("sua")!=null){
			String name = new String(request.getParameter("slider").getBytes(
					"ISO-8859-1"), "UTF-8");
			String link = new String(request.getParameter("linksl").getBytes(
					"ISO-8859-1"), "UTF-8");
			String mota = new String(request.getParameter("mota").getBytes(
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
			Slide objSli = new Slide(idSli, name, mota, getfileName, link);
			if(mdSli.editSli(objSli)>0){
				response.sendRedirect(request.getContextPath()+"/admin/slide?msg=2");
				return;
			}else{
				response.sendRedirect(request.getContextPath()+"/admin/slide?msg=0");
				return;
			}
		}else{
			
			request.setAttribute("item", item);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/editSlide.jsp");
			rd.forward(request, response);
		}
		
	}

}
