package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.AdminEventBeans;

/**
 * Servlet implementation class DeleteEventDetails
 */
public class DeleteEventDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEventDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<AdminEventBeans> adminEventList = new ArrayList<AdminEventBeans>();
		try{  
			String event_id = request.getParameter("event_id");
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement","root","root"); 
			
			PreparedStatement stmtin = con.prepareStatement("update eventadmin set is_active = '0' where Eid = "+event_id);
			int  i = stmtin.executeUpdate();  
			System.out.println(i+" records inserted");
			
			PreparedStatement stmt = con.prepareStatement("select Eid, Ename,Edesc,Eyurl,Eiurl,Etype,Imname,no_of_seat,subject,created_date,avl_seat from eventadmin where is_active='1'");
			ResultSet rs = stmt.executeQuery();
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
		request.setAttribute("success_msg", "Event Details Deleted Successfully");
		request.getSession().setAttribute("admineventlist", adminEventList);		
		request.getRequestDispatcher("/Displayevent.jsp").forward(request, response);
	}

}
