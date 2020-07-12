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

import beans.AdminEventBeans;
import beans.AdminHighlightsBeans;

/**
 * Servlet implementation class AdminHighlightDisplayAction
 */
public class AdminHighlightDisplayAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminHighlightDisplayAction() {
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
		List<AdminHighlightsBeans> adminHighlightList = new ArrayList<AdminHighlightsBeans>();
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement","root","root");  
			
			PreparedStatement stmt = con.prepareStatement("select Hid, Head,Desc,Hurl1,Hurl2 from eventhighlights");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				AdminHighlightsBeans beans = new AdminHighlightsBeans();
				
				beans.setHid(rs.getInt(1));
				System.out.println(rs.getInt(1));
				beans.setHead(rs.getString(2));
				System.out.println(rs.getString(2));
				beans.setDesc(rs.getString(3));
				beans.setHurl1(rs.getString(4));
				beans.setHurl2(rs.getString(5));
								
				adminHighlightList.add(beans);
			}			
			  
			con.close();
		} catch(Exception e) { 
			e.printStackTrace();
		} 
		request.getSession().setAttribute("adminhighlightlist", adminHighlightList);
		
		
		request.getRequestDispatcher("Trial2.jsp").forward(request, response);
		
	}

}
