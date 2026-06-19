package in.ps.studentapp.servlet;

import java.io.IOException;
import java.util.ArrayList;

import in.ps.studentapp.dao.CoursesDAO;
import in.ps.studentapp.dao.CoursesDAOImpl;
import in.ps.studentapp.dto.Courses;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/courses")
public class CoursesInfo extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CoursesDAO cdao=new CoursesDAOImpl();
		String courses=req.getParameter("category");
		System.out.println(courses);
		ArrayList<Courses> courseList;
	//  ArrayList<Courses> courses=cdao.getCoursesByCategory(req.getParameter("category"));
	//	resp.sendRedirect("courses?category="+req.getParameter("category"));
		if(courses==null||courses.equalsIgnoreCase("all")) {
			courseList=cdao.getCourses();
		}
		else {
			courseList=cdao.getCoursesByCategory(courses);
		}
		req.setAttribute("courseList", courseList);
		req.getRequestDispatcher("courses.jsp").forward(req, resp);
		
	}
}
