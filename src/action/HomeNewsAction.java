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

import beans.HomeNewsBeans;

/**
 * Servlet implementation class HomeNewsAction
 */
public class HomeNewsAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeNewsAction() {
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
		String newsheadline = request.getParameter("Newsheadline");
		
		
		int error_status = 0;
		HomeNewsBeans homeNewsBeans = new HomeNewsBeans();
		if(newsheadline != null && newsheadline.length()>0) {
			homeNewsBeans.setNewsheadline(newsheadline);
		} else {
			error_status = 1;
			request.setAttribute("error_msg", "News Should not be blank !!");
		}
				// Database save activity will start from here !!!
		System.out.println(homeNewsBeans.getNewsheadline());
		List<HomeNewsBeans> newsList = new ArrayList<HomeNewsBeans>();	
		if(error_status == 0) {
			
			try{  
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement","root","root");  
				
				PreparedStatement stmt = con.prepareStatement("update newstable set Newsheadline=? where Newsid=1");
				stmt.setString(1, homeNewsBeans.getNewsheadline());
				
				int  i = stmt.executeUpdate();  
				System.out.println(i+" records inserted"); 
				
				
					
					PreparedStatement stmt2 = con.prepareStatement("select Newsheadline from newstable");
					ResultSet rs = stmt2.executeQuery();
					while(rs.next()) {
						HomeNewsBeans beans = new HomeNewsBeans();	
						
						
						beans.setNewsheadline(rs.getString(1));
						System.out.println(rs.getString(1));
						newsList.add(beans);
						
						
					}
					
							
				con.close();  
			} catch(Exception e) { 
				e.printStackTrace();
			}  
		
			request.getSession().setAttribute("newwsList", newsList);
			request.getRequestDispatcher("/Homenewsinsert.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/Homenewsinsert.jsp").forward(request, response);
		}
		
	
	}
}


