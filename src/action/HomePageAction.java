package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HomePageAction
 */
public class HomePageAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomePageAction() {
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
		System.out.println("Inside post ::::::::::::::::::::");
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		System.out.println("Username ::::"+username);
		System.out.println("Password ::::"+password);
		
		if(username.equals("mahi") && password.equals("mahi@123")) {
			// if success
			request.getRequestDispatcher("/event.jsp").forward(request, response);
		} else {
			request.setAttribute("error_msg", "Invalid Username or Password");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

}
