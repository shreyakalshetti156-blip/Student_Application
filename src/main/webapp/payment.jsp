<%@page import="java.time.LocalDateTime"%>
<%@page import="in.ps.studentapp.dto.Student"%>
<%@page import="in.ps.studentapp.dao.CoursesDAOImpl"%>
<%@page import="in.ps.studentapp.dao.CoursesDAO"%>
<%@page import="in.ps.studentapp.dto.Courses"%>

<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment - ProDhee</title>
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
    
    .payment-card {
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        border: 1px solid var(--gray-medium);
    }
    
    .payment-option {
        border: 2px solid transparent;
        transition: all 0.3s ease;
    }
    
    .payment-option:hover {
        border-color: var(--sunset-orange);
    }
    
    /* Payment option selection */
    .payment-method:checked + label {
        border-color: var(--sunset-orange);
        background-color: rgba(255, 107, 53, 0.05);
    }
</style>
</head>
<body class="bg-gray-50 min-h-screen">
    <!-- Header -->
    <header class="bg-white shadow-sm">
        <div class="container mx-auto px-4 py-4">
            <div class="flex items-center justify-between">
                <!-- Logo -->
                <div class="flex items-center space-x-3">
                    <div class="bg-black text-white p-2 rounded-lg">
                        <i class="fas fa-graduation-cap text-2xl"></i>
                    </div>
                    <div>
                        <h1 class="text-2xl font-bold text-black">ProDhee</h1>
                        <p class="text-sm text-gray-600">Student Courses Portal</p>
                    </div>
                </div>
                
                <!-- User Info -->
                <div class="flex items-center space-x-4">
                    <a href="courses?category=all" class="text-gray-700 hover:text-orange-500 transition duration-200">
                        <i class="fas fa-arrow-left mr-2"></i>
                        Back to Courses
                    </a>
                </div>
            </div>
        </div>
    </header>

    <%
    // Get session and course details
    Student s = (Student) session.getAttribute("student");
    String cId = request.getParameter("courseId");
    
    // Check if user is logged in
    if(s == null || s.getId() == 0) {
        response.sendRedirect("login.jsp?error=Please login to make payment");
        return;
    }
    
    // Check if courseId is provided
    if(cId == null || cId.isEmpty()) {
        response.sendRedirect("courses.jsp?error=Invalid course selection");
        return;
    }
    
    Integer courseId = Integer.parseInt(cId);
    CoursesDAO cdao = new CoursesDAOImpl();
    Courses c = cdao.getCourses(courseId);
    
    // Check if course exists
    if(c == null) {
        response.sendRedirect("courses.jsp?error=Course not found");
        return;
    }
    
   
    
    // Calculate tax (18% GST)
    double courseFees = c.getFees();
    double tax = courseFees * 0.18;
    double totalAmount = courseFees + tax;
    
    %>
    
    <main class="container mx-auto px-4 py-8">
        <div class="max-w-6xl mx-auto">
            <div class="text-center mb-8">
                <h1 class="text-3xl font-bold text-black mb-2">Complete Your Enrollment</h1>
                <p class="text-gray-600">Review your order and select payment method</p>
            </div>
            
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
                <!-- Left Column: Bill Details -->
                <div class="bg-white rounded-xl payment-card p-6">
                    <h2 class="text-2xl font-bold text-black mb-6 pb-4 border-b border-gray-200">
                        <i class="fas fa-receipt mr-2 text-orange-500"></i>
                        Invoice Details
                    </h2>
                    
                    <!-- Student Info -->
                    <div class="mb-6">
                        <h3 class="text-lg font-semibold text-black mb-3">Student Information</h3>
                        <div class="bg-gray-50 p-4 rounded-lg">
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div>
                                    <p class="text-sm text-gray-500">Name</p>
                                    <p class="font-medium text-black"><%= s.getName() %></p>
                                </div>
                                <div>
                                    <p class="text-sm text-gray-500">Email</p>
                                    <p class="font-medium text-black"><%= s.getMail() %></p>
                                </div>
                                <div>
                                    <p class="text-sm text-gray-500">Date</p>
                                    <p class="font-medium text-black"><%= LocalDateTime.now()%></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Course Info -->
                    <div class="mb-6">
                        <h3 class="text-lg font-semibold text-black mb-3">Course Details</h3>
                        <div class="border border-gray-200 rounded-lg overflow-hidden">
                            <div class="p-4 border-b border-gray-200">
                                <div class="flex justify-between items-start">
                                    <div>
                                        <h4 class="font-bold text-lg text-black"><%= c.getCourseName() %></h4>
                                        <p class="text-gray-600 text-sm mt-1"><%= c.getCourseInfo()%></p>
                                        <div class="flex items-center mt-2">
                                            <span class="bg-gray-100 text-gray-800 text-xs px-3 py-1 rounded-full mr-2">
                                                <i class="fas fa-clock mr-1"></i><%= c.getMonths()%> months
                                            </span>
                                            
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <div class="text-2xl font-bold text-black">&#8377;<%=c.getFees()%>0/-</div>
                                        <div class="text-sm text-gray-500">Course Fee</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Bill Summary -->
                    <div>
                        <h3 class="text-lg font-semibold text-black mb-3">Bill Summary</h3>
                        <div class="bg-gray-50 p-4 rounded-lg">
                            <div class="space-y-3">
                                <div class="flex justify-between">
                                    <span class="text-gray-600">Course Fee</span>
                                    <span class="font-medium">&#8377;<%=courseFees%>0</span>
                                </div>
                                <div class="flex justify-between">
                                    <span class="text-gray-600">GST (18%)</span>
                                    <span class="font-medium">&#8377;<%=tax%>0</span>
                                </div>
                                <div class="border-t border-gray-300 pt-3 mt-3">
                                    <div class="flex justify-between">
                                        <span class="text-lg font-bold text-black">Total Amount</span>
                                        <span class="text-2xl font-bold text-black">&#8377;<%=totalAmount%></span>
                                    </div>
                                </div>
                            </div>
                            
               
                        </div>
                    </div>
                </div>
                
                <!-- Right Column: Payment Method -->
                <div class="bg-white rounded-xl payment-card p-6">
                    <h2 class="text-2xl font-bold text-black mb-6 pb-4 border-b border-gray-200">
                        <i class="fas fa-credit-card mr-2 text-orange-500"></i>
                        Select Payment Method
                    </h2>
                    
                    <!-- Payment Form -->
                    <form action="payment" method="POST" class="space-y-6">
                        <!-- Hidden fields -->
                        <input type="hidden" name="courseId" value="<%=courseId %>">
                        <input type="hidden" name="totalAmount" value="<%= totalAmount %>">
                        <input type="hidden" name="studentId" value="<%= s.getId() %>">
                        <input type="hidden" name="tax" value="<%=tax%>">
                        <input type="hidden" name="fees" value="<%=courseFees%>">
                        
                        <!-- Payment Options -->
                        <div class="space-y-4">
                            <!-- Credit/Debit Card -->
                            <div>
                                <input type="radio" id="card" name="paymentMethod" value="card" class="payment-method hidden" required>
                                <label for="card" class="payment-option block p-4 border rounded-lg cursor-pointer">
                                    <div class="flex items-center">
                                        <div class="bg-blue-50 p-3 rounded-lg mr-4">
                                            <i class="fas fa-credit-card text-blue-500 text-xl"></i>
                                        </div>
                                        <div class="flex-grow">
                                            <h3 class="font-bold text-black">Credit/Debit Card</h3>
                                            <p class="text-sm text-gray-600">Pay using Visa, MasterCard, or Rupay</p>
                                        </div>
                                        <div class="text-green-500">
                                            <i class="fas fa-check-circle"></i>
                                        </div>
                                    </div>
                                </label>
                                
                                <!-- Card Details (Shown when selected) -->
                                <div class="mt-4 ml-12 p-4 bg-gray-50 rounded-lg space-y-4 hidden" id="card-details">
                                    <div>
                                        <label class="block text-sm font-medium text-gray-700 mb-2">Card Number</label>
                                        <input type="text" name="cardNumber" placeholder="1234 5678 9012 3456" 
                                               pattern="[0-9\s]{13,19}" maxlength="19"
                                               class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500">
                                    </div>
                                    <div class="grid grid-cols-2 gap-4">
                                        <div>
                                            <label class="block text-sm font-medium text-gray-700 mb-2">Expiry Date</label>
                                            <input type="text" name="expiryDate" placeholder="MM/YY" 
                                                   pattern="(0[1-9]|1[0-2])\/[0-9]{2}"
                                                   class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500">
                                        </div>
                                        <div>
                                            <label class="block text-sm font-medium text-gray-700 mb-2">CVV</label>
                                            <input type="password" name="cvv" placeholder="123" 
                                                   pattern="[0-9]{3,4}" maxlength="4"
                                                   class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- UPI -->
                            <div>
                                <input type="radio" id="upi" name="paymentMethod" value="upi" class="payment-method hidden">
                                <label for="upi" class="payment-option block p-4 border rounded-lg cursor-pointer">
                                    <div class="flex items-center">
                                        <div class="bg-purple-50 p-3 rounded-lg mr-4">
                                            <i class="fas fa-mobile-alt text-purple-500 text-xl"></i>
                                        </div>
                                        <div class="flex-grow">
                                            <h3 class="font-bold text-black">UPI Payment</h3>
                                            <p class="text-sm text-gray-600">Pay using Google Pay, PhonePe, Paytm</p>
                                        </div>
                                    </div>
                                </label>
                                
                                <!-- UPI ID (Shown when selected) -->
                                <div class="mt-4 ml-12 p-4 bg-gray-50 rounded-lg space-y-4 hidden" id="upi-details">
                                    <div>
                                        <label class="block text-sm font-medium text-gray-700 mb-2">UPI ID</label>
                                        <input type="text" name="upiId" placeholder="username@bank" 
                                               class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500">
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Net Banking -->
                            <div>
                                <input type="radio" id="netbanking" name="paymentMethod" value="netbanking" class="payment-method hidden">
                                <label for="netbanking" class="payment-option block p-4 border rounded-lg cursor-pointer">
                                    <div class="flex items-center">
                                        <div class="bg-green-50 p-3 rounded-lg mr-4">
                                            <i class="fas fa-university text-green-500 text-xl"></i>
                                        </div>
                                        <div class="flex-grow">
                                            <h3 class="font-bold text-black">Net Banking</h3>
                                            <p class="text-sm text-gray-600">Pay directly from your bank account</p>
                                        </div>
                                    </div>
                                </label>
                                
                                <!-- Bank Selection (Shown when selected) -->
                                <div class="mt-4 ml-12 p-4 bg-gray-50 rounded-lg space-y-4 hidden" id="netbanking-details">
                                    <div>
                                        <label class="block text-sm font-medium text-gray-700 mb-2">Select Bank</label>
                                        <select name="bank" class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500">
                                            <option value="">Choose your bank</option>
                                            <option value="sbi">State Bank of India</option>
                                            <option value="hdfc">HDFC Bank</option>
                                            <option value="icici">ICICI Bank</option>
                                            <option value="axis">Axis Bank</option>
                                            <option value="kotak">Kotak Mahindra Bank</option>
                                            <option value="pnb">Punjab National Bank</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Wallet -->
                            <div>
                                <input type="radio" id="wallet" name="paymentMethod" value="wallet" class="payment-method hidden">
                                <label for="wallet" class="payment-option block p-4 border rounded-lg cursor-pointer">
                                    <div class="flex items-center">
                                        <div class="bg-yellow-50 p-3 rounded-lg mr-4">
                                            <i class="fas fa-wallet text-yellow-500 text-xl"></i>
                                        </div>
                                        <div class="flex-grow">
                                            <h3 class="font-bold text-black">Digital Wallet</h3>
                                            <p class="text-sm text-gray-600">Pay using Paytm Wallet, Amazon Pay</p>
                                        </div>
                                    </div>
                                </label>
                                
                                <!-- Wallet Selection (Shown when selected) -->
                                <div class="mt-4 ml-12 p-4 bg-gray-50 rounded-lg space-y-4 hidden" id="wallet-details">
                                    <div>
                                        <label class="block text-sm font-medium text-gray-700 mb-2">Select Wallet</label>
                                        <select name="walletType" class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-500">
                                            <option value="">Choose your wallet</option>
                                            <option value="paytm">Paytm Wallet</option>
                                            <option value="amazonpay">Amazon Pay</option>
                                            <option value="phonepe">PhonePe Wallet</option>
                                            <option value="mobikwik">MobiKwik</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Terms and Conditions -->
                        <div class="flex items-start">
                            <div class="flex items-center h-5">
                                <input type="checkbox" id="terms" name="terms" required
                                       class="h-4 w-4 text-orange-500 focus:ring-orange-400 border-gray-300 rounded">
                            </div>
                            <div class="ml-3">
                                <label for="terms" class="text-sm text-gray-700">
                                    I agree to the 
                                    <a href="terms.jsp" class="link-orange font-medium">Terms of Service</a> 
                                    and authorize ProDhee to charge my selected payment method for the total amount shown.
                                </label>
                            </div>
                        </div>
                        
                        <!-- Payment Buttons -->
                        <div class="flex space-x-4 pt-4">
                            <button type="submit" 
                                    class="flex-1 btn-primary font-semibold py-4 rounded-lg text-lg hover:shadow-lg transition duration-300">
                                <i class="fas fa-lock mr-2"></i>
                                Pay &#8377;<%=totalAmount%>0/-
                            </button>
                            <a href="courses/category=all" 
                               class="flex-1 btn-outline font-semibold py-4 rounded-lg text-lg text-center hover:shadow-lg transition duration-300">
                                Cancel Payment
                            </a>
                        </div>
                        
                        <!-- Security Note -->
                        <div class="mt-6 p-4 bg-blue-50 rounded-lg">
                            <div class="flex items-center">
                                <i class="fas fa-shield-alt text-blue-500 mr-3"></i>
                                <div>
                                    <p class="text-sm text-blue-700 font-medium">Secure Payment</p>
                                    <p class="text-xs text-blue-600">Your payment information is encrypted and secure</p>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
    
    <!-- Footer -->
    <%@include file="footer.jsp"%>
    
    <!-- CSS-only Payment Method Toggle -->
    <style>
        /* Show payment details when payment method is selected */
        #card:checked ~ label[for="card"] + #card-details,
        #upi:checked ~ label[for="upi"] + #upi-details,
        #netbanking:checked ~ label[for="netbanking"] + #netbanking-details,
        #wallet:checked ~ label[for="wallet"] + #wallet-details {
            display: block;
        }
        
        /* Hide payment details by default */
        #card-details,
        #upi-details,
        #netbanking-details,
        #wallet-details {
            display: none;
        }
    </style>
</body>
</html>