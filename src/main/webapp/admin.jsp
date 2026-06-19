<%@page import="in.ps.studentapp.dto.Payment"%>
<%@page import="in.ps.studentapp.dto.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.ps.studentapp.dao.PaymentDAOImpl"%>
<%@page import="in.ps.studentapp.dao.PaymentsDAO"%>
<%@page import="in.ps.studentapp.dao.StudentDAOImpl"%>
<%@page import="in.ps.studentapp.dao.StudentDAO"%>
<%@page import="in.ps.studentapp.dto.Courses"%>
<%@page import="in.ps.studentapp.dao.CoursesDAOImpl"%>
<%@page import="in.ps.studentapp.dao.CoursesDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - ProDhee</title>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
    :root {
        --sunset-orange: #FF6B35;
        --sunset-orange-light: #FF8E5E;
        --sunset-orange-dark: #E55A2B;
        --black: #000000;
        --white: #FFFFFF;
        --gray-light: #F5F5F5;
        --gray-medium: #E0E0E0;
        --gray-dark: #333333;
    }
    
    .btn-primary {
        background-color: var(--sunset-orange);
        color: var(--white);
        transition: all 0.3s ease;
    }
    
    .btn-primary:hover {
        background-color: var(--sunset-orange-dark);
    }
    
    .btn-outline {
        border: 2px solid var(--sunset-orange);
        color: var(--sunset-orange);
        transition: all 0.3s ease;
    }
    
    .btn-outline:hover {
        background-color: var(--sunset-orange);
        color: var(--white);
    }
    
    .link-orange {
        color: var(--sunset-orange);
        transition: color 0.3s ease;
    }
    
    .link-orange:hover {
        color: var(--sunset-orange-dark);
    }
    
    .nav-link.active {
        background-color: rgba(255, 107, 53, 0.1);
        color: var(--sunset-orange);
        border-right: 4px solid var(--sunset-orange);
    }
    
    .stat-card {
        border-left: 4px solid var(--sunset-orange);
        transition: transform 0.3s ease;
    }
    
    .stat-card:hover {
        transform: translateY(-5px);
    }
    
    .table-row:hover {
        background-color: var(--gray-light);
    }
</style>
</head>
<body class="bg-gray-50">
    <!-- Admin Header -->
    <!-- Admin Header -->
<header class="bg-white shadow-md">
    <div class="container mx-auto px-4 py-3">
        <div class="flex justify-between items-center">
            <!-- Logo and Title -->
            <div class="flex items-center space-x-3">
                <div class="bg-black text-white p-2 rounded-lg">
                    <i class="fas fa-graduation-cap text-2xl"></i>
                </div>
                <div>
                    <h1 class="text-2xl font-bold text-black">LearnSphere</h1>
                    <p class="text-sm text-gray-600">Admin Dashboard</p>
                </div>
            </div>
            
            <!-- Admin User Info with Dropdown -->
            <div class="flex items-center space-x-4">
                <a href="index.jsp" class="btn-outline px-4 py-2 rounded-lg text-sm font-medium mr-2">
                    <i class="fas fa-external-link-alt mr-2"></i>
                    View Site
                </a>
                
                <!-- Admin Dropdown Container -->
                <div class="relative group" tabindex="0">
                    <div class="flex items-center space-x-2 bg-orange-50 px-4 py-2 rounded-full cursor-pointer hover:bg-orange-100 transition duration-200">
                        <div class="bg-orange-500 text-white p-2 rounded-full">
                            <i class="fas fa-user-shield"></i>
                        </div>
                        <div>
                            <p class="font-medium text-black">Admin</p>
                            <p class="text-xs text-gray-600">Administrator</p>
                        </div>
                        <i class="fas fa-chevron-down text-gray-500 text-sm"></i>
                    </div>
                    
                    <!-- Dropdown Menu -->
                    <div class="absolute right-0 top-full mt-2 w-56 bg-white rounded-lg shadow-xl border border-gray-200 overflow-hidden opacity-0 invisible group-focus:opacity-100 group-focus:visible transition-all duration-200 z-50">
                        <!-- User Info -->
                        <div class="px-4 py-3 border-b border-gray-100 bg-gray-50">
                            <p class="font-bold text-black">Administrator</p>
                            <p class="text-xs text-gray-500">admin@learnsphere.com</p>
                        </div>
                        
                        <!-- Menu Items -->
                        <div class="py-1">
                            <a href="admin-profile.jsp" class="flex items-center px-4 py-3 text-gray-700 hover:bg-gray-50 transition duration-150">
                                <i class="fas fa-user-edit mr-3 text-gray-500"></i>
                                Update Account
                            </a>
                            
                            <a href="admin-settings.jsp" class="flex items-center px-4 py-3 text-gray-700 hover:bg-gray-50 transition duration-150">
                                <i class="fas fa-cog mr-3 text-gray-500"></i>
                                Settings
                            </a>
                            
                            <a href="admin-change-password.jsp" class="flex items-center px-4 py-3 text-gray-700 hover:bg-gray-50 transition duration-150">
                                <i class="fas fa-key mr-3 text-gray-500"></i>
                                Change Password
                            </a>
                            
                            <div class="border-t border-gray-100">
                                <!-- Logout Form -->
                                <form action="logout" method="POST" class="w-full">
                                    <button type="submit" class="w-full text-left flex items-center px-4 py-3 text-red-600 hover:bg-red-50 transition duration-150">
                                        <i class="fas fa-sign-out-alt mr-3"></i>
                                        Logout
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- CSS for dropdown functionality -->
<style>
    /* Dropdown styles */
    .group:focus .group-focus\:opacity-100 {
        opacity: 1;
    }
    
    .group:focus .group-focus\:visible {
        visibility: visible;
    }
    
    .group:focus-within .group-focus\:opacity-100 {
        opacity: 1;
    }
    
    .group:focus-within .group-focus\:visible {
        visibility: visible;
    }
    
    /* Remove default outline and make dropdown focusable */
    .group:focus {
        outline: none;
    }
    
    .group:focus > div:first-child {
        outline: 2px solid var(--sunset-orange);
        outline-offset: 2px;
    }
    
    /* Dropdown positioning */
    [tabindex="0"] {
        outline: none;
    }
</style>

    <div class="flex">
        

        <!-- Main Content -->
        <main class="flex-1 p-6">
            <!-- Page Header -->
            <div class="mb-6">
                <h1 class="text-3xl font-bold text-black mb-2">Admin Dashboard</h1>
                <p class="text-gray-600">Welcome to LearnSphere administration panel</p>
            </div>
            
            <%
            // Initialize DAOs
            StudentDAO sdao = new StudentDAOImpl();
            PaymentsDAO pdao = new PaymentDAOImpl();
            CoursesDAO cdao = new CoursesDAOImpl();
            
            // Get student count
            Integer studentCount = sdao.getStudent().size();
            
            // Calculate total amount
            ArrayList<Payment> payments = pdao.getPayment();
            Double totalAmount = 0.0;
            if(payments != null) {
                for(Payment p : payments) {
                    if(p.getAmount() != null) {
                        totalAmount += p.getAmount();
                    }
                }
            }
            
            // Get courses count
            ArrayList<Courses> courses = cdao.getCourses();
            Integer courseCount = courses != null ? courses.size() : 0;
            
            // Get successful payments count
            Integer successfulPayments = 0;
            if(payments != null) {
                for(Payment p : payments) {
                    if("success".equalsIgnoreCase(p.getStatus())) {
                        successfulPayments++;
                    }
                }
            }
            
            // Format numbers
            DecimalFormat df = new DecimalFormat("#,##0.00");
            %>
            
            <!-- Statistics Cards -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                <!-- Students Card -->
                <div class="stat-card bg-white rounded-xl shadow p-6">
                    <div class="flex justify-between items-start">
                        <div>
                            <p class="text-gray-500 text-sm mb-2">Total Students</p>
                            <h3 class="text-3xl font-bold text-black"><%= studentCount %></h3>
                            <p class="text-gray-600 text-sm mt-2">Registered learners</p>
                        </div>
                        <div class="bg-blue-50 p-3 rounded-lg">
                            <i class="fas fa-users text-blue-500 text-2xl"></i>
                        </div>
                    </div>
                    <div class="mt-4 pt-4 border-t border-gray-100">
                        <a href="admin-students.jsp" class="link-orange font-medium text-sm flex items-center">
                            View All Students
                            <i class="fas fa-arrow-right ml-2"></i>
                        </a>
                    </div>
                </div>
                
                <!-- Revenue Card -->
                <div class="stat-card bg-white rounded-xl shadow p-6">
                    <div class="flex justify-between items-start">
                        <div>
                            <p class="text-gray-500 text-sm mb-2">Total Revenue</p>
                            <h3 class="text-3xl font-bold text-black">$<%= df.format(totalAmount) %></h3>
                            <p class="text-gray-600 text-sm mt-2">Amount collected</p>
                        </div>
                        <div class="bg-green-50 p-3 rounded-lg">
                            <i class="fas fa-dollar-sign text-green-500 text-2xl"></i>
                        </div>
                    </div>
                    <div class="mt-4 pt-4 border-t border-gray-100">
                        <a href="admin-payments.jsp" class="link-orange font-medium text-sm flex items-center">
                            View Payments
                            <i class="fas fa-arrow-right ml-2"></i>
                        </a>
                    </div>
                </div>
                
                <!-- Courses Card -->
                <div class="stat-card bg-white rounded-xl shadow p-6">
                    <div class="flex justify-between items-start">
                        <div>
                            <p class="text-gray-500 text-sm mb-2">Total Courses</p>
                            <h3 class="text-3xl font-bold text-black"><%= courseCount %></h3>
                            <p class="text-gray-600 text-sm mt-2">Available courses</p>
                        </div>
                        <div class="bg-purple-50 p-3 rounded-lg">
                            <i class="fas fa-book text-purple-500 text-2xl"></i>
                        </div>
                    </div>
                    <div class="mt-4 pt-4 border-t border-gray-100">
                        <a href="#courses-section" class="link-orange font-medium text-sm flex items-center">
                            Manage Courses
                            <i class="fas fa-arrow-right ml-2"></i>
                        </a>
                    </div>
                </div>
                
                <!-- Successful Payments -->
                <div class="stat-card bg-white rounded-xl shadow p-6">
                    <div class="flex justify-between items-start">
                        <div>
                            <p class="text-gray-500 text-sm mb-2">Successful Payments</p>
                            <h3 class="text-3xl font-bold text-black"><%= successfulPayments %></h3>
                            <p class="text-gray-600 text-sm mt-2">Completed transactions</p>
                        </div>
                        <div class="bg-yellow-50 p-3 rounded-lg">
                            <i class="fas fa-check-circle text-yellow-500 text-2xl"></i>
                        </div>
                    </div>
                    <div class="mt-4 pt-4 border-t border-gray-100">
                        <a href="admin-payments.jsp" class="link-orange font-medium text-sm flex items-center">
                            View Details
                            <i class="fas fa-arrow-right ml-2"></i>
                        </a>
                    </div>
                </div>
            </div>
            
            <!-- Recent Payments Section -->
            <div class="bg-white rounded-xl shadow mb-8">
                <div class="p-6 border-b border-gray-200">
                    <div class="flex justify-between items-center">
                        <h2 class="text-xl font-bold text-black">Recent Payments</h2>
                        <a href="admin-payments.jsp" class="link-orange font-medium text-sm">
                            View All
                        </a>
                    </div>
                </div>
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Transaction ID</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Student</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Course</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Amount</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-200">
                            <%
                            // Display recent payments (last 5)
                            int count = 0;
                            if(payments != null && !payments.isEmpty()) {
                                for(int i = payments.size() - 1; i >= 0 && count < 5; i--) {
                                    Payment payment = payments.get(i);
                                    Student student = sdao.getStudentById(payment.getStudentId());
                                    Courses course = cdao.getCourses(payment.getCourseId());
                                    count++;
                            %>
                            <tr class="table-row">
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="text-sm font-medium text-gray-900"><%= payment.getTransactionId() %></span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm text-gray-900"><%= student != null ? student.getName() : "N/A" %></div>
                                    <div class="text-xs text-gray-500"><%= student != null ? student.getMail() : "" %></div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="text-sm text-gray-900"><%= course != null ? course.getCourseName() : "N/A" %></span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="text-sm font-bold text-black">$<%= df.format(payment.getAmount()) %></span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-3 py-1 text-xs rounded-full <%= "success".equalsIgnoreCase(payment.getStatus()) ? "bg-green-100 text-green-800" : "bg-red-100 text-red-800" %>">
                                        <%= payment.getStatus() %>
                                    </span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                    <%= new java.text.SimpleDateFormat("dd MMM yyyy").format(payment.getPayment_date()) %>
                                </td>
                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="6" class="px-6 py-8 text-center text-gray-500">
                                    <i class="fas fa-credit-card text-3xl mb-3 text-gray-300"></i>
                                    <p class="text-lg">No payment records found</p>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <!-- Courses Section -->
            <div id="courses-section" class="bg-white rounded-xl shadow">
                <div class="p-6 border-b border-gray-200">
                    <div class="flex justify-between items-center">
                        <h2 class="text-xl font-bold text-black">Course Management</h2>
                        <div class="flex space-x-3">
                            <a href="admin-add-course.jsp" class="btn-primary px-4 py-2 rounded-lg text-sm font-medium">
                                <i class="fas fa-plus mr-2"></i>
                                Add New Course
                            </a>
                        </div>
                    </div>
                </div>
                <div class="p-6">
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        <%
                        if(courses != null && !courses.isEmpty()) {
                            for(Courses course : courses) {
                        %>
                        <div class="border border-gray-200 rounded-lg p-4 hover:shadow-md transition duration-200">
                            <div class="flex justify-between items-start mb-3">
                                <h3 class="font-bold text-black"><%= course.getCourseName() %></h3>
                                <span class="bg-gray-100 text-gray-800 text-xs px-2 py-1 rounded">
                                    <%= course.getCategory() %>
                                </span>
                            </div>
                            <p class="text-gray-600 text-sm mb-4 line-clamp-2"><%= course.getCourseInfo()%></p>
                            <div class="flex justify-between items-center">
                                <div>
                                    <span class="font-bold text-black">$<%= df.format(course.getFees()) %></span>
                                    <span class="text-gray-500 text-sm ml-2">• <%= course.getMonths() %> months</span>
                                </div>
                                <div class="flex space-x-2">
                                    <a href="admin-update-course.jsp?id=<%= course.getCourseId() %>" 
                                       class="text-blue-600 hover:text-blue-800 text-sm font-medium">
                                        Edit
                                    </a>
                                    <span class="text-gray-300">|</span>
                                    <a href="admin-delete-course.jsp?id=<%= course.getCourseId() %>" 
                                       class="text-red-600 hover:text-red-800 text-sm font-medium">
                                        Delete
                                    </a>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        } else {
                        %>
                        <div class="col-span-3 text-center py-8">
                            <i class="fas fa-book-open text-4xl text-gray-300 mb-4"></i>
                            <p class="text-gray-500">No courses available</p>
                            <a href="admin-add-course.jsp" class="link-orange font-medium mt-2 inline-block">
                                Add your first course
                            </a>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>