package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.AdminEventBeans;

/**
 * Servlet implementation class AdminEventAction
 */
public class AdminEventAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEventAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("inside post:::::::::::");
		
		String ename = request.getParameter("Ename");
		String edesc = request.getParameter("Edesc");
		//String main_page_image = request.getParameter("");
		String eyurl= request.getParameter("Eyurl");
		String eiurl= request.getParameter("Eiurl");
		String etype= request.getParameter("Etype");
		
		int error_status = 0;
		AdminEventBeans adminEventBeans = new AdminEventBeans();
		adminEventBeans.setEname(ename);
		adminEventBeans.setEdesc(edesc);
		//
		adminEventBeans.setEyurl(eyurl);
		adminEventBeans.setEiurl(eiurl);
		adminEventBeans.setEtype(etype);
		
		System.out.println(adminEventBeans.getEname());
		System.out.println(adminEventBeans.getEdesc());
		//System.out.println(adminEventBeans.);
		
		System.out.println(adminEventBeans.getEyurl());
		System.out.println(adminEventBeans.getEiurl());
		System.out.println(adminEventBeans.getEtype());
		if(error_status == 0) {
			
			try{  
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement?autoReconnect=true&useSSL=false","root","root");  
				
				PreparedStatement stmt = con.prepareStatement("insert into eventadmin(Ename,Edesc,Eyurl,Eiurl,Etype) values(?,?,?,?,?)");
				stmt.setString(1, adminEventBeans.getEname());
				stmt.setString(2, adminEventBeans.getEdesc());
				stmt.setString(3, adminEventBeans.getEyurl());
				stmt.setString(4, adminEventBeans.getEiurl());
				stmt.setString(5, adminEventBeans.getEtype());
				
				int  i = stmt.executeUpdate();  
				System.out.println(i+" records inserted"); 
				
				con.close();  
			} catch(Exception e) { 
				e.printStackTrace();
			}  
		
		
		request.setAttribute("error_msg", "update done");
		request.getRequestDispatcher("/Event_admin.jsp").forward(request, response);
		}
	}
}