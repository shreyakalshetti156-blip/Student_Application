<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - LearnSphere</title>
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
        
        .signup-bg {
            background: linear-gradient(135deg, #FF6B35 0%, #FF8E5E 100%);
        }
        
        /* CSS-only password toggle */
        #password-toggle:checked ~ #password,
        #confirm-password-toggle:checked ~ #confirmPassword {
            font-family: "Courier New", monospace;
        }
        
        #password-toggle:checked ~ #toggle-password-label .fa-eye,
        #confirm-password-toggle:checked ~ #toggle-confirm-password-label .fa-eye {
            display: none;
        }
        
        #password-toggle:not(:checked) ~ #toggle-password-label .fa-eye-slash,
        #confirm-password-toggle:not(:checked) ~ #toggle-confirm-password-label .fa-eye-slash {
            display: none;
        }
        
        /* Password strength indicator */
        #password-strength {
            height: 4px;
            width: 0%;
            transition: width 0.3s ease;
            background-color: #e5e7eb;
        }
        
        #password:valid ~ #password-strength {
            background-color: #10b981; /* green-500 */
            width: 100%;
        }
        
        /* Confirm password match indicator */
        #password:valid + #confirmPassword:valid {
            border-color: #10b981;
        }
        
        #password:invalid + #confirmPassword:invalid {
            border-color: #ef4444;
        }
    </style>
</head>
<body class="bg-gray-50 min-h-screen flex items-center justify-center p-4 signup-bg">
    <!-- Main Signup Container -->
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
                    <h2 class="text-2xl font-bold mb-4">Join Our Learning Community</h2>
                    <p class="text-gray-300 mb-6">
                        Create your account to unlock access to premium courses, track your progress, and connect with fellow learners.
                    </p>
                    
                    <div class="space-y-4">
                        <div class="flex items-center space-x-3">
                            <div class="bg-orange-500 p-2 rounded-full">
                                <i class="fas fa-video text-sm"></i>
                            </div>
                            <span>Access 100+ expert-led courses</span>
                        </div>
                        <div class="flex items-center space-x-3">
                            <div class="bg-orange-500 p-2 rounded-full">
                                <i class="fas fa-tasks text-sm"></i>
                            </div>
                            <span>Track learning progress</span>
                        </div>
                        <div class="flex items-center space-x-3">
                            <div class="bg-orange-500 p-2 rounded-full">
                                <i class="fas fa-users text-sm"></i>
                            </div>
                            <span>Join student community</span>
                        </div>
                        <div class="flex items-center space-x-3">
                            <div class="bg-orange-500 p-2 rounded-full">
                                <i class="fas fa-award text-sm"></i>
                            </div>
                            <span>Earn certificates</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="mt-8 pt-6 border-t border-gray-700">
                <p class="text-gray-400 text-sm">
                    Already have an account? 
                    <a href="login.jsp" class="link-orange font-medium ml-1">Sign in here</a>
                </p>
            </div>
        </div>
        
        <!-- Right Side - Signup Form -->
        <div class="md:w-3/5 bg-white p-10 flex items-center justify-center">
            <div class="w-full max-w-md">
                <div class="text-center mb-8">
                    <h2 class="text-3xl font-bold text-black mb-2">Create Your Account</h2>
                    <p class="text-gray-600">Fill in your details to get started</p>
                </div>
                
                <!-- Signup Form -->
                <form action="signup" method="POST" class="space-y-5">
                    <!-- Display error message if exists -->
                    <%
                        String error = (String)request.getAttribute("error");
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
                    
                    <!-- Display success message -->
                    <%
                        String success =(String)request.getAttribute("success");
                        if(success != null) {
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
                    
                    <!-- Full Name Field -->
                    <div>
                        <label for="name" class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-user mr-2 text-orange-500"></i>
                            Full Name
                        </label>
                        <div class="relative">
                            <input 
                                type="text" 
                                id="name" 
                                name="name" 
                                required
                                placeholder="Enter your full name"
                                class="w-full p-4 pl-12 border border-gray-300 rounded-lg input-focus focus:outline-none transition duration-200"
                                pattern="[A-Za-z\s]{3,50}"
                                title="Name must be 3-50 characters (letters and spaces only)"
                            >
                            <div class="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-400">
                                <i class="fas fa-id-card"></i>
                            </div>
                        </div>
                        <p class="mt-1 text-xs text-gray-500">Enter your full name as per ID</p>
                    </div>
                    
                    <!-- Phone Number Field -->
                    <div>
                        <label for="phone" class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-phone mr-2 text-orange-500"></i>
                            Phone Number
                        </label>
                        <div class="relative">
                            <input 
                                type="tel" 
                                id="phone" 
                                name="phone" 
                                required
                                placeholder="Enter your phone number"
                                class="w-full p-4 pl-12 border border-gray-300 rounded-lg input-focus focus:outline-none transition duration-200"
                                pattern="[0-9]{10}"
                                title="Enter a valid 10-digit phone number"
                            >
                            <div class="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-400">
                                <i class="fas fa-mobile-alt"></i>
                            </div>
                        </div>
                        <p class="mt-1 text-xs text-gray-500">10-digit phone number without country code</p>
                    </div>
                    
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
                                placeholder="Enter your email address"
                                class="w-full p-4 pl-12 border border-gray-300 rounded-lg input-focus focus:outline-none transition duration-200"
                            >
                            <div class="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-400">
                                <i class="fas fa-at"></i>
                            </div>
                        </div>
                        
                    </div>
                    
                    <!-- Password Field with CSS-only toggle -->
                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-lock mr-2 text-orange-500"></i>
                            Password
                        </label>
                        <div class="relative">
                            <!-- Hidden checkbox for password toggle -->
                            <input type="checkbox" id="password-toggle" class="hidden">
                            
                            <!-- Password input -->
                            <input 
                                type="password" 
                                id="password" 
                                name="password" 
                                required
                                placeholder="Create a strong password"
                                class="w-full p-4 pl-12 pr-12 border border-gray-300 rounded-lg input-focus focus:outline-none transition duration-200"
                             
                                title="Password must be at least 8 characters"
                            >
                            <div class="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-400">
                                <i class="fas fa-key"></i>
                            </div>
                            <!-- Password toggle label -->
                            <label for="password-toggle" id="toggle-password-label" 
                                   class="absolute right-4 top-1/2 transform -translate-y-1/2 text-gray-400 hover:text-gray-600 cursor-pointer">
                                <i class="fas fa-eye"></i>
                                <i class="fas fa-eye-slash"></i>
                            </label>
                        </div>
                        <!-- Password strength indicator -->
                        <div class="mt-2">
                            <div class="flex items-center justify-between mb-1">
                                <span class="text-xs text-gray-500">Password strength</span>
                                <span class="text-xs text-gray-500">Minimum 8 characters</span>
                            </div>
                            <div id="password-strength" class="rounded-full"></div>
                        </div>
                    </div>
                    
                    <!-- Confirm Password Field with CSS-only toggle -->
                    <div>
                        <label for="confirmPassword" class="block text-sm font-medium text-gray-700 mb-2">
                            <i class="fas fa-lock mr-2 text-orange-500"></i>
                            Confirm Password
                        </label>
                        <div class="relative">
                            <!-- Hidden checkbox for confirm password toggle -->
                            <input type="checkbox" id="confirm-password-toggle" class="hidden">
                            
                            <!-- Confirm password input -->
                            <input 
                                type="password" 
                                id="confirmPassword" 
                                name="confirm" 
                                required
                                placeholder="Re-enter your password"
                                class="w-full p-4 pl-12 pr-12 border border-gray-300 rounded-lg input-focus focus:outline-none transition duration-200"
                      
                                title="Please confirm your password"
                            >
                            <div class="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-400">
                                <i class="fas fa-redo"></i>
                            </div>
                            <!-- Confirm password toggle label -->
                            <label for="confirm-password-toggle" id="toggle-confirm-password-label" 
                                   class="absolute right-4 top-1/2 transform -translate-y-1/2 text-gray-400 hover:text-gray-600 cursor-pointer">
                                <i class="fas fa-eye"></i>
                                <i class="fas fa-eye-slash"></i>
                            </label>
                        </div>
                        <p class="mt-1 text-xs text-gray-500">Must match the password above</p>
                    </div>
                    
                    <!-- Terms and Conditions -->
                    <div class="flex items-start">
                        <div class="flex items-center h-5">
                            <input 
                                type="checkbox" 
                                id="terms" 
                                name="terms"
                                required
                                class="h-4 w-4 text-orange-500 focus:ring-orange-400 border-gray-300 rounded"
                            >
                        </div>
                        <div class="ml-3">
                            <label for="terms" class="text-sm text-gray-700">
                                I agree to the 
                                <a href="terms.jsp" class="link-orange font-medium">Terms of Service</a> 
                                and 
                                <a href="privacy.jsp" class="link-orange font-medium">Privacy Policy</a>
                            </label>
                        </div>
                    </div>
                    
                    <!-- Submit Button -->
                    <div class="pt-2">
                        <button 
                            type="submit" 
                            class="w-full btn-primary font-semibold py-4 rounded-lg text-lg hover:shadow-lg transition duration-300"
                        >
                            <i class="fas fa-user-plus mr-2"></i>
                            Create Account
                        </button>
                    </div>
                </form>
             
                
                <!-- Login Link -->
                <div class="text-center">
                    <p class="text-gray-600">
                        Already have an account?
                        <a href="login.jsp" class="link-orange font-bold ml-1">Sign in here</a>
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