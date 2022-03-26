<%-- 
    Document   : feedbackDetails
    Created on : Jun 22, 2021, 8:46:13 AM
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
            for (Feedback fb : fbList) {
        %>
    </head>
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
                        <a href="addCafe.jsp" class="hover:text-gray-500">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 14v3m4-3v3m4-3v3M3 21h18M3 10h18M3 7l9-4 9 4M4 10h16v11H4V10z" />
                            </svg>
                        </a>
                    </div>
                    <div>
                        <a href="editProfile.jsp?id=<%=user.getUserid()%>" class="hover:text-gray-500">
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
            <div class="sm:flex sm:space-x-2 justify-center my-auto rounded-3xl w-full flex flex-col items-center justify-center px-60">
                <div class="flex items-center flex-no-shrink text-white mb-14">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4" />
                    </svg>
                    <span class="pl-2 font-semibold text-xl tracking-tight">Your Feedback</span>
                </div>
                <div class="bg-gray-100 px-6 py-8 rounded-t-3xl shadow-md text-black w-full">
                    <div class="rounded-md">
                        <div class="flex flex-col items-center">
                            <div class="flex text-sm text-right">
                                <a href="editFeedback.jsp?feedbackid=<%=fb.getFeedbackid()%>">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                    </svg>
                                </a>
                                <form action="FeedbackController">
                                    <button type="submit" name="action" value="delete">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-7 w-7" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                                        </svg>
                                    </button>
                                    <input name="feedbackid" type="hidden" value="<%=fb.getFeedbackid()%>"> 
                                </form>
                            </div>
                        </div>
                        <div>
                            <label class="font-bold">Email</label>
                            <p><%=user.getEmail()%></p>
                        </div>
                        <br>
                        <div>
                            <label class="font-bold">Subject</label>
                            <p><%=fb.getSubject()%></p>
                        </div>
                        <br>
                        <div>
                            <label class="font-bold">Message</label>
                            <p><%=fb.getMessage()%></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %> 
    </body>
</html>
