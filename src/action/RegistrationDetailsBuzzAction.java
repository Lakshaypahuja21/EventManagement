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
import beans.RegisterBeansBuzz;

/**
 * Servlet implementation class RegistrationDetailsBuzzAction
 */
public class RegistrationDetailsBuzzAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationDetailsBuzzAction() {
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
		List<RegisterBeansBuzz> registerBeansListBuzz = new ArrayList<RegisterBeansBuzz>();
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement","root","root");  
			
			PreparedStatement stmt = con.prepareStatement("select idbuzz,firstnamebuzz,lastnamebuzz,emailbuzz,contactbuzz,collegebuzz,teambuzz,is_active,entry_date from registerationbuzz");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				RegisterBeansBuzz beans = new RegisterBeansBuzz();
				
				beans.setId(rs.getInt(1));
				beans.setFirstnamebuzz(rs.getString(2));
				beans.setLastnamebuzz(rs.getString(3));
				beans.setEmailbuzz(rs.getString(4));
				beans.setContactbuzz(rs.getString(5));
				beans.setCollegebuzz(rs.getString(6));
				beans.setTeambuzz(rs.getInt(7));
				beans.setEntry_date(rs.getString(8));
				
				registerBeansListBuzz.add(beans);
			}			
			
			con.close();  
		} catch(Exception e) { 
			e.printStackTrace();
		}  
		request.getSession().setAttribute("registerListBuzz", registerBeansListBuzz);
		request.getRequestDispatcher("/showRegisterationDetails.jsp").forward(request, response);
	}

}
