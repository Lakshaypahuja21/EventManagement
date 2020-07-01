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

import beans.RegisterBeansBuzz;

/**
 * Servlet implementation class RegisterActionBuzz
 */
public class RegisterActionBuzz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterActionBuzz() {
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
		
		String firstnamebuzz = request.getParameter("firstnamebuzz");
		String lastnamebuzz 	= request.getParameter("lastnamebuzz");
		String emailbuzz		= request.getParameter("emailbuzz");
		String contactbuzz   = request.getParameter("contactbuzz");
		String collegebuzz   = request.getParameter("collegebuzz");
		String teambuzz		= request.getParameter("teambuzz");
				
		System.out.println("first name::::::"+firstnamebuzz);
		System.out.println("last name::::::"+lastnamebuzz);
		System.out.println("email id::::::"+emailbuzz);
		System.out.println("contact::::::"+contactbuzz);
		System.out.println("college::::::"+collegebuzz);
		System.out.println("team::::::"+teambuzz);
	
		int error_status = 0;
		RegisterBeansBuzz registerBeansBuzz = new RegisterBeansBuzz();
		if(firstnamebuzz != null && firstnamebuzz.length()>0) {
			registerBeansBuzz.setFirstnamebuzz(firstnamebuzz);
		} else {
			error_status = 1;
			request.setAttribute("error_msg", "Name Should not be blank !!");
		}
		
		registerBeansBuzz.setLastnamebuzz(lastnamebuzz);
		registerBeansBuzz.setEmailbuzz(emailbuzz);
		registerBeansBuzz.setContactbuzz(contactbuzz);
		registerBeansBuzz.setCollegebuzz(collegebuzz);
		registerBeansBuzz.setTeambuzz(Integer.parseInt(teambuzz));
		registerBeansBuzz.setIs_active(1);
		registerBeansBuzz.setEntry_date(new Date().toString());
		
		System.out.println(registerBeansBuzz.getFirstnamebuzz());
		System.out.println(registerBeansBuzz.getLastnamebuzz());
		System.out.println(registerBeansBuzz.getEmailbuzz());
		System.out.println(registerBeansBuzz.getContactbuzz());
		System.out.println(registerBeansBuzz.getCollegebuzz());
		System.out.println(registerBeansBuzz.getTeambuzz());
		System.out.println(registerBeansBuzz.getEntry_date());
		System.out.println(registerBeansBuzz.getIs_active());
		
		if(error_status == 0) {
			
			try{  
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement","root","root");  
				
				PreparedStatement stmt = con.prepareStatement("insert into registerationbuzz(firstnamebuzz,lastnamebuzz,emailbuzz,contactbuzz,collegebuzz,teambuzz,is_active,entry_date) values(?,?,?,?,?,?,?,?)");
				stmt.setString(1, registerBeansBuzz.getFirstnamebuzz());
				stmt.setString(2, registerBeansBuzz.getLastnamebuzz());
				stmt.setString(3, registerBeansBuzz.getEmailbuzz());
				stmt.setString(4, registerBeansBuzz.getContactbuzz());
				stmt.setString(5, registerBeansBuzz.getCollegebuzz());
				stmt.setInt(6, registerBeansBuzz.getTeambuzz());
				stmt.setInt(7, registerBeansBuzz.getIs_active());
				stmt.setString(8, registerBeansBuzz.getEntry_date().toString());
				
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