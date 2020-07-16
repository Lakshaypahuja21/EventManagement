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
 * Servlet implementation class DeleteHighlightDetails
 */
public class DeleteHighlightDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteHighlightDetails() {
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
		List<AdminHighlightsBeans> adminHighlightList = new ArrayList<AdminHighlightsBeans>();
		try{  
			String hid = request.getParameter("highlight_id");
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement","root","root"); 
			
			PreparedStatement stmtin = con.prepareStatement("delete from eventhighlights where Hid = "+hid);
			int  i = stmtin.executeUpdate();  
			System.out.println(i+" records inserted");
			
			PreparedStatement stmt = con.prepareStatement("select Hid,Head,Descdescription,Hurl1,Hurl2,Himage1,Himage2 from eventhighlights");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				AdminHighlightsBeans beans = new AdminHighlightsBeans();
				
				beans.setHid(rs.getInt(1));
				System.out.println(rs.getInt(1));
				beans.setHead(rs.getString(2));
				System.out.println(rs.getString(2));
				beans.setDesc(rs.getString(3));
				beans.setHimage1(rs.getString(6));
				beans.setHimage2(rs.getString(7));
				beans.setHurl1(rs.getString(4));
				beans.setHurl2(rs.getString(5));
				
				adminHighlightList.add(beans);
			}			
			  
			con.close();
		} catch(Exception e) { 
			e.printStackTrace();
			request.setAttribute("error_msg", "Somthing Went Wrong!! Unable to delete data.");
		} 
		request.setAttribute("success_msg", "Event Details Deleted Successfully");
		request.getSession().setAttribute("adminhighlightlist", adminHighlightList);		
		request.getRequestDispatcher("/highlightsview.jsp").forward(request, response);
	}

}

