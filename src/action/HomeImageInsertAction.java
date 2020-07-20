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

import beans.HomeImageInsertBeans;

/**
 * servlet implementation class HomeImageInsertAction
 */
public class HomeImageInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeImageInsertAction() {
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
		String homeimage1 = request.getParameter("Homeimage1");
		String homeimage2 = request.getParameter("Homeimage2");
		String homeimage3 = request.getParameter("Homeimage3");
		String homeimage4 = request.getParameter("Homeimage4");
		String homeimage5 = request.getParameter("Homeimage5");
		String homeimage6 = request.getParameter("Homeimage6");
		String homeimage7 = request.getParameter("Homeimage7");
		String homeimage8 = request.getParameter("Homeimage8");
			
		
		
		int error_status = 0;
		HomeImageInsertBeans homeImageInsertBeans = new HomeImageInsertBeans();
		if(homeimage1 != null && homeimage1.length()>0) {
			homeImageInsertBeans.setHomeimage1(homeimage1);
		} else {
			error_status = 1;
			request.setAttribute("error_msg", "Image Should not be blank !!");
		}
		
		if(homeimage2 != null && homeimage2.length()>0) {
			homeImageInsertBeans.setHomeimage2(homeimage2);
		} else {
			error_status = 1;
			request.setAttribute("error_msg", "Image Should not be blank !!");
		}
		
		if(homeimage3 != null && homeimage3.length()>0) {
			homeImageInsertBeans.setHomeimage3(homeimage3);
		} else {
			error_status = 1;
			request.setAttribute("error_msg", "Image Should not be blank !!");
		}
		
		if(homeimage4 != null && homeimage4.length()>0) {
			homeImageInsertBeans.setHomeimage4(homeimage4);
		} else {
			error_status = 1;
			request.setAttribute("error_msg", "Image Should not be blank !!");
		}
		
		if(homeimage5 != null && homeimage5.length()>0) {
			homeImageInsertBeans.setHomeimage5(homeimage5);
		} else {
			error_status = 1;
			request.setAttribute("error_msg", "Image Should not be blank !!");
		}
		
		if(homeimage6 != null && homeimage6.length()>0) {
			homeImageInsertBeans.setHomeimage6(homeimage6);
		} else {
			error_status = 1;
			request.setAttribute("error_msg", "Image Should not be blank !!");
		}
		if(homeimage7 != null && homeimage7.length()>0) {
			homeImageInsertBeans.setHomeimage7(homeimage7);
		} else {
			error_status = 1;
			request.setAttribute("error_msg", "Image Should not be blank !!");
		}
		
		if(homeimage8 != null && homeimage8.length()>0) {
			homeImageInsertBeans.setHomeimage8(homeimage8);
		} else {
			error_status = 1;
			request.setAttribute("error_msg", "Image Should not be blank !!");
		}
		
		
				// Database save activity will start from here !!!
		System.out.println(homeImageInsertBeans.getHomeimage1());
		System.out.println(homeImageInsertBeans.getHomeimage2());
		System.out.println(homeImageInsertBeans.getHomeimage3());
		System.out.println(homeImageInsertBeans.getHomeimage4());
		System.out.println(homeImageInsertBeans.getHomeimage5());
		System.out.println(homeImageInsertBeans.getHomeimage6());
		System.out.println(homeImageInsertBeans.getHomeimage7());
		System.out.println(homeImageInsertBeans.getHomeimage8());
		List<HomeImageInsertBeans> homeImageList = new ArrayList<HomeImageInsertBeans>();	
		if(error_status == 0) {
			
			try{  
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement","root","root");  
				
				PreparedStatement stmt = con.prepareStatement("update homeimage set homeimage1=?,homeimage2=?,homeimage3=?,homeimage4=?,homeimage5=?,homeimage6=?,homeimage7=?,homeimage8=? where Homeid=1");
				stmt.setString(1, homeImageInsertBeans.getHomeimage1());
				stmt.setString(2, homeImageInsertBeans.getHomeimage2());
				stmt.setString(3, homeImageInsertBeans.getHomeimage3());
				stmt.setString(4, homeImageInsertBeans.getHomeimage4());
				stmt.setString(5, homeImageInsertBeans.getHomeimage5());
				stmt.setString(6, homeImageInsertBeans.getHomeimage6());
				stmt.setString(7, homeImageInsertBeans.getHomeimage7());
				stmt.setString(8, homeImageInsertBeans.getHomeimage8());
				
				int  i = stmt.executeUpdate();  
				System.out.println(i+" records inserted"); 
				
				
					
				PreparedStatement stmt2 = con.prepareStatement("select homeimage1,homeimage2,homeimage3,homeimage4,homeimage5,homeimage6,homeimage7,homeimage8 from homeimage");
				ResultSet rs = stmt2.executeQuery();
				List<HomeImageInsertBeans> homeimageList = new ArrayList<HomeImageInsertBeans>();	
				while(rs.next()) {
					HomeImageInsertBeans beans = new HomeImageInsertBeans();						
						
					beans.setHomeimage1(rs.getString(1));
					System.out.println(rs.getString(1));
					beans.setHomeimage2(rs.getString(2));
					System.out.println(rs.getString(2));
					beans.setHomeimage3(rs.getString(3));
					System.out.println(rs.getString(3));
					beans.setHomeimage4(rs.getString(4));
					System.out.println(rs.getString(4));
					beans.setHomeimage5(rs.getString(5));
					System.out.println(rs.getString(5));
					beans.setHomeimage6(rs.getString(6));
					System.out.println(rs.getString(6));
					beans.setHomeimage7(rs.getString(7));
					System.out.println(rs.getString(7));
					beans.setHomeimage8(rs.getString(8));
					System.out.println(rs.getString(8));
					
					homeImageList.add(beans);				
				}						
				con.close();  
			} catch(Exception e) { 
				e.printStackTrace();
			}  
		
			request.getSession().setAttribute("homeimageslist", homeImageList);
			request.getRequestDispatcher("/HomeInsert.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/HomeInsert.jsp").forward(request, response);
		}
		
	
	}
}



