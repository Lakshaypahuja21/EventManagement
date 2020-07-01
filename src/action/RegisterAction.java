package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ContactUSBeans;
import beans.RegisterBeans;

/**
 * Servlet implementation class RegisterAction
 */
public class RegisterAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterAction() {
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
		System.out.println("inside post:::::::::::::::::::");
		
		String firstnamebts = request.getParameter("firstnamebts");
		String lastnamebts 	= request.getParameter("lastnamebts");
		String emailbts		= request.getParameter("emailbts");
		String contactbts   = request.getParameter("contactbts");
		String collegebts   = request.getParameter("collegebts");
		String teambts 		= request.getParameter("teambts");
		
		System.out.println("first name::::::"+firstnamebts);
		System.out.println("last name::::::"+lastnamebts);
		System.out.println("email id::::::"+emailbts);
		System.out.println("contact::::::"+contactbts);
		System.out.println("college::::::"+collegebts);
		System.out.println("team::::::"+teambts);
	
		int error_status = 0;
		RegisterBeans registerBeans = new RegisterBeans();
		if(firstnamebts != null && firstnamebts.length()>0) {
			registerBeans.setFirstnamebts(firstnamebts);
		} else {
			error_status = 1;
			request.setAttribute("error_msg", "Name Should not be blank !!");
		}
		
		registerBeans.setLastnamebts(lastnamebts);
		registerBeans.setEmailbts(emailbts);
		registerBeans.setContactbts(contactbts);
		registerBeans.setCollegebts(collegebts);
		registerBeans.setTeambts(Integer.parseInt(teambts));
		registerBeans.setIs_active(1);
		registerBeans.setEntry_date(new Date().toString());
		
		System.out.println(registerBeans.getFirstnamebts());
		System.out.println(registerBeans.getLastnamebts());
		System.out.println(registerBeans.getEmailbts());
		System.out.println(registerBeans.getContactbts());
		System.out.println(registerBeans.getCollegebts());
		System.out.println(registerBeans.getTeambts());
		System.out.println(registerBeans.getEntry_date());
		System.out.println(registerBeans.getIs_active());
		
		if(error_status == 0) {
			
			try{  
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement","root","root");  
				
				PreparedStatement stmt = con.prepareStatement("insert into registerationbts(firstnamebts,lastnamebts,emailbts,contactbts,collegebts,teambts,is_active,entry_date) values(?,?,?,?,?,?,?,?)");
				stmt.setString(1, registerBeans.getFirstnamebts());
				stmt.setString(2, registerBeans.getLastnamebts());
				stmt.setString(3, registerBeans.getEmailbts());
				stmt.setString(4, registerBeans.getContactbts());
				stmt.setString(5, registerBeans.getCollegebts());
				stmt.setInt(6, registerBeans.getTeambts());
				stmt.setInt(7, registerBeans.getIs_active());
				stmt.setString(8, registerBeans.getEntry_date().toString());
				
				int  i = stmt.executeUpdate();  
				System.out.println(i+" records inserted"); 
				
				con.close();  
			} catch(Exception e) { 
				e.printStackTrace();
			}  
		
			request.setAttribute("error_msg", "Your request has been submited successfully !!");
			request.getRequestDispatcher("/contactsuccess.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/event.jsp").forward(request, response);
		}
		
	}

}
