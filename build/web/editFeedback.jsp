<%-- 
    Document   : editFeedback
    Created on : Jun 22, 2021, 2:10:25 AM
    Author     : Dennis <S54407@ocean.umt.edu.my>
--%>

<%@page import="model.User"%>
<%@page import="model.Feedback"%>
<%@page import="dao.FeedbackDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <title>Edit Feedback | LaRevue</title>
        <%
            int fbid = Integer.parseInt(request.getParameter("feedbackid"));
            FeedbackDAO fbDAO = new FeedbackDAO();
            Feedback fb = fbDAO.retrieveFeedbackById(fbid);
            User user = (User) request.getSession().getAttribute("user");
        %>
    <body>
        <div class="flex items-center justify-between flex-wrap bg-teal p-6">
            <div class="flex items-center flex-no-shrink text-black mr-6">
                <a href="dashboard.jsp" class="flex items-center flex-no-shrink text-black mr-6 hover:text-gray-200">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 19l-7-7 7-7m8 14l-7-7 7-7" />
                    </svg>  
                    <span class="pl-2 font-semibold text-xl tracking-tight">LaRevue</span>
                </a>
            </div>
            <div>
                <div class="flex items-center">
                    <div class="mr-5">
                        <a href="addCafe.html" class="hover:text-gray-500">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 14v3m4-3v3m4-3v3M3 21h18M3 10h18M3 7l9-4 9 4M4 10h16v11H4V10z" />
                            </svg>
                        </a>
                    </div>
                    <div>
                        <a href="editProfile.html" class="hover:text-gray-500">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                            </svg>
                        </a>
                    </div>
                    <button onclick="location.href='<%=request.getContextPath()%>/UserController?action=signout'" class="ml-5 py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2" value="Logout">
                        Logout
                    </button>
                </div>
            </div>
        </div>
        <div class="bg-gray-500 min-h-screen flex flex-col rounded">
            <div class="flex text-white bg-gray-900 p-12 justify-center">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4" />
                </svg>
                <span class="pl-2 font-semibold text-xl tracking-tight">Edit Your Feedback</span>
            </div>
            <div class="sm:flex sm:space-x-2 justify-center my-auto rounded-3xl w-full flex flex-col items-center justify-center px-60">
                <div class="bg-gray-100 px-6 py-8 rounded-t-3xl shadow-md text-black w-full">
                    <form class="mt-8 space-y-6" action="FeedbackController"  method="POST">
                        <div class="rounded-md shadow-sm -space-y-px">
                            <input type="hidden" name="feedbackid" value="<%=fbid%>">
                            <div>
                                <label class="sr-only">Email</label>
                                <input readonly type="email" name="email" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" value="<%=fb.getEmail()%>">
                            </div>
                            <br>
                            <div>
                                <label class="sr-only">Subject</label>
                                <input type="text" name="subject" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" value="<%=fb.getSubject()%>">
                            </div>
                            <br>
                            <div>
                                <label class="sr-only">Message</label>
                                <input type="text" name="message" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" value="<%=fb.getMessage()%>">
                            </div>
                            <input type="hidden" name="userid" value="<%=user.getUserid()%>"/>
                            <br>
                            <div class="flex items-center">
                                <button type="submit" name="action" value="update" class="mr-3 group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                    <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.707l-3-3a1 1 0 00-1.414 0l-3 3a1 1 0 001.414 1.414L9 9.414V13a1 1 0 102 0V9.414l1.293 1.293a1 1 0 001.414-1.414z" clip-rule="evenodd" />
                                        </svg>
                                    </span>
                                    Submit
                                </button>
                                <a href="dashboard.jsp" class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                    <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                                        </svg>
                                    </span>
                                    Cancel
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>    
    </body>
</html>
