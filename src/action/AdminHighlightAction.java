package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.AdminEventBeans;
import beans.AdminHighlightsBeans;

/**
 * Servlet implementation class AdminHighlightAction
 */
public class AdminHighlightAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminHighlightAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("inside post:::::::::::");
		
		String head = request.getParameter("Head");
		String desc = request.getParameter("Desc");
		//String main_page_image = request.getParameter("");
		String hurl1= request.getParameter("Hurl1");
		String hurl2= request.getParameter("Hurl2");
		String himage1 = request.getParameter("Himage1");
		String himage2 = request.getParameter("Himage2");
		
		int error_status = 0;
		AdminHighlightsBeans adminHighlightsBeans = new AdminHighlightsBeans();
		adminHighlightsBeans.setHead(head);
		adminHighlightsBeans.setDesc(desc);
		adminHighlightsBeans.setHurl1(hurl1);
		adminHighlightsBeans.setHurl2(hurl2);
		adminHighlightsBeans.setHimage1(himage1);
		adminHighlightsBeans.setHimage2(himage2);
		
		System.out.println(adminHighlightsBeans.getHead());
		System.out.println(adminHighlightsBeans.getDesc());
		System.out.println(adminHighlightsBeans.getHurl1());
		System.out.println(adminHighlightsBeans.getHurl2());
		System.out.println(adminHighlightsBeans.getHimage1());
		System.out.println(adminHighlightsBeans.getHimage2());
		if(error_status == 0) {
			
			try{  
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement?autoReconnect=true&useSSL=false","root","root");  
				
				PreparedStatement stmt = con.prepareStatement("insert into eventhighlights(Head,Descdescription,Hurl1,Hurl2,Himage1,Himage2) values(?,?,?,?,?,?)");
				stmt.setString(1, adminHighlightsBeans.getHead());
				stmt.setString(2, adminHighlightsBeans.getDesc());
				stmt.setString(3, adminHighlightsBeans.getHurl1());
				stmt.setString(4, adminHighlightsBeans.getHurl2());
				stmt.setString(5, adminHighlightsBeans.getHimage1());
				stmt.setString(6, adminHighlightsBeans.getHimage2());
				
				
				int  i = stmt.executeUpdate();  
				System.out.println(i+" records inserted"); 
				
				con.close();  
				request.setAttribute("success_msg", "Highlights Details Save Successfully");
				
			} catch(Exception e) { 
				e.printStackTrace();
				request.setAttribute("error_msg", "Somthing Went Wrong!! Unable to save data.");
			}  
		
		
		request.getRequestDispatcher("/highlightsinsert.jsp").forward(request, response);
		}
	}

}
