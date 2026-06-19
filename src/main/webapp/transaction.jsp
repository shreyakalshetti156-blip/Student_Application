<%@page import="in.ps.studentapp.connection.TransactionID"%>
<%@page import="in.ps.studentapp.dto.Student"%>
<%@page import="in.ps.studentapp.dto.Payment"%>
<%@page import="in.ps.studentapp.dao.PaymentDAOImpl"%>
<%@page import="in.ps.studentapp.dao.PaymentsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%Student s=(Student)session.getAttribute("student");%>
	<%if(s!=null){%>
	<%PaymentsDAO pdao=new PaymentDAOImpl();%>
	<%Payment p=new Payment();
		p.setCourseId(Integer.parseInt(request.getParameter("courseId")));
		p.setStudentId(s.getId());
		p.setTransactionId(TransactionID.generateID());%>
		<!-- Bill info with payment mode option in drop down. and one submit button. 
		It must be written inside form tag so that we can collect payment data.-->
		
	
	
	<%}else { 
        request.setAttribute("error", "Session expired! Please login again.");
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
    }%>
	
</body>
</html>