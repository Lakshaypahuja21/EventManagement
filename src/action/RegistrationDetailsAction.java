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

import beans.RegisterBeans;

/**
 * Servlet implementation class RegistrationDetailsAction
 */
public class RegistrationDetailsAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationDetailsAction() {
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
		List<RegisterBeans> registerBeansList = new ArrayList<RegisterBeans>();
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement","root","root");  
			
			PreparedStatement stmt = con.prepareStatement("select idbts, firstnamebts,lastnamebts,emailbts,contactbts,collegebts,teambts,entry_date from registerationbts");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				RegisterBeans beans = new RegisterBeans();
				
				beans.setId(rs.getInt(1));
				beans.setFirstnamebts(rs.getString(2));
				beans.setLastnamebts(rs.getString(3));
				beans.setEmailbts(rs.getString(4));
				beans.setContactbts(rs.getString(5));
				beans.setCollegebts(rs.getString(6));
				beans.setTeambts(rs.getInt(7));
				beans.setEntry_date(rs.getString(8));
				
				registerBeansList.add(beans);
			}			
			con.close();  
		} catch(Exception e) { 
			e.printStackTrace();
		} 
		request.getSession().setAttribute("registerList", registerBeansList);
		request.getRequestDispatcher("/showRegisterationDetails.jsp").forward(request, response);
		
	}

}
