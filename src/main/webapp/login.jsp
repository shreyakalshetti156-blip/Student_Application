<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - LearnSphere</title>
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
        
        .input-focus:focus {
            border-color: var(--sunset-orange);
            box-shadow: 0 0 0 2px rgba(255, 107, 53, 0.2);
        }
        
        .link-orange {
            color: var(--sunset-orange);
            transition: color 0.3s ease;
        }
        
        .link-orange:hover {
            color: var(--sunset-orange-dark);
        }
        
        .login-bg {
            background: linear-gradient(135deg, #FF6B35 0%, #FF8E5E 100%);
        }
        
        /* CSS-only password toggle */
        #password-toggle:checked ~ #password {
            font-family: "Courier New", monospace;
        }
        
        #password-toggle:checked ~ #toggle-password-label .fa-eye {
            display: none;
        }
        
        #password-toggle:not(:checked) ~ #toggle-password-label .fa-eye-slash {
            display: none;
        }
    </style>
</head>
<body class="bg-gray-50 min-h-screen flex items-center justify-center p-4 login-bg">
    <!-- Main Login Container -->
    <div class="flex flex-col md:flex-row w-full max-w-5xl rounded-2xl overflow-hidden shadow-2xl">
        
        <!-- Left Side - Brand & Info -->
        <div class="md:w-2/5 bg-black text-white p-10 flex flex-col justify-between">
            <div>
                <div class="flex items-center space-x-3 mb-8">
                    <div class="bg-white text-black p-3 rounded-lg">
                        <i class="fas fa-graduation-cap text-3xl"></i>
                    </div>
                    <div>
                        <h1 class="text-3xl font-bold">ProDhee</h1>
                        <p class="text-gray-300">Student Courses Portal</p>
                    </div>
                </div>
                
                <div class="mt-10">
                    <h2 class="text-2xl font-bold mb-4">Welcome Back!</h2>
                    <p class="text-gray-300 mb-6">
                        Sign in to access your personalized dashboard, continue your learning journey, and explore new courses.
                    </p>
                    
                    <div class="space-y-4">
                        <div class="flex items-center space-x-3">
                            <div class="bg-orange-500 p-2 rounded-full">
                                <i class="fas fa-book text-sm"></i>
                            </div>
                            <span>Access all your enrolled courses</span>
                        </div>
                        <div class="flex items-center space-x-3">
                            <div class="bg-orange-500 p-2 rounded-full">
                                <i class="fas fa-chart-line text-sm"></i>
                            </div>
                            <span>Track your learning progress</span>
                        </div>
                        <div class="flex items-center space-x-3">
                            <div class="bg-orange-500 p-2 rounded-full">
                                <i class="fas fa-certificate text-sm"></i>
                            </div>
                            <span>Get certificates upon completion</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="mt-8 pt-6 border-t border-gray-700">
                <p class="text-gray-400 text-sm">
                    Not a member yet? 
                    <a href="signup.jsp" class="link-orange font-medium ml-1">Create an account</a>
                </p>
            </div>
        </div>
        
        <!-- Right Side - Login Form -->
        <div class="md:w-3/5 bg-white p-10 flex items-center justify-center">
            <div class="w-full max-w-md">
                <div class="text-center mb-10">
                    <h2 class="text-3xl font-bold text-black mb-2">Sign In to Your Account</h2>
                    <p class="text-gray-600">Enter your credentials to access your account</p>
                </div>
                
                <!-- Login Form -->
                <form action="login" method="POST" class="space-y-6">
                    <!-- Display error message if exists -->
                    <%
                        String error =(String)request.getAttribute("error");
                        if(error != null) {
                    %>
                        <div class="bg-red-50 border-l-4 border-red-500 p-4 mb-4">
                            <div class="flex">
                                <div class="flex-shrink-0">
                                    <i class="fas fa-exclamation-circle text-red-500"></i>
                                </div>
                                <div class="ml-3">
                                    <p class="text-sm text-red-700">
                                        <%= error%>
                                    </p>
                                </div>
                            </div>
                        </div>
                    <% } %>
                    
                    <!-- Success message after registration -->
                    <%
                        String success =(String)request.getAttribute("success");
                        if(success!= null) {
                    %>
                        <div class="bg-green-50 border-l-4 border-green-500 p-4 mb-4">
                            <div class="flex">
                                <div class="flex-shrink-0">
                                    <i class="fas fa-check-circle text-green-500"></i>
                                </div>
                                <div class="ml-3">
                                    <p class="text-sm text-green-700">
                                        <%=success%>
                                    </p>
                                </div>
                            </div>
                        </div>
                    <% } %>
                    
                    <!-- Email Field -->
                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-envelope mr-2 text-orange-500"></i>
                            Email Address
                        </label>
                        <div class="relative">
                            <input 
                                type="email" 
                                id="email" 
                                name="mail" 
                                required
                                placeholder="Enter your email"
                                class="w-full p-4 pl-12 border border-gray-300 rounded-lg input-focus focus:outline-none transition duration-200"
                            >
                            <div class="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-400">
                                <i class="fas fa-user-circle"></i>
                            </div>
                        </div>
                        <p class="mt-1 text-xs text-gray-500">Enter your registered email address</p>
                    </div>
                    
                    <!-- Password Field with CSS-only toggle -->
                    <div>
                        <div class="flex justify-between items-center mb-2">
                            <label for="password" class="block text-sm font-medium text-gray-700">
                                <i class="fas fa-lock mr-2 text-orange-500"></i>
                                Password
                            </label>
                            <a href="forgot.jsp" class="text-sm link-orange font-medium">
                                Forgot Password?
                            </a>
                        </div>
                        <div class="relative">
                            <!-- Hidden checkbox for password toggle -->
                            <input type="checkbox" id="password-toggle" class="hidden">
                            
                            <!-- Password input with conditional styling -->
                            <input 
                                type="password" 
                                id="password" 
                                name="password" 
                                required
                                placeholder="Enter your password"
                                class="w-full p-4 pl-12 pr-12 border border-gray-300 rounded-lg input-focus focus:outline-none transition duration-200"
                            >
                            <div class="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-400">
                                <i class="fas fa-key"></i>
                            </div>
                            <!-- Password toggle label (acts as button) -->
                            <label for="password-toggle" id="toggle-password-label" 
                                   class="absolute right-4 top-1/2 transform -translate-y-1/2 text-gray-400 hover:text-gray-600 cursor-pointer">
                                <i class="fas fa-eye"></i>
                                <i class="fas fa-eye-slash"></i>
                            </label>
                        </div>
                        <p class="mt-1 text-xs text-gray-500">Password must be at least 8 characters</p>
                    </div>
                    
                    <!-- Remember Me & Terms -->
                    <div class="flex items-center justify-between">
                        <div class="flex items-center">
                            <input 
                                type="checkbox" 
                                id="remember" 
                                name="remember"
                                class="h-4 w-4 text-orange-500 focus:ring-orange-400 border-gray-300 rounded"
                            >
                            <label for="remember" class="ml-2 block text-sm text-gray-700">
                                Remember me
                            </label>
                        </div>
                    </div>
                    
                    <!-- Submit Button -->
                    <div>
                        <button 
                            type="submit" 
                            class="w-full btn-primary font-semibold py-4 rounded-lg text-lg hover:shadow-lg transition duration-300"
                        >
                            <i class="fas fa-sign-in-alt mr-2"></i>
                            Sign In
                        </button>
                    </div>
                </form>
                
               
                
                <!-- Sign Up Link -->
                <div class="text-center">
                    <p class="text-gray-600">
                        Don't have an account?
                        <a href="signup.jsp" class="link-orange font-bold ml-1">Sign up now</a>
                    </p>
                </div>
                
                <!-- Back to Home -->
                <div class="text-center mt-6">
                    <a href="index.jsp" class="text-gray-500 hover:text-black transition duration-200">
                        <i class="fas fa-arrow-left mr-2"></i>
                        Back to home page
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>