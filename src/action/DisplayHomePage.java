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

import beans.HeaderImagesBeans;
import beans.HomeImageInsertBeans;
import beans.HomeNewsBeans;

/**
 * Servlet implementation class DisplayHomePage
 */
public class DisplayHomePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayHomePage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HomeNewsBeans homeNewsBeans = new HomeNewsBeans();
		List<HomeNewsBeans> newsList = new ArrayList<HomeNewsBeans>();
		List<HomeImageInsertBeans> homeimageList = new ArrayList<HomeImageInsertBeans>();	
		
		List<HeaderImagesBeans> adminHighlightList = new ArrayList<HeaderImagesBeans>();	
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement","root","root");  
				
			PreparedStatement stmt2 = con.prepareStatement("select Newsheadline from newstable");
			ResultSet rs = stmt2.executeQuery();
			while(rs.next()) {
				HomeNewsBeans beans = new HomeNewsBeans();	
						
				beans.setNewsheadline(rs.getString(1));
				newsList.add(beans);
			}
			
			
			
			
			PreparedStatement stmt = con.prepareStatement("select Headimage from headerimage");
			ResultSet rs1 = stmt.executeQuery();
			
			while(rs1.next()) {
				HeaderImagesBeans beans = new HeaderImagesBeans();	
				
				
				beans.setHeadimage(rs1.getString(1));
				System.out.println(rs1.getString(1));
				adminHighlightList.add(beans);
				
				
			}
			
			PreparedStatement stmt3 = con.prepareStatement("select homeimage1,homeimage2,homeimage3,homeimage4,homeimage5,homeimage6,homeimage7,homeimage8 from homeimage");
			ResultSet rs3 = stmt3.executeQuery();
			while(rs3.next()) {
				HomeImageInsertBeans beans = new HomeImageInsertBeans();						
					
				beans.setHomeimage1(rs3.getString(1));
				System.out.println(rs3.getString(1));
				beans.setHomeimage2(rs3.getString(2));
				System.out.println(rs3.getString(2));
				beans.setHomeimage3(rs3.getString(3));
				System.out.println(rs3.getString(3));
				beans.setHomeimage4(rs3.getString(4));
				System.out.println(rs3.getString(4));
				beans.setHomeimage5(rs3.getString(5));
				System.out.println(rs3.getString(5));
				beans.setHomeimage6(rs3.getString(6));
				System.out.println(rs3.getString(6));
				beans.setHomeimage7(rs3.getString(7));
				System.out.println(rs3.getString(7));
				beans.setHomeimage8(rs3.getString(8));
				System.out.println(rs3.getString(8));
				
				homeimageList.add(beans);				
			}						
			con.close();  
		} catch(Exception e) { 
			e.printStackTrace();
		}
		request.getSession().setAttribute("homeimageslist", homeimageList);
		request.getSession().setAttribute("headerImagesList", adminHighlightList);
		request.getSession().setAttribute("newwsList", newsList);
		
		request.getRequestDispatcher("/event.jsp").forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
