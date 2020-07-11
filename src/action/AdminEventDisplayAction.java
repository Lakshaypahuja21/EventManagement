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
 * Servlet implementation class AdminEventDisplayAction
 */
public class AdminEventDisplayAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEventDisplayAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<AdminEventBeans> adminEventList = new ArrayList<AdminEventBeans>();
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement","root","root");  
			
			PreparedStatement stmt = con.prepareStatement("select Eid, Ename,Edesc,Eyurl,Eiurl,Etype from eventadmin");
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
				
				adminEventList.add(beans);
			}			
			  
			con.close();
		} catch(Exception e) { 
			e.printStackTrace();
		} 
		request.getSession().setAttribute("admineventlist", adminEventList);
		
		
		request.getRequestDispatcher("/Displayevent.jsp").forward(request, response);
		
	}

}