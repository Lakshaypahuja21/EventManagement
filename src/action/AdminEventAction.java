package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

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
		String imname = request.getParameter("ImageName");
		String eyurl= request.getParameter("Eyurl");
		String eiurl= request.getParameter("Eiurl");
		String etype= request.getParameter("Etype");
		String noOfSeat = request.getParameter("NoOfSeat");
		
		int error_status = 0;
		AdminEventBeans adminEventBeans = new AdminEventBeans();
		adminEventBeans.setEname(ename);
		adminEventBeans.setEdesc(edesc);
		//
		adminEventBeans.setEyurl(eyurl);
		adminEventBeans.setEiurl(eiurl);
		adminEventBeans.setEtype(etype);
		adminEventBeans.setImname(imname);
		adminEventBeans.setNo_of_seat(noOfSeat);
		
		System.out.println(adminEventBeans.getEname());
		System.out.println(adminEventBeans.getEdesc());
		//System.out.println(adminEventBeans.);
		
		System.out.println(adminEventBeans.getEyurl());
		System.out.println(adminEventBeans.getEiurl());
		System.out.println(adminEventBeans.getEtype());
		
		SimpleDateFormat sf = new SimpleDateFormat("dd-MM-YYYY");
		if(error_status == 0) {
			
			try{  
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement?autoReconnect=true&useSSL=false","root","root");  
				
				PreparedStatement stmt = con.prepareStatement("insert into eventadmin(Ename,Edesc,Eyurl,Eiurl,Etype,Imname,no_of_seat,subject,created_date,is_active,avl_seat) values(?,?,?,?,?,?,?,?,?,?,?)");
				stmt.setString(1, adminEventBeans.getEname());
				stmt.setString(2, adminEventBeans.getEdesc());
				stmt.setString(3, adminEventBeans.getEyurl());
				stmt.setString(4, adminEventBeans.getEiurl());
				stmt.setString(5, adminEventBeans.getEtype());
				stmt.setString(6, adminEventBeans.getImname());
				
				stmt.setString(7, adminEventBeans.getNo_of_seat());
				stmt.setString(8, adminEventBeans.getEsubject());
				stmt.setString(9, sf.format(new Date()));
				stmt.setString(10, "1");
				stmt.setString(11, adminEventBeans.getNo_of_seat());
				
				
				int  i = stmt.executeUpdate();  
				System.out.println(i+" records inserted"); 
				
				con.close();  
			} catch(Exception e) { 
				e.printStackTrace();
				request.setAttribute("error_msg", "Somthing Went Wrong!! Unable to save data.");
			}  
		
		
		request.setAttribute("success_msg", "Event Details Save Successfully");
		request.getRequestDispatcher("/EventDetails.jsp").forward(request, response);
		}
	}
}