package action;

import java.io.IOException;
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
import beans.RegisterBeansMun;
/**
 * Servlet implementation class RegistrationDetailsMunAction
 */
public class RegistrationDetailsMunAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationDetailsMunAction() {
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
		List<RegisterBeansMun> registerBeansListMun = new ArrayList<RegisterBeansMun>();
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement","root","root");  
			
			PreparedStatement stmt = con.prepareStatement("select idmun,firstnamemun,lastnamemun,emailmun,contactmun,collegemun,committeemun,portfoliomun,teambuzz,is_active,entry_date from registerationmun");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				RegisterBeansMun beans = new RegisterBeansMun();
				
				beans.setId(rs.getInt(1));
				beans.setFirstnamemun(rs.getString(2));
				beans.setLastnamemun(rs.getString(3));
				beans.setEmailmun(rs.getString(4));
				beans.setContactmun(rs.getString(5));
				beans.setCollegemun(rs.getString(6));
				beans.setCommitteemun(rs.getString(7));
				beans.setPortfoliomun(rs.getString(8));
				beans.setTeammun(rs.getInt(9));
				beans.setEntry_date(rs.getString(10));
				
				registerBeansListMun.add(beans);
			}			
			
			con.close();  
		} catch(Exception e) { 
			e.printStackTrace();
		}  
		request.getSession().setAttribute("registerListMun", registerBeansListMun);
		request.getRequestDispatcher("/showRegisterationDetails.jsp").forward(request, response);
	}



	}


