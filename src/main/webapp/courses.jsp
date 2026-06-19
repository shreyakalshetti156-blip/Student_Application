<%@page import="in.ps.studentapp.dto.Courses"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.ps.studentapp.dao.CoursesDAOImpl"%>
<%@page import="in.ps.studentapp.dao.CoursesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Courses</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
   <style>
        /* Sunset Orange Color Palette */
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
        
        .course-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 1px solid var(--gray-medium);
        }
        
        .course-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.1);
        }
        
        .nav-link {
            position: relative;
        }
        
        .nav-link.active::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            right: 0;
            height: 3px;
            background-color: var(--sunset-orange);
            border-radius: 3px;
        }
        
        .hero-gradient {
            background: linear-gradient(135deg, #FF6B35 0%, #FF8E5E 50%, #FFB38A 100%);
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
        
        .category-tag {
            font-weight: 600;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.75rem;
            display: inline-block;
        }
        
       
        
        .category-courseName {
            background-color: rgba(0, 150, 136, 0.15);
            color: #009688;
        }
        
     
        .level-category {
            background-color: rgba(255, 152, 0, 0.15);
            color: #FF9800;
        }
        
       
        
        /* Mobile menu animation */
        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .mobile-menu {
            animation: slideDown 0.3s ease-out;
        }
        
        /* Course filtering with CSS */
        .course-filter:target ~ #courses-container .course-card {
            display: none;
        }
        
        #filter-all:target ~ #courses-container .course-card,
        #filter-java:target ~ #courses-container .course-card[data-category="java"],
        #filter-python:target ~ #courses-container .course-card[data-category="python"],
        #filter-mern:target ~ #courses-container .course-card[data-category="mern"],
        #filter-devops:target ~ #courses-container .course-card[data-category="devops"] {
            display: block;
        }
    </style>
</head>
<body>
	
    <%@include file="header.jsp"%>
    <nav class="bg-black text-white">
            <div class="container mx-auto px-4">
            <%Student student=(Student)session.getAttribute("student");%>
            <%CoursesDAO cdao=new CoursesDAOImpl();
            //ArrayList<Courses> courses=cdao.getCourses();
            ArrayList<Courses> courseList=(ArrayList<Courses>)request.getAttribute("courseList");%>
                <div class="flex flex-col md:flex-row justify-between items-center">
                    <ul class="flex flex-wrap justify-center md:justify-start space-x-1 md:space-x-6 py-3">
                        <li><a href="index.jsp" class="nav-link px-3 py-2 rounded-md hover:bg-gray-800 transition duration-200">Home</a></li>
                        <li><a href="courses?category=Java" class="nav-link course-nav px-3 py-2 rounded-md hover:bg-gray-800 transition duration-200">Java</a></li>
                        <li><a href="courses?category=Python" class="nav-link course-nav px-3 py-2 rounded-md hover:bg-gray-800 transition duration-200">Python</a></li>
                        <li><a href="courses?category=Angular%2FReact" class="nav-link course-nav px-3 py-2 rounded-md hover:bg-gray-800 transition duration-200">Angular/React</a></li>
                        <li><a href="courses?category=Cloud" class="nav-link course-nav px-3 py-2 rounded-md hover:bg-gray-800 transition duration-200">DevOps</a></li>
                        <li><a href="courses?category=all" class="nav-link active course-nav px-3 py-2 rounded-md hover:bg-gray-800 transition duration-200">All Courses</a></li>
                    </ul>
                    
                    <!-- Mobile menu toggle -->
                    <div class="md:hidden py-2">
                        <label for="mobile-menu-toggle" class="text-white cursor-pointer">
                            <i class="fas fa-bars text-xl"></i>
                        </label>
                    </div>
                </div>
            </div>
        </nav>

		
        <!-- Filter Anchors (Hidden) -->
        <div class="hidden">
            <div id="filter-all" class="course-filter"></div>
            <div id="filter-java" class="course-filter"></div>
            <div id="filter-python" class="course-filter"></div>
            <div id="filter-mern" class="course-filter"></div>
            <div id="filter-devops" class="course-filter"></div>
        </div>
        <!-- Courses Display Area -->
        <div id="courses-container" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <!-- Java Course 1 -->
            
            	
            <%
            	if(courseList!=null&&!courseList.isEmpty()){
            		for(Courses c:courseList){	
            	
            %>
            <div class="course-card bg-white rounded-xl overflow-hidden" data-category="courseName">
                <div class="p-6">
                    <div class="flex justify-between items-start mb-4">
                        <div class="flex flex-wrap gap-2">
                            <span class="category-tag category-courseName"><%=c.getCourseName()%></span>
                            <span class="category-tag level-category"><%=c.getCategory()%></span>
                        </div>
                        
                    </div>
                    <h3 class="text-xl font-bold text-black mb-3"><%=c.getCourseName()%></h3>
                    <p class="text-gray-700 mb-4">Master the basics of <%=c.getCourseInfo()%> and build your first applications with hands-on projects.</p>
                    <div class="flex items-center justify-between">
                        <div class="flex items-center text-gray-700">
                            <i class="fas fa-clock mr-2"></i>
                            <span><%=c.getMonths()%> Months</span>
                        </div>
                        <div class="price-tag text-lg">&#8377;<%=c.getFees()%>0/-</div>
                    </div>
                </div>
               <div class="px-6 py-4 border-t border-gray-200">
    	<form action="payment.jsp" method="POST" class="w-full">
        <input type="hidden" name="courseId" value="<%=c.getCourseId()%>">
        <%if(student==null){%>
        	<div class="px-6 py-4 border-t border-gray-200">
                    <a href="login.jsp" class="block text-center btn-primary font-semibold py-3 rounded-lg">Enroll Now</a>
                </div>
        
        <%}
        
        else{%>
        <button type="submit" class="w-full btn-primary font-semibold py-3 rounded-lg hover:bg-orange-600 transition duration-200 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:ring-offset-2">
            Enroll Now
        </button>
        <%}%>
    </form>
</div>
            </div>
            <%
            	}
            }
            %>
        </div>
    
    <%@include file="footer.jsp" %>
</body>
</html>