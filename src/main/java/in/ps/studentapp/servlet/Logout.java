package in.ps.studentapp.servlet;

import java.io.IOException;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession s=req.getSession();
		if(s.getAttribute("student")!=null) {
			s.invalidate();
			req.setAttribute("success","Logged out successfully!");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("error","session expired!");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}

	}
}
