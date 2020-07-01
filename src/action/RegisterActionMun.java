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


import beans.RegisterBeansMun;

/**
 * Servlet implementation class RegisterActionMun
 */
public class RegisterActionMun extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterActionMun() {
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
		
		String firstnamemun = request.getParameter("firstnamemun");
		String lastnamemun 	= request.getParameter("lastnamemun");
		String emailmun		= request.getParameter("emailmun");
		String contactmun   = request.getParameter("contactmun");
		String collegemun   = request.getParameter("collegemun");
		String teammun 		= request.getParameter("teammun");
		String committeemun = request.getParameter("committeemun");
		String portfoliomun = request.getParameter("portfoliomun");
		
		System.out.println("first name::::::"+firstnamemun);
		System.out.println("last name::::::"+lastnamemun);
		System.out.println("email id::::::"+emailmun);
		System.out.println("contact::::::"+contactmun);
		System.out.println("college::::::"+collegemun);
		System.out.println("team::::::"+teammun);
		System.out.println("comitteemun:::::"+committeemun);
		System.out.println("portfoliomun:::::::"+portfoliomun);
	
		int error_status = 0;
		RegisterBeansMun registerBeansMun = new RegisterBeansMun();
		if(firstnamemun != null && firstnamemun.length()>0) {
			registerBeansMun.setFirstnamemun(firstnamemun);
		} else {
			error_status = 1;
			request.setAttribute("error_msg", "Name Should not be blank !!");
		}
		
		registerBeansMun.setLastnamemun(lastnamemun);
		registerBeansMun.setEmailmun(emailmun);
		registerBeansMun.setContactmun(contactmun);
		registerBeansMun.setCollegemun(collegemun);
		registerBeansMun.setCommitteemun(committeemun);
		registerBeansMun.setPortfoliomun(portfoliomun);
		registerBeansMun.setTeammun(Integer.parseInt(teammun));
		registerBeansMun.setIs_active(1);
		registerBeansMun.setEntry_date(new Date().toString());
		
		System.out.println(registerBeansMun.getFirstnamemun());
		System.out.println(registerBeansMun.getLastnamemun());
		System.out.println(registerBeansMun.getEmailmun());
		System.out.println(registerBeansMun.getContactmun());
		System.out.println(registerBeansMun.getCollegemun());
		System.out.println(registerBeansMun.getCommitteemun());
		System.out.println(registerBeansMun.getPortfoliomun());
		System.out.println(registerBeansMun.getTeammun());
		System.out.println(registerBeansMun.getEntry_date());
		System.out.println(registerBeansMun.getIs_active());
		
		if(error_status == 0) {
			
			try{  
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement","root","root");  
				
				PreparedStatement stmt = con.prepareStatement("insert into registerationmun(firstnamemun,lastnamemun,emailmun,contactmun,collegemun,committeemun,portfoliomun,teammun,is_active,entry_date) values(?,?,?,?,?,?,?,?,?,?)");
				stmt.setString(1, registerBeansMun.getFirstnamemun());
				stmt.setString(2, registerBeansMun.getLastnamemun());
				stmt.setString(3, registerBeansMun.getEmailmun());
				stmt.setString(4, registerBeansMun.getContactmun());
				stmt.setString(5, registerBeansMun.getCollegemun());
				stmt.setString(6, registerBeansMun.getCommitteemun());
				stmt.setString(7, registerBeansMun.getPortfoliomun());
				stmt.setInt(8, registerBeansMun.getTeammun());
				stmt.setInt(9, registerBeansMun.getIs_active());
				stmt.setString(10, registerBeansMun.getEntry_date().toString());
				
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

