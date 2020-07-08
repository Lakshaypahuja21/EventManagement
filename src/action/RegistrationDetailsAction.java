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
import beans.RegisterBeansMun;

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
			  
			
			List<RegisterBeansMun> registerBeansListMun = new ArrayList<RegisterBeansMun>();
			PreparedStatement stm2 = con.prepareStatement("select idmun,firstnamemun,lastnamemun,emailmun,contactmun,collegemun,committeemun,portfoliomun,teammun,is_active,entry_date from registerationmun");
			ResultSet rs2 = stm2.executeQuery();
			while(rs2.next()) {
				RegisterBeansMun beans = new RegisterBeansMun();
				
				beans.setId(rs2.getInt(1));
				beans.setFirstnamemun(rs2.getString(2));
				beans.setLastnamemun(rs2.getString(3));
				beans.setEmailmun(rs2.getString(4));
				beans.setContactmun(rs2.getString(5));
				beans.setCollegemun(rs2.getString(6));
				beans.setCommitteemun(rs2.getString(7));
				beans.setPortfoliomun(rs2.getString(8));
				beans.setTeammun(rs2.getInt(9));
				beans.setEntry_date(rs2.getString(10));
				
				registerBeansListMun.add(beans);
			}			
			
			  
			request.getSession().setAttribute("registerListMun", registerBeansListMun);
		
		
			List<RegisterBeansBuzz> registerBeansListBuzz = new ArrayList<RegisterBeansBuzz>();
					
			PreparedStatement stm3 = con.prepareStatement("select idbuzz,firstnamebuzz,lastnamebuzz,emailbuzz,contactbuzz,collegebuzz,teambuzz,is_active,entry_date from registerationbuzz");
			ResultSet rs3 = stm3.executeQuery();
			while(rs3.next()) {
				RegisterBeansBuzz beans = new RegisterBeansBuzz();
				
				beans.setId(rs3.getInt(1));
				beans.setFirstnamebuzz(rs3.getString(2));
				beans.setLastnamebuzz(rs3.getString(3));
				beans.setEmailbuzz(rs3.getString(4));
				beans.setContactbuzz(rs3.getString(5));
				beans.setCollegebuzz(rs3.getString(6));
				beans.setTeambuzz(rs3.getInt(7));
				beans.setEntry_date(rs3.getString(8));
				
				registerBeansListBuzz.add(beans);
			}		
			request.getSession().setAttribute("registerListBuzz", registerBeansListBuzz);
			con.close();
		} catch(Exception e) { 
			e.printStackTrace();
		} 
		request.getSession().setAttribute("registerList", registerBeansList);
		
		
		request.getRequestDispatcher("/showRegisterationDetails.jsp").forward(request, response);
		
	}

}
