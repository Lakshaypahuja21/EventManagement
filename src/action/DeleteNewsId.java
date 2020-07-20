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
 * Servlet implementation class DeleteNewsId
 */
public class DeleteNewsId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteNewsId() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<HomeNewsBeans> homeNewsBeans = new ArrayList<HomeNewsBeans>();
		try{  
			String newsid = request.getParameter("news_id");
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement","root","root"); 
			
			PreparedStatement stmtin = con.prepareStatement("delete from newstable where Newsid = "+newsid);
			int  i = stmtin.executeUpdate();  
			System.out.println(i+" records inserted");
			
			PreparedStatement stmt = con.prepareStatement("select Newsid,Newsheadline from newstable");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				HomeNewsBeans beans = new HomeNewsBeans();
				
				beans.setNewsid(rs.getInt(1));
				System.out.println(rs.getInt(1));
				beans.setNewsheadline(rs.getString(2));
				System.out.println(rs.getString(2));
				homeNewsBeans.add(beans);
			}			
			  
			con.close();
		} catch(Exception e) { 
			e.printStackTrace();
			request.setAttribute("error_msg", "Somthing Went Wrong!! Unable to delete news.");
		} 
		request.setAttribute("success_msg", "Event Details Deleted Successfully");
		request.getSession().setAttribute("newwsList", homeNewsBeans);		
		request.getRequestDispatcher("/Homenewsinsert.jsp").forward(request, response);
	}

}

