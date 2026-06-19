<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	 <!-- Footer -->
    <footer class="bg-black text-white pt-10 pb-6">
        <div class="container mx-auto px-4">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-8 mb-8">
                <div>
                    <div class="flex items-center space-x-3 mb-4">
                        <div class="bg-white text-black p-2 rounded-lg">
                            <i class="fas fa-graduation-cap text-2xl"></i>
                        </div>
                        <div>
                            <h2 class="text-xl font-bold">ProDhee</h2>
                            <p class="text-sm text-gray-400">Student Courses Portal</p>
                        </div>
                    </div>
                    <p class="text-gray-400">Empowering students with industry-relevant skills through expert-led courses in modern technologies.</p>
                </div>
                
                <div>
                    <h3 class="text-lg font-bold mb-4 text-white">Quick Links</h3>
                    <ul class="space-y-2">
                        <li><a href="#filter-all" class="text-gray-400 hover:text-orange-400 transition duration-200">Home</a></li>
                        <li><a href="#filter-all" class="text-gray-400 hover:text-orange-400 transition duration-200">All Courses</a></li>
                        <li><a href="#" class="text-gray-400 hover:text-orange-400 transition duration-200">Student Dashboard</a></li>
                        <li><a href="#" class="text-gray-400 hover:text-orange-400 transition duration-200">Instructors</a></li>
                    </ul>
                </div>
                
                <div>
                    <h3 class="text-lg font-bold mb-4 text-white">Course Categories</h3>
                    <ul class="space-y-2">
                        <li><a href="courses?category=Java" class="text-gray-400 hover:text-orange-400 transition duration-200">Java Programming</a></li>
                        <li><a href="courses?category=Python" class="text-gray-400 hover:text-orange-400 transition duration-200">Python & Data Science</a></li>
                        <li><a href="courses?category=Angular%2FReact" class="text-gray-400 hover:text-orange-400 transition duration-200">MEAN and MERN Stacks</a></li>
                        <li><a href="courses?category=Cloud" class="text-gray-400 hover:text-orange-400 transition duration-200">DevOps & Cloud</a></li>
                    </ul>
                </div>
                
                <div>
                    <h3 class="text-lg font-bold mb-4 text-white">Contact Us</h3>
                    <ul class="space-y-3">
                        <li class="flex items-center space-x-3 text-gray-400">
                            <i class="fas fa-envelope text-orange-500"></i>
                            <span>support@prodheetech.com</span>
                        </li>
                        <li class="flex items-center space-x-3 text-gray-400">
                            <i class="fas fa-phone text-orange-500"></i>
                            <span>+91 9900990099</span>
                        </li>
                        <li class="flex items-center space-x-3 text-gray-400">
                            <i class="fas fa-map-marker-alt text-orange-500"></i>
                            <span>Yelahanka, Bangalore 560001</span>
                        </li>
                    </ul>
                </div>
            </div>
            
            <div class="border-t border-gray-800 pt-6 flex flex-col md:flex-row justify-between items-center">
                <p class="text-gray-400 text-sm mb-4 md:mb-0">&copy; 2025 ProDhee. All rights reserved.</p>
                <div class="flex space-x-4">
                    <a href="#" class="text-gray-400 hover:text-orange-500 transition duration-200">
                        <i class="fab fa-facebook-f text-xl"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-orange-500 transition duration-200">
                        <i class="fab fa-twitter text-xl"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-orange-500 transition duration-200">
                        <i class="fab fa-linkedin-in text-xl"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-orange-500 transition duration-200">
                        <i class="fab fa-instagram text-xl"></i>
                    </a>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>