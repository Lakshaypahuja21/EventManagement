package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.AdminEventBeans;

/**
 * Servlet implementation class UpdateEventsDetails
 */
public class UpdateEventsDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEventsDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String eventID =  request.getParameter("eventid");
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
		
		List<AdminEventBeans> adminEventList = new ArrayList<AdminEventBeans>();		
		if(error_status == 0) {
			try{  
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement?autoReconnect=true&useSSL=false","root","root");  
				
				PreparedStatement stmt = con.prepareStatement("update eventadmin set Ename = ?,Edesc = ?,Eyurl = ?,Eiurl = ?,Etype = ?,Imname = ?,no_of_seat = ?,subject = ?,created_date = ?,is_active = ?,avl_seat = ? where Eid = "+eventID);
				
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
				
				PreparedStatement stmt2 = con.prepareStatement("select Eid, Ename,Edesc,Eyurl,Eiurl,Etype,Imname,no_of_seat,subject,created_date,avl_seat from eventadmin where is_active='1'");
				ResultSet rs = stmt2.executeQuery();
				while(rs.next()) {
					AdminEventBeans beans = new AdminEventBeans();
					
					beans.setEid(rs.getInt(1));
					System.out.println(rs.getInt(1));
					beans.setEname(rs.getString(2));
					System.out.println(rs.getString(2));
					beans.setEdesc(rs.getString(3));
					beans.setEyurl(rs.getString(4));
					beans.setEiurl(rs.getString(5));
					beans.setEtype(rs.getString(6));
					beans.setImname(rs.getString(7));
					beans.setNo_of_seat(rs.getString(8));
					beans.setEsubject(rs.getString(9));
					beans.setCreated_date(rs.getString(10));
					beans.setAval_seat(rs.getString(11));
					
					adminEventList.add(beans);
				}			
				  
				con.close();
			} catch(Exception e) { 
				e.printStackTrace();
				request.setAttribute("error_msg", "Somthing Went Wrong!! Unable to delete data.");
			} 
			request.getSession().setAttribute("admineventbeans", null);	
			request.setAttribute("success_msg", "Event Details Updated Successfully");
			request.getSession().setAttribute("admineventlist", adminEventList);		
			request.getRequestDispatcher("/Displayevent.jsp").forward(request, response);
		}
	}

}
