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
import bean.Category;
import constant.Define;
import model.ModelActicle;
import model.ModelCat;

/**
 * Servlet implementation class ControllerAdminActicle
 */
@MultipartConfig
public class ControllerPublicActicleOfCat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerPublicActicleOfCat() {
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
		ModelCat mdCat = new ModelCat();
		ModelActicle mdATC = new ModelActicle();
		int idCat = 0;
		if(request.getParameter("idC")!= null){
			idCat = Integer.parseInt(request.getParameter("idC"));
		}
		request.setAttribute("idCat", idCat);
		int page = 1;
		if(request.getParameter("page")!=null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		request.setAttribute("page", page);
		Category objCat = mdCat.getNameCat(idCat);
		request.setAttribute("objCat", objCat);
		int sotin = mdATC.getCountNewByIdCat(idCat);
		int row_count = Define.ROW_COUNT;
		int offset = (page-1)*row_count;
		int sotrang = (int)Math.ceil((double)sotin/row_count);
		request.setAttribute("sotrang", sotrang);
		ArrayList<Acticle> list = mdATC.getListByIdCatOffRowC(offset,row_count,idCat);
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("/acticleOfCat.jsp");
		rd.forward(request, response);
	}

}
