package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTMLDocument.HTMLReader.IsindexAction;

import bean.Acticle;
import model.ModelActicle;

/**
 * Servlet implementation class ControllerAdminAjaxActicle
 */

public class ControllerAdminAjaxActicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminAjaxActicle() {
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
		String ketqua = "";
		ModelActicle mdATC = new ModelActicle();
		int id_act = Integer.parseInt(request.getParameter("aid_act"));
		int is_active = Integer.parseInt(request.getParameter("ais_active"));
		if(is_active==0){
			is_active=1;
		}else
		if(is_active==1){
			is_active=0;
		}
		//System.out.println(id_act+"-"+is_active);
		Acticle objA = new Acticle(id_act, "", "", is_active, "", "");
	
		mdATC.editAtcAjax(objA);
			//System.out.println(12);
		if(is_active==1){
			ketqua = "<a href=\"javascript:void(0)\" title=\"ngừng kích hoạt\"><img src=\""+request.getContextPath()+"/templates/admin/images/tick-circle.gif\" alt=\"\" /></a>";
		}else if(is_active==0){
			ketqua = "<a class=\"noacticle\" href=\"javascript:void(0)\" title=\"kích hoạt\"><img src=\""+request.getContextPath()+"/templates/admin/images/minus-circle.gif\" alt=\"\" /></a>" ;
	
		}
		response.getWriter().print(ketqua);

	}

}
