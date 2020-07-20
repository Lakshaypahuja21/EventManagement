package action;

import java.beans.Beans;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.messaging.saaj.packaging.mime.Header;

import beans.AdminHighlightsBeans;
import beans.HeaderImagesBeans;


/**
 * Servlet implementation class HeaderImagesAction
 */
public class HeaderImagesAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HeaderImagesAction() {
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
		String headimage = request.getParameter("Headimage");
		
				
		int error_status = 0;
		HeaderImagesBeans headerImagesBeans = new HeaderImagesBeans();
		if(headimage != null && headimage.length()>0) {
			headerImagesBeans.setHeadimage(headimage);
		} else {
			error_status = 1;
			request.setAttribute("error_msg", "Image Should not be blank !!");
		}
				// Database save activity will start from here !!!
		System.out.println(headerImagesBeans.getHeadimage());
		List<HeaderImagesBeans> adminheadList = new ArrayList<HeaderImagesBeans>();	
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
						adminheadList.add(beans);
						
						
					}
					
							
				con.close();  
			} catch(Exception e) { 
				e.printStackTrace();
			}  
		
			request.getSession().setAttribute("headerimagesList", adminheadList);
			request.getRequestDispatcher("/headerImages.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/headerImages.jsp").forward(request, response);
		}
		
	
	}
}


