<%@page import="in.ps.studentapp.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DevLearn Pro</title>
<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>

</head>
<body>
<%
	Student s=(Student)session.getAttribute("student");
    
%>
   <!-- Header Section -->
    <header class="sticky top-0 z-50 bg-white shadow-sm border-b border-gray-200">
        <div class="container mx-auto px-4 py-4">
            <div class="flex flex-col md:flex-row justify-between items-center">
                <!-- Logo and Brand Name -->
                <div class="flex items-center space-x-3 mb-4 md:mb-0">
                    <div class="bg-black text-white p-2 rounded-lg">
                        <i class="fas fa-graduation-cap text-2xl"></i>
                    </div>
                    <div>
                        <h1 class="text-2xl font-bold text-black">ProDhee</h1>
                        <p class="text-sm text-gray-600">Student Courses Portal</p>
                    </div>
                </div>

                <!-- Search option -->
<div class="w-full md:w-1/3 mb-4 md:mb-0">
    <div class="relative">
        <form action="search" method="post" class="relative">
            <input 
                type="text" 
                name="searchQuery"
                placeholder="Search courses..." 
                class="w-full p-3 pl-10 pr-12 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500"
            >
            <i class="fas fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
            <button 
                type="submit" 
                class="absolute right-0 top-0 h-full px-4 bg-orange-500 text-white rounded-r-lg hover:bg-orange-600 transition duration-200 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:ring-offset-2"
            >
                Search
            </button>
        </form>
    </div>
</div>

              <!-- User Section -->
<div class="flex items-center space-x-2 px-4 py-2 rounded-full border border-gray-200 relative group">
    <div class="bg-orange-500 text-white p-2 rounded-full cursor-pointer">
        <i class="fas fa-user"></i>
    </div>
    <% if(s != null && s.getId() != 0) { %>
        <div class="cursor-pointer">
            <p class="font-medium text-black"><%= s.getName() %></p>
            <p class="text-xs text-gray-600">Student</p>
        </div>
        
        <!-- Dropdown Menu (Hidden by default, shown on hover) -->
        <div class="absolute top-full right-0 mt-2 w-48 bg-white rounded-lg shadow-xl border border-gray-200 overflow-hidden opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50">
            <div class="py-1">
                <!-- User Info Section -->
                <div class="px-4 py-3 border-b border-gray-100">
                    <p class="font-medium text-black"><%= s.getName() %></p>
                    <p class="text-xs text-gray-500"><%= s.getMail() %></p>
                </div>
                
                <!-- Menu Items -->
                <a href="dashboard.jsp" class="flex items-center px-4 py-3 text-gray-700 hover:bg-gray-50 transition duration-150">
                    <i class="fas fa-tachometer-alt mr-3 text-gray-500"></i>
                    Dashboard
                </a>
                
                <a href="courses?category=all" class="flex items-center px-4 py-3 text-gray-700 hover:bg-gray-50 transition duration-150">
                    <i class="fas fa-book mr-3 text-gray-500"></i>
                    My Courses
                </a>
                
                <a href="profile.jsp" class="flex items-center px-4 py-3 text-gray-700 hover:bg-gray-50 transition duration-150">
                    <i class="fas fa-user-edit mr-3 text-gray-500"></i>
                    Update Account
                </a>
                
                <a href="settings.jsp" class="flex items-center px-4 py-3 text-gray-700 hover:bg-gray-50 transition duration-150">
                    <i class="fas fa-cog mr-3 text-gray-500"></i>
                    Settings
                </a>
                
                <!-- Logout --> 
                <form action="logout" method="POST" class="border-t border-gray-100">
                    <button type="submit" class="w-full text-left flex items-center px-4 py-3 text-red-600 hover:bg-red-50 transition duration-150">
                        <i class="fas fa-sign-out-alt mr-3"></i>
                        Logout
                    </button>
                </form>
            </div>
        </div>
    <% } else { %>
        <div class="flex items-center space-x-4">
            <a href="login.jsp" class="text-orange-500 font-medium hover:text-orange-600 transition duration-200">
                Login
            </a>
            <span class="text-gray-300">|</span>
            <a href="signup.jsp" class="text-black font-medium hover:text-orange-500 transition duration-200">
                Sign Up
            </a>
        </div>
    <% } %>
</div>
            </div>
        </div>

        <!-- Navigation -->
        
    </header>
</body>
</html>