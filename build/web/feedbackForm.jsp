<%-- 
    Document   : feedbackForm
    Created on : Jun 22, 2021, 2:09:20 AM
    Author     : Dennis <S54407@ocean.umt.edu.my>
--%>

<%@page import="model.Feedback"%>
<%@page import="java.util.List"%>
<%@page import="dao.FeedbackDAO"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <title>Feedback | LaRevue</title>
        <%
            User user = (User) request.getSession().getAttribute("user");
            int userid = user.getUserid();
            FeedbackDAO fbDAO = new FeedbackDAO();
            List<Feedback> fbList = fbDAO.retrieveFeedback(userid);
            if (!fbList.isEmpty()) {
                response.sendRedirect("feedbackDetails.jsp");
            }
        %>
    </head>
    <body>
        <div class="flex items-center justify-between flex-wrap bg-teal p-6">
            <a href="dashboard.jsp" class="flex items-center flex-no-shrink text-black mr-6">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 19l-7-7 7-7m8 14l-7-7 7-7" />
                </svg>  
                <span class="pl-2 font-semibold text-xl tracking-tight">LaRevue</span>
            </a>
        </div>
        <div class="bg-gray-500 min-h-screen flex flex-col rounded">
            <div class="sm:flex sm:space-x-2 justify-center my-auto rounded-3xl w-full flex flex-col items-center justify-center px-60">
                <div class="flex items-center flex-no-shrink text-white mb-14">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4" />
                    </svg>
                    <span class="pl-2 font-semibold text-xl tracking-tight">Feedback Form</span>
                </div>
                <div class="bg-gray-100 px-6 py-8 rounded-t-3xl shadow-md text-black w-full">
                    <form class="mt-8 space-y-6"  action="<%=request.getContextPath()%>/FeedbackController" method="POST">
                        <div class="rounded-md shadow-sm -space-y-px">
                            <div>
                                <label class="sr-only">Email</label>
                                <input type="hidden" name="email" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" value="<%=user.getEmail()%>">
                            </div>
                            <br>
                            <div>
                                <label class="sr-only">Subject</label>
                                <input type="text" name="subject" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Subject">
                            </div>
                            <br>
                            <div>
                                <label class="sr-only">Message</label>
                                <input type="text" name="message" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Message">
                            </div>
                            <br>
                            <input type="hidden" name="userid" value="<%=user.getUserid()%>"/>  
                            <div class="flex items-center">
                                <button type="submit" name="action" value="addFeedback" class="mr-3 group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
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