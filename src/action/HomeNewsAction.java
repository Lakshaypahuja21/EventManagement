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
			homeNewsBeans.setHeadimage(newsheadline);
		} else {
			error_status = 1;
			request.setAttribute("error_msg", "Image Should not be blank !!");
		}
				// Database save activity will start from here !!!
		System.out.println(headerImagesBeans.getHeadimage());
		List<HeaderImagesBeans> adminHighlightList = new ArrayList<HeaderImagesBeans>();	
		if(error_status == 0) {
			
			try{  
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement","root","root");  
				
				PreparedStatement stmt = con.prepareStatement("update headerimage set Headimage=? where Headid=1");
				stmt.setString(1, headerImagesBeans.getHeadimage());
				
				int  i = stmt.executeUpdate();  
				System.out.println(i+" records inserted"); 
				
				
					
					PreparedStatement stmt2 = con.prepareStatement("select Headimage from headerimage");
					ResultSet rs = stmt2.executeQuery();
					List<HeaderImagesBeans> headerImagesList = new ArrayList<HeaderImagesBeans>();	
					while(rs.next()) {
						HeaderImagesBeans beans = new HeaderImagesBeans();	
						
						
						beans.setHeadimage(rs.getString(1));
						System.out.println(rs.getString(1));
						adminHighlightList.add(beans);
						
						
					}
					
							
				con.close();  
			} catch(Exception e) { 
				e.printStackTrace();
			}  
		
			request.getSession().setAttribute("headerImagesList", adminHighlightList);
			request.getRequestDispatcher("/headerImages.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/headerImages.jsp").forward(request, response);
		}
		
	
	}
}


