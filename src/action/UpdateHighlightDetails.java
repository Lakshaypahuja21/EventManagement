package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import beans.AdminEventBeans;
import beans.AdminHighlightsBeans;

/**
 * Servlet implementation class UpdateHighlightDetails
 */
public class UpdateHighlightDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateHighlightDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String hid =  request.getParameter("hid");
		String head =  request.getParameter("Head");
		String desc = request.getParameter("Desc");
		String himage1 = request.getParameter("Himage1");
		String himage2 = request.getParameter("Himage2");
		String hurl1= request.getParameter("Hurl1");
		String hurl2= request.getParameter("Hurl2");
		
		int error_status = 0;
		AdminHighlightsBeans adminHighlightBeans = new AdminHighlightsBeans();
		adminHighlightBeans.setHead(head);
		adminHighlightBeans.setDesc(desc);
		//
		adminHighlightBeans.setHimage1(himage1);
		adminHighlightBeans.setHimage2(himage2);
		adminHighlightBeans.setHurl1(hurl1);
		adminHighlightBeans.setHurl1(hurl2);
		
		
		System.out.println(adminHighlightBeans.getHead());
		System.out.println(adminHighlightBeans.getDesc());
		
		System.out.println(adminHighlightBeans.getHimage1());
		System.out.println(adminHighlightBeans.getHimage2());
		System.out.println(adminHighlightBeans.getHurl1());
		
				
		List<AdminHighlightsBeans> adminHighlightList = new ArrayList<AdminHighlightsBeans>();		
		if(error_status == 0) {
			try{  
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagement?autoReconnect=true&useSSL=false","root","root");  
					PreparedStatement stmt = con.prepareStatement("update eventhighlights set Head = ?,Descdescription = ?,Hurl1 = ?,Hurl2 = ?,Himage1 = ?,Himage2 = ? where Hid = "+hid);
				
				stmt.setString(1, adminHighlightBeans.getHead());
				stmt.setString(2, adminHighlightBeans.getDesc());
				stmt.setString(3, adminHighlightBeans.getHimage1());
				stmt.setString(4, adminHighlightBeans.getHimage2());
				stmt.setString(5, adminHighlightBeans.getHurl1());
				stmt.setString(6, adminHighlightBeans.getHurl1());
				
				
				int  i = stmt.executeUpdate();  
				System.out.println(i+" records inserted"); 
				
				PreparedStatement stmt2 = con.prepareStatement("select Hid, Head,Descdescription,Hurl1,Hurl2,Himage1,Himage2 from eventhighlights");
				ResultSet rs = stmt2.executeQuery();
				while(rs.next()) {
					AdminHighlightsBeans beans = new AdminHighlightsBeans();
					
					beans.setHid(rs.getInt(1));
					System.out.println(rs.getInt(1));
					beans.setHead(rs.getString(2));
					System.out.println(rs.getString(2));
					beans.setDesc(rs.getString(3));
					beans.setHurl1(rs.getString(4));
					beans.setHurl2(rs.getString(5));
					beans.setHimage1(rs.getString(6));
					beans.setHimage2(rs.getString(7));
									
					adminHighlightList.add(beans);
				}			
				  
				con.close();
			} catch(Exception e) { 
				e.printStackTrace();
				request.setAttribute("error_msg", "Somthing Went Wrong!! Unable to delete data.");
			} 
			request.getSession().setAttribute("adminhighlightlist", adminHighlightList);
			request.setAttribute("success_msg", "highlight Details Updated Successfully");	
			request.getRequestDispatcher("/highlightsview.jsp").forward(request, response);
		}

	}

}