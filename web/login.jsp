<%-- 
    Document   : login.jsp
    Created on : Jun 18, 2021, 10:03:30 PM
    Author     : Aminah <S54170@ocean.umt.edu.my>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
        <link rel="preload" href="/fonts/Inter-roman.var.woff2?v=3.18" as="font" type="font/woff2" crossorigin="">
        <script src="https://cdn.tailwindcss.com"></script>
        <title>Login and Sign Up | LaRevue System</title>
        <script>
            function validatePassword() {
                var password = document.form.password.value;

                if (password.length < 8) {
                    alert("Password must be at least 8 characters long.");
                    return false;
                }
            }
        </script> 
    </head>
    <body>
        <div class="flex items-center justify-between flex-wrap bg-teal p-6">
            <div class="flex items-center flex-no-shrink text-black mr-6">
                <a href="index.jsp" class="flex items-center flex-no-shrink text-black mr-6 hover:text-gray-200">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 19l-7-7 7-7m8 14l-7-7 7-7" />
                    </svg>  
                    <span class="pl-2 font-semibold text-xl tracking-tight">LaRevue</span>
                </a>
            </div>
        </div>
        <div class="bg-gray-500 min-h-screen flex flex-col rounded">
            <div class="sm:flex sm:space-x-2 justify-center my-auto mx-20">
                <div class="rounded-3xl w-full flex flex-col items-center justify-center px-2">
                    <div class="bg-gray-100 px-6 py-8 rounded shadow-md text-black w-full">
                        <div class=" flex justify-center shadow-lg rounded-3xl bg-white">
                            <button type="button"
                                    class="group flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-3xl text-gray-900 bg-white focus:outline-none w-full">Log In</button>
                            <button type="button"
                                    class="group flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-3xl text-white bg-gray-800 focus:outline-none w-full">Register</button>
                        </div>
                        <form name="form" class="mt-8 space-y-6" action="<%=request.getContextPath()%>/UserController" method="POST" onsubmit="return validatePassword()">
                            <input type="hidden" name="remember" value="true">
                            <div class="rounded-md shadow-sm -space-y-px">
                                <div>
                                    <label for="fullName" class="sr-only">Full Name</label>
                                    <input id="fullName" name="fullName" type="text" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Full Name">
                                </div>
                                <br>
                                <div>
                                    <label for="email-address" class="sr-only">Email address</label>
                                    <input id="email-address" name="email" type="email" autocomplete="email" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Email Address">
                                </div>
                                <br>
                                <div>
                                    <label for="password" class="sr-only">Password</label>
                                    <input id="password" name="password" type="password" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Password">
                                </div>
                            </div>
                            <div>
                                <button type="submit" name="action" value="register"
                                        class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                    <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                                        <!-- Heroicon name: solid/lock-closed -->
                                        <svg class="h-5 w-5 text-gray-500 group-hover:text-gray-400"
                                             xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
                                             aria-hidden="true">
                                        <path fill-rule="evenodd"
                                              d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z"
                                              clip-rule="evenodd" />
                                        </svg>
                                    </span>
                                    Register
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="flex w-full flex-col items-center justify-center px-2">
                    <div class="bg-gray-100 px-6 py-8 rounded shadow-md text-black w-full">
                        <div class=" flex justify-center shadow-lg rounded-3xl bg-white">
                            <button type="button"
                                    class="group flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-3xl text-white bg-gray-800 focus:outline-none w-full">Log
                                In</button>
                            <button type="button"
                                    class="group flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-3xl text-gray-900 bg-white focus:outline-none w-full">Register</button>
                        </div>
                        <form class="mt-8 space-y-6" action="<%=request.getContextPath()%>/UserController" method="POST">
                            <div class="text-center text-md">
                                <span style="color:red">${error}</span>
                            </div>
                            <input type="hidden" name="remember" value="true">
                            <div class="rounded-md shadow-sm -space-y-px">
                                <div>
                                    <label for="email-address" class="sr-only">Email address</label>
                                    <input id="email-address" name="email" type="email" autocomplete="email" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Email Address">
                                </div>
                                <br>
                                <div>
                                    <label for="password" class="sr-only">Password</label>
                                    <input id="password" name="password" type="password" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Password">
                                </div>
                            </div>
                            <div>
                                <button type="submit" name="action" value="login"
                                        class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                    <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                                        <!-- Heroicon name: solid/lock-closed -->
                                        <svg class="h-5 w-5 text-gray-500 group-hover:text-gray-400"
                                             xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
                                             aria-hidden="true">
                                        <path fill-rule="evenodd"
                                              d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z"
                                              clip-rule="evenodd" />
                                        </svg>
                                    </span>
                                    Login
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
    </body>
</html>
