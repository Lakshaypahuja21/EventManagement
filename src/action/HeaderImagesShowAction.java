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

/**
 * Servlet implementation class HeaderImagesShowAction
 */
public class HeaderImagesShowAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HeaderImagesShowAction() {
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
		List<HeaderImagesBeans> headerImagesList = new ArrayList<HeaderImagesBeans>();
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement","root","root");  
			
			PreparedStatement stmt = con.prepareStatement("select Headid, Headimage from headerimage");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				HeaderImagesBeans beans = new HeaderImagesBeans();
				
				beans.setHeadid(rs.getInt(1));
				beans.setHeadimage(rs.getString(2));
				
				
				headerImagesList.add(beans);
			}			
			  
			
			
					
			
			con.close();
		} catch(Exception e) { 
			e.printStackTrace();
		} 
	
		request.getSession().setAttribute("headerImagesList", headerImagesList);
		request.getRequestDispatcher("/headerImages.jsp").forward(request, response);
	
		
	}
}




