package controller;

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
import bean.CountView;
import bean.IpClient;
import library.GetIpAddress;
import model.ModelActicle;
import model.ModelCountView;

/**
 * Servlet implementation class ControllerAdminActicle
 */
@MultipartConfig
public class ControllerPublicDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerPublicDetail() {
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
		ModelActicle mdATC = new ModelActicle();
		ModelCountView mdcv = new ModelCountView();
		CountView cview = mdcv.getCountView();
		int idATC = 0;
		if(request.getParameter("idA")!=null){
			 idATC = Integer.parseInt(request.getParameter("idA"));
		}
		Acticle item = mdATC.getItemByID(idATC);
		String ipClient = null;
		try {
			 ipClient = GetIpAddress.getClientIpAddress(request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(ipClient);
		IpClient ObjIpCliCheck = (IpClient)session.getAttribute("objIpCli");
		try {
			if((ObjIpCliCheck.getIpadress().equals(ipClient))&&(ObjIpCliCheck.getId_acticle()==idATC)){
				//khong tang luot xem len
			}
			else{
				mdATC.riseView(item,idATC);
				mdcv.riseView(cview.getView());
			}
		} catch (NullPointerException e) {
			// TODO: handle exception
			mdATC.riseView(item,idATC);
			mdcv.riseView(cview.getView());
			
		}
		
		IpClient objIpCli = new IpClient(idATC, ipClient);
		session.setAttribute("objIpCli", objIpCli);
		ArrayList<Acticle> listTMN = mdATC.getListTMN(idATC);
		request.setAttribute("listTMN", listTMN);
		request.setAttribute("item", mdATC.getItemByID(idATC));
		RequestDispatcher rd = request.getRequestDispatcher("/detail.jsp");
		rd.forward(request, response);
	}

}
