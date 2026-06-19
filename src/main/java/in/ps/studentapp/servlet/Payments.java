package in.ps.studentapp.servlet;

import java.io.IOException;
import java.time.LocalDateTime;

import in.ps.studentapp.connection.TransactionID;
import in.ps.studentapp.dao.CoursesDAO;
import in.ps.studentapp.dao.CoursesDAOImpl;
import in.ps.studentapp.dao.PaymentDAOImpl;
import in.ps.studentapp.dao.PaymentsDAO;
import in.ps.studentapp.dao.StudentDAO;
import in.ps.studentapp.dao.StudentDAOImpl;
import in.ps.studentapp.dto.Payment;
import in.ps.studentapp.dto.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/payment")
public class Payments extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session=req.getSession();
		String courseId=req.getParameter("courseId");
		String totalAmount=req.getParameter("totalAmount");
		String studentId=req.getParameter("studentId");
		String method=req.getParameter("paymentMethod");
		Long transactionId=TransactionID.generateID();
		String tax=req.getParameter("tax");
		
		Student s=(Student)session.getAttribute("student");
		
		CoursesDAO cdao=new CoursesDAOImpl();
		PaymentsDAO pdao=new PaymentDAOImpl();
		
		if(s.getId()==Integer.parseInt(studentId)) {
			Payment p=new Payment();
			p.setCourseId(Integer.parseInt(courseId));
			p.setStudentId(s.getId());
			p.setTransactionId(transactionId);
			p.setAmount(Double.parseDouble(totalAmount));
			p.setMethod(method);
			p.setStatus("SUCCESS");
			p.setPath("NA");
			boolean status=pdao.insertPayment(p);
			if(status) {
				req.setAttribute("payment", p);
				req.setAttribute("success","Payment successful!");
				req.setAttribute("tax", tax);
				req.getRequestDispatcher("bill.jsp").forward(req, resp);
			}
			else {
				req.setAttribute("error","Payment failed!");
				req.getRequestDispatcher("courses.jsp").forward(req, resp);
			}
		}
	}
}
