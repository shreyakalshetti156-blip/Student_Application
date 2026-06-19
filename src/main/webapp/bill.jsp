<%@page import="java.time.LocalDate"%>
<%@page import="in.ps.studentapp.dto.Courses"%>
<%@page import="in.ps.studentapp.dao.CoursesDAOImpl"%>
<%@page import="in.ps.studentapp.dao.CoursesDAO"%>
<%@page import="in.ps.studentapp.dto.Payment"%>
<%@page import="in.ps.studentapp.dto.Student"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Receipt - LearnSphere</title>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
    :root {
        --sunset-orange: #FF6B35;
        --black: #000000;
        --white: #FFFFFF;
        --gray-light: #F5F5F5;
        --gray-medium: #E0E0E0;
    }
    
    .receipt-border {
        border: 2px solid var(--black);
        border-top: 8px solid var(--black);
    }
    
    .dotted-line {
        border-bottom: 2px dashed var(--black);
    }
    
    .success-badge {
        background-color: #10B981;
        color: var(--white);
    }
    
    .failure-badge {
        background-color: #EF4444;
        color: var(--white);
    }
</style>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center p-4">
    <%
        CoursesDAO cdao = new CoursesDAOImpl();
        Student s = (Student) session.getAttribute("student");
        Payment p = (Payment) request.getAttribute("payment");
        
        if(p == null || s == null) {
            response.sendRedirect("courses.jsp?error=Invalid payment receipt");
            return;
        }
        
        Courses c = cdao.getCourses(p.getCourseId());
        String tax = (String) request.getAttribute("tax");
        
        
        // Calculate values
        double courseFees = c.getFees();
        double taxAmount = Double.parseDouble(tax);
        double totalAmount = p.getAmount();
        
        // Determine status color and icon
        String statusClass = "success".equalsIgnoreCase(p.getStatus()) ? "success-badge" : "failure-badge";
        String statusIcon = "success".equalsIgnoreCase(p.getStatus()) ? "fa-check-circle" : "fa-times-circle";
    %>
    
    <!-- Main Receipt Container -->
    <div class="w-full max-w-md bg-white receipt-border rounded-lg shadow-2xl p-6">
        
        <!-- Success/Error Messages -->
       
        <!-- Header -->
        <div class="text-center mb-6">
            <div class="flex items-center justify-center mb-4">
                <div class="bg-black text-white p-2 rounded-lg mr-3">
                    <i class="fas fa-graduation-cap text-2xl"></i>
                </div>
                <div>
                    <h1 class="text-2xl font-bold text-black">ProDhee</h1>
                    <p class="text-sm text-gray-600">Education Payment Receipt</p>
                </div>
            </div>
            
            <!-- Status Badge -->
            <div class="inline-flex items-center px-4 py-2 rounded-full <%= statusClass %> mb-2">
                <i class="fas <%= statusIcon %> mr-2"></i>
                <span class="font-bold uppercase"><%= p.getStatus() %></span>
            </div>
            
            <p class="text-gray-600 text-sm">Transaction completed on <%=LocalDate.now()%></p>
        </div>
        
        <!-- Receipt Content -->
        <div class="space-y-6">
            <!-- Transaction ID -->
            <div class="bg-gray-50 p-4 rounded-lg">
                <div class="text-center">
                    <p class="text-sm text-gray-600 mb-1">Transaction ID</p>
                    <p class="font-mono text-lg font-bold text-black tracking-wider"><%= p.getTransactionId() %></p>
                </div>
            </div>
            
            <!-- Course Details -->
            <div>
                <h2 class="text-lg font-bold text-black mb-3 pb-2 border-b border-gray-200">Course Details</h2>
                <div class="space-y-3">
                    <div class="flex justify-between">
                        <span class="text-gray-600">Course Name</span>
                        <span class="font-medium text-black"><%= c.getCourseName() %></span>
                    </div>
                    <div class="flex justify-between">
                        <span class="text-gray-600">Duration</span>
                        <span class="font-medium text-black"><%= c.getMonths()%> months</span>
                    </div>
                </div>
            </div>
            
            <!-- Student Details -->
            <div>
                <h2 class="text-lg font-bold text-black mb-3 pb-2 border-b border-gray-200">Student Information</h2>
                <div class="space-y-3">
                    <div class="flex justify-between">
                        <span class="text-gray-600">Student Name</span>
                        <span class="font-medium text-black"><%= s.getName() %></span>
                    </div>
                    <div class="flex justify-between">
                        <span class="text-gray-600">Phone Number</span>
                        <span class="font-medium text-black"><%= s.getPhone() %></span>
                    </div>
                </div>
            </div>
            
            <!-- Payment Breakdown -->
            <div>
                <h2 class="text-lg font-bold text-black mb-3 pb-2 border-b border-gray-200">Payment Summary</h2>
                <div class="space-y-3">
                    <div class="flex justify-between">
                        <span class="text-gray-600">Course Fees</span>
                        <span class="font-medium">&#8733;<%=c.getFees()%>0/-</span>
                    </div>
                    <div class="flex justify-between">
                        <span class="text-gray-600">GST (18%)</span>
                        <span class="font-medium">&#8733;<%=tax%>0/-</span>
                    </div>
                    
                    <!-- Dotted Line Separator -->
                    <div class="dotted-line pt-2"></div>
                    
                    <div class="flex justify-between pt-2">
                        <span class="text-lg font-bold text-black">Total Amount</span>
                        <span class="text-xl font-bold text-black">&#8733;<%=p.getAmount()%>0/-</span>
                    </div>
                </div>
            </div>
            
            <!-- Payment Method -->
            <div class="bg-gray-50 p-4 rounded-lg">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm text-gray-600 mb-1">Payment Method</p>
                        <p class="font-medium text-black">
                            <% 
                                String method = p.getMethod();
                                String methodIcon = "";
                                
                                switch(method.toLowerCase()) {
                                    case "card":
                                        methodIcon = "fa-credit-card";
                                        method = "Credit/Debit Card";
                                        break;
                                    case "upi":
                                        methodIcon = "fa-mobile-alt";
                                        method = "UPI Payment";
                                        break;
                                    case "netbanking":
                                        methodIcon = "fa-university";
                                        method = "Net Banking";
                                        break;
                                    case "wallet":
                                        methodIcon = "fa-wallet";
                                        method = "Digital Wallet";
                                        break;
                                    default:
                                        methodIcon = "fa-money-bill-wave";
                                }
                            %>
                            <i class="fas <%= methodIcon %> mr-2"></i>
                            <%= method %>
                        </p>
                    </div>
                    <div class="text-right">
                        <p class="text-sm text-gray-600 mb-1">Amount Paid</p>
                        <p class="text-xl font-bold text-black">&#8733;<%=p.getAmount()%>0/-</p>
                    </div>
                </div>
            </div>
            
            <!-- Receipt Footer -->
            <div class="text-center pt-4 border-t border-gray-200">
          
                <!-- Action Buttons -->
                <div class="flex space-x-3 mt-6">
                    <a href="my-courses.jsp" 
                       class="flex-1 bg-black text-white font-semibold py-3 rounded-lg text-center hover:bg-gray-800 transition duration-200">
                        <i class="fas fa-book mr-2"></i>
                        View Courses
                    </a>
                    <!-- Print Button (CSS-only) -->
                    <button onclick="window.print()" 
                            class="flex-1 border-2 border-black text-black font-semibold py-3 rounded-lg text-center hover:bg-gray-100 transition duration-200">
                        <i class="fas fa-print mr-2"></i>
                        Print Receipt
                    </button>
                </div>
                
                <!-- Note for Print -->
                <div class="mt-4 p-3 bg-yellow-50 rounded-lg hidden print:block">
                    <p class="text-sm text-yellow-800 text-center">
                        <i class="fas fa-info-circle mr-2"></i>
                        This is your official payment receipt. Please keep it for your records.
                    </p>
                    <p class="text-xs text-gray-500">
                For any queries, contact: support@learnsphere.com | +1 (555) 123-4567
            </p>
                </div>
            </div>
        </div>
        
        <!-- Receipt Footer Note -->
        
    </div>
    
    <!-- Print Styles -->
    <style>
        @media print {
            body {
                background-color: white;
                padding: 0;
                margin: 0;
            }
            
            .receipt-border {
                border: 2px solid black;
                box-shadow: none;
                width: 100%;
                max-width: 100%;
            }
            
            button, a {
                display: none !important;
            }
            
            .hidden.print\:block {
                display: block !important;
            }
            
            .no-print {
                display: none !important;
            }
        }
        
        /* Ensure proper layout for print */
        @page {
            margin: 0.5cm;
            size: A4 portrait;
        }
    </style>
</body>
</html>