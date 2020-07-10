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

import beans.ContactUSBeans;

/**
 * Servlet implementation class ContactDetailsAction
 */
public class ContactDetailsAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactDetailsAction() {
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
			
			List<ContactUSBeans> contactUsList = new ArrayList<ContactUSBeans>();
			try{  
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement","root","root");  
				
				PreparedStatement stmt = con.prepareStatement("select id, name,email,subject,message,entry_date from contact");
				ResultSet rs = stmt.executeQuery();
				while(rs.next()) {
					ContactUSBeans beans = new ContactUSBeans();
					
					beans.setId(rs.getInt(1));
					beans.setName(rs.getString(2));
					beans.setEmail(rs.getString(3));
					beans.setSubject(rs.getString(4));
					beans.setMessage(rs.getString(5));
					beans.setEntry_date(rs.getString(6));
					
					contactUsList.add(beans);
				}			
				  
				
				
						
				
				con.close();
			} catch(Exception e) { 
				e.printStackTrace();
			} 
		
			request.getSession().setAttribute("contactUsList", contactUsList);
			request.getRequestDispatcher("/showContactDetails.jsp").forward(request, response);
		
			
		}
}

	
	
	
