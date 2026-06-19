<!DOCTYPE html>
<%@page import="in.ps.studentapp.dto.Courses"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.ps.studentapp.dao.CoursesDAOImpl"%>
<%@page import="in.ps.studentapp.dao.CoursesDAO"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Courses Portal</title>
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
<body class="bg-white text-black">
    <%@include file="header.jsp" %>

<nav class="bg-black text-white">
            <div class="container mx-auto px-4">
                <div class="flex flex-col md:flex-row justify-between items-center">
                    <ul class="flex flex-wrap justify-center md:justify-start space-x-1 md:space-x-6 py-3">
                        <li><a href="index.jsp" class="nav-link active px-3 py-2 rounded-md hover:bg-gray-800 transition duration-200">Home</a></li>
                        <li><a href="index.jsp" class="nav-link course-nav px-3 py-2 rounded-md hover:bg-gray-800 transition duration-200">Services</a></li>
                        <li><a href="index.jsp" class="nav-link course-nav px-3 py-2 rounded-md hover:bg-gray-800 transition duration-200">Contact Us</a></li>
                        <li><a href="index.jsp" class="nav-link course-nav px-3 py-2 rounded-md hover:bg-gray-800 transition duration-200">About us</a></li>             
                    </ul>
                    
                    
                    <div class="md:hidden py-2">
                        <label for="mobile-menu-toggle" class="text-white cursor-pointer">
                            <i class="fas fa-bars text-xl"></i>
                        </label>
                    </div>
                </div>
            </div>
        </nav>


    <!-- Main Content -->
    <main class="container mx-auto px-4 py-8">
        <!-- Hero/Promotional Section -->
        <section class="hero-gradient text-white rounded-2xl p-8 mb-12 shadow-lg">
            <div class="max-w-2xl">
                <h2 class="text-4xl font-bold mb-4">Master In-Demand Tech Skills</h2>
                <p class="text-xl mb-6 opacity-95">Learn from industry experts with hands-on projects. Transform your career with our curated courses designed for today's job market.</p>
                <div class="flex flex-wrap gap-4">
                    <a href="courses?category=all" class="btn-primary font-semibold px-6 py-3 rounded-lg">Browse All Courses</a>
                    <a href="#" class="bg-white text-orange-600 font-semibold px-6 py-3 rounded-lg hover:bg-gray-100 transition duration-200">Free Trial Lesson</a>
                </div>
            </div>
        </section>

          <!-- Filter Anchors (Hidden) -->
        <div class="hidden">
            <div id="filter-all" class="course-filter"></div>
            <div id="filter-java" class="course-filter"></div>
            <div id="filter-python" class="course-filter"></div>
            <div id="filter-mern" class="course-filter"></div>
            <div id="filter-devops" class="course-filter"></div>
        </div>

		

      
<div id="courses-container" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8"> 
    <!-- Java Course -->
    <div class="course-card bg-white rounded-xl overflow-hidden" data-category="java">
        <div class="p-6">
            <div class="flex justify-between items-start mb-4">
                <div class="flex flex-wrap gap-2">
                    <span class="category-tag category-java">Java</span>
                </div>
                <div class="rating-star">
                    <i class="fas fa-star"></i>
                    <span class="font-bold ml-1 text-black">4.8</span>
                </div>
            </div>
            <div class="flex items-center mb-3">
                <div class="bg-gray-100 p-3 rounded-lg mr-3">
                    <i class="fas fa-coffee text-orange-500 text-xl"></i>
                </div>
                <h3 class="text-lg font-bold text-black">Java Programming</h3>
            </div>
            <p class="text-gray-700 mb-4 text-sm">Master Java fundamentals and build applications</p>
            <div class="flex items-center justify-between text-sm">
                <div class="text-gray-600">
                    
                </div>
                
            </div>
        </div>
    </div>
    
    <!-- Python Course Example -->
    <div class="course-card bg-white rounded-xl overflow-hidden" data-category="python">
        <div class="p-6">
            <div class="flex justify-between items-start mb-4">
                <div class="flex flex-wrap gap-2">
                    <span class="category-tag category-python">Python</span>
                </div>
                <div class="rating-star">
                    <i class="fas fa-star"></i>
                    <span class="font-bold ml-1 text-black">4.7</span>
                </div>
            </div>
            <div class="flex items-center mb-3">
                <div class="bg-gray-100 p-3 rounded-lg mr-3">
                    <i class="fab fa-python text-green-500 text-xl"></i>
                </div>
                <h3 class="text-lg font-bold text-black">Python Data Science</h3>
            </div>
            <p class="text-gray-700 mb-4 text-sm">Learn data analysis and visualization with Python</p>
            <div class="flex items-center justify-between text-sm">
                <div class="text-gray-600">
                    
                </div>
                
            </div>
        </div>
    </div>
    
    <!-- MERN Course Example -->
    <div class="course-card bg-white rounded-xl overflow-hidden" data-category="mern">
        <div class="p-6">
            <div class="flex justify-between items-start mb-4">
                <div class="flex flex-wrap gap-2">
                    <span class="category-tag category-mern">MERN</span>
                </div>
                <div class="rating-star">
                    <i class="fas fa-star"></i>
                    <span class="font-bold ml-1 text-black">4.8</span>
                </div>
            </div>
            <div class="flex items-center mb-3">
                <div class="bg-gray-100 p-3 rounded-lg mr-3">
                    <i class="fab fa-react text-blue-500 text-xl"></i>
                </div>
                <h3 class="text-lg font-bold text-black">MERN Stack</h3>
            </div>
            <p class="text-gray-700 mb-4 text-sm">Full stack development with MongoDB, Express, React, Node</p>
            <div class="flex items-center justify-between text-sm">
                <div class="text-gray-600">
                    
                </div>
                
            </div>
        </div>
    </div>
    
    <!-- DevOps Course Example -->
    <div class="course-card bg-white rounded-xl overflow-hidden" data-category="devops">
        <div class="p-6">
            <div class="flex justify-between items-start mb-4">
                <div class="flex flex-wrap gap-2">
                    <span class="category-tag category-devops">DevOps</span>
                </div>
                <div class="rating-star">
                    <i class="fas fa-star"></i>
                    <span class="font-bold ml-1 text-black">4.9</span>
                </div>
            </div>
            <div class="flex items-center mb-3">
                <div class="bg-gray-100 p-3 rounded-lg mr-3">
                    <i class="fab fa-docker text-blue-400 text-xl"></i>
                </div>
                <h3 class="text-lg font-bold text-black">DevOps & CI/CD</h3>
            </div>
            <p class="text-gray-700 mb-4 text-sm">Master DevOps practices and pipeline automation</p>
            <div class="flex items-center justify-between text-sm">
                <div class="text-gray-600">
                   
                </div>
                
            </div>
        </div>
    </div>
    
    <!-- JavaScript Course Example -->
    <div class="course-card bg-white rounded-xl overflow-hidden" data-category="javascript">
        <div class="p-6">
            <div class="flex justify-between items-start mb-4">
                <div class="flex flex-wrap gap-2">
                    <span class="category-tag category-java">JavaScript</span>
                </div>
                <div class="rating-star">
                    <i class="fas fa-star"></i>
                    <span class="font-bold ml-1 text-black">4.6</span>
                </div>
            </div>
            <div class="flex items-center mb-3">
                <div class="bg-gray-100 p-3 rounded-lg mr-3">
                    <i class="fab fa-js-square text-yellow-500 text-xl"></i>
                </div>
                <h3 class="text-lg font-bold text-black">Modern JavaScript</h3>
            </div>
            <p class="text-gray-700 mb-4 text-sm">Learn ES6+ features and modern web development</p>
            <div class="flex items-center justify-between text-sm">
                <div class="text-gray-600">
                    
                </div>
                
            </div>
        </div>
    </div>
    
    <!-- Cloud Course Example -->
    <div class="course-card bg-white rounded-xl overflow-hidden" data-category="cloud">
        <div class="p-6">
            <div class="flex justify-between items-start mb-4">
                <div class="flex flex-wrap gap-2">
                    <span class="category-tag category-devops">Cloud</span>
                </div>
                <div class="rating-star">
                    <i class="fas fa-star"></i>
                    <span class="font-bold ml-1 text-black">4.7</span>
                </div>
            </div>
            <div class="flex items-center mb-3">
                <div class="bg-gray-100 p-3 rounded-lg mr-3">
                    <i class="fas fa-cloud text-blue-300 text-xl"></i>
                </div>
                <h3 class="text-lg font-bold text-black">Cloud Computing</h3>
            </div>
            <p class="text-gray-700 mb-4 text-sm">Learn AWS, Azure and cloud infrastructure</p>
            <div class="flex items-center justify-between text-sm">
                <div class="text-gray-600">
                    
                   
                </div>
                
            </div>
        </div>
    </div>
    
    <% // } // End of for loop in JSP %>
</div>
           
        <!-- Call to Action Section -->
        <section class="mt-16 mb-12 p-8 bg-gray-50 rounded-2xl border border-gray-200">
            <div class="text-center max-w-3xl mx-auto">
                <h2 class="text-3xl font-bold text-black mb-4">Ready to Start Your Learning Journey?</h2>
                <p class="text-gray-700 mb-6 text-lg">Join thousands of students who have transformed their careers with our expert-led courses. No prior experience needed for beginner courses.</p>
                <div class="flex flex-wrap justify-center gap-4">
                    <a href="courses.jsp" class="btn-primary font-semibold px-8 py-3 rounded-lg text-lg">Explore All Courses</a>
                    <a href="#" class="btn-outline font-semibold px-8 py-3 rounded-lg text-lg">Contact an Advisor</a>
                </div>
            </div>
        </section>
    </main>

   <%@include file="footer.jsp" %>

    <!-- Mobile Menu (Hidden by default) -->
    <div id="mobile-menu" class="md:hidden hidden fixed inset-0 z-50 bg-black bg-opacity-95 pt-20 mobile-menu">
        <div class="container mx-auto px-4">
            <div class="flex flex-col space-y-4">
                <a href="index.jsp" class="text-white text-xl font-semibold py-4 border-b border-gray-800 hover:text-orange-500">Home</a>
                <a href="courses?category=Java" class="text-white text-xl font-semibold py-4 border-b border-gray-800 hover:text-orange-500">Java Courses</a>
                <a href="courses?category=Python" class="text-white text-xl font-semibold py-4 border-b border-gray-800 hover:text-orange-500">Python Courses</a>
                <a href="courses?category=Angular%2FReact" class="text-white text-xl font-semibold py-4 border-b border-gray-800 hover:text-orange-500">MERN Stack Courses</a>
                <a href="courses?category=Cloud" class="text-white text-xl font-semibold py-4 border-b border-gray-800 hover:text-orange-500">DevOps Courses</a>
                <a href="courses?category=all" class="text-white text-xl font-semibold py-4 border-b border-gray-800 hover:text-orange-500">All Courses</a>
                
                <div class="pt-8">
                    <div class="flex items-center space-x-3 px-4 py-3 bg-gray-900 rounded-lg">
                        <div class="bg-orange-500 text-white p-2 rounded-full">
                            <i class="fas fa-user"></i>
                        </div>
                        <div>
                            <p class="font-medium text-white">John Doe</p>
                            <p class="text-sm text-gray-400">Student Account</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="absolute bottom-8 left-0 right-0 px-4">
                <label for="mobile-menu-toggle" class="block text-center text-gray-400 hover:text-white cursor-pointer">
                    <i class="fas fa-times text-2xl"></i>
                    <span class="block mt-2">Close Menu</span>
                </label>
            </div>
        </div>
    </div>

    <!-- Hidden checkbox for mobile menu toggle -->
    <input type="checkbox" id="mobile-menu-toggle" class="hidden">
    
    <!-- Mobile menu toggle with CSS-only functionality -->
    <style>
        /* CSS-only mobile menu toggle */
        #mobile-menu-toggle:checked ~ #mobile-menu {
            display: block;
        }
        
        /* Update course section title based on filter */
        #filter-all:target ~ main #course-section-title::after {
            content: "All Courses";
        }
        
        #filter-java:target ~ main #course-section-title::after {
            content: "Java Courses";
        }
        
        #filter-python:target ~ main #course-section-title::after {
            content: "Python Courses";
        }
        
        #filter-mern:target ~ main #course-section-title::after {
            content: "MERN Stack Courses";
        }
        
        #filter-devops:target ~ main #course-section-title::after {
            content: "DevOps Courses";
        }
        
        /* Show/hide courses based on filter */
        #filter-all:target ~ main #courses-container .course-card {
            display: block;
        }
        
        #filter-java:target ~ main #courses-container .course-card:not([data-category="java"]) {
            display: none;
        }
        
        #filter-python:target ~ main #courses-container .course-card:not([data-category="python"]) {
            display: none;
        }
        
        #filter-mern:target ~ main #courses-container .course-card:not([data-category="mern"]) {
            display: none;
        }
        
        #filter-devops:target ~ main #courses-container .course-card:not([data-category="devops"]) {
            display: none;
        }
        
        /* Highlight active nav link */
        #filter-all:target ~ header nav a[href="#filter-all"],
        #filter-java:target ~ header nav a[href="#filter-java"],
        #filter-python:target ~ header nav a[href="#filter-python"],
        #filter-mern:target ~ header nav a[href="#filter-mern"],
        #filter-devops:target ~ header nav a[href="#filter-devops"] {
            background-color: #333;
            color: #FF6B35;
        }
    </style>
</body>
</html>