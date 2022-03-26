<%-- 
    Document   : reviewDetails
    Created on : Jun 25, 2021, 12:52:34 PM
    Author     : Aliesa <S54162@ocean.umt.edu.my>
--%>

<%@page import="dao.UserDAO"%>
<%@page import="dao.CafeDAO"%>
<%@page import="model.Cafe"%>
<%@page import="dao.ReviewDAO"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="model.Review"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <title>The Reviews | LaRevue</title>
        <%
            int cafeid = Integer.parseInt(request.getParameter("id"));
            CafeDAO cafeDAO = new CafeDAO();
            Cafe cafe = cafeDAO.retrieveCafeById(cafeid);

            ReviewDAO reviewDAO = new ReviewDAO();
            List<Review> listReview = reviewDAO.retrieveAllReviewByCafeId(cafeid);
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
                        <a href="editProfile.jsp?id=<%=cafe.getUserid()%>" class="hover:text-gray-500">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                            </svg>
                        </a>
                    </div>
                    <button onclick="location.href = '<%=request.getContextPath()%>/UserController?action=signout'" class="ml-5 py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2" value="Logout">
                        Logout
                    </button>
                </div>
            </div>
        </div>
        <div class="bg-gray-500 min-h-screen flex flex-col rounded">
            <div class="flex flex-col text-white bg-gray-900 p-12 text-center">
                <div class="flex text-white bg-gray-900 pb-0 pb-3 px-12 items-center justify-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z" clip-rule="evenodd" />
                    </svg>
                    <span class="pl-2 font-semibold text-xl tracking-tight">List of Reviews</span>
                </div>
                <div class="">
                    <p class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2">
                        <%=cafe.getCafeName()%>
                    </p>
                    <span class="font-semibold text-xl tracking-tight pr-2"> | </span>
                    <p class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2">
                        <%=cafe.getCafeLocation()%>
                    </p>
                </div>

            </div>
            <div class="">
                <div class="p-10 space-y-2">
                    <%
                        UserDAO userDAO = new UserDAO();
                        for (Review review : listReview) {
                            User user = userDAO.retrieveUserByUserId(review.getUserid());
                    %>
                    <!--Card 1-->
                    <div class="max-w-7xl mx-auto">
                        <div class="border-r border-b border-l border-gray-400 lg:border-l-0 lg:border-t lg:border-gray-400 bg-white rounded-3xl p-4 flex justify-between leading-normal">
                            <div class="w-full">
                                <p class="flex items-center font-bold text-gray-700 text-base text-left">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                                    </svg>
                                    <%=user.getFullName()%>
                                </p>
                                <p class="mt-3 text-gray-700 text-base text-center">
                                    <%=review.getReview()%>
                                </p>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>        
