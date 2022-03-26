<%-- 
    Document   : dashboard
    Created on : Jun 18, 2021, 10:53:01 PM
    Author     : Wan Aisyah Amirah, Aliesa, Aminah, Dennis
--%>

<%@page import="dao.ReviewDAO"%>
<%@page import="model.Cafe"%>
<%@page import="java.util.List"%>
<%@page import="dao.CafeDAO"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <title>Dashboard | LaRevue</title>
    </head>
    <body>
        <%
            User user = (User) request.getSession().getAttribute("user");
        %>
        <div class="flex items-center justify-between flex-wrap bg-teal p-6">
            <div class="flex items-center flex-no-shrink text-black mr-6">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 19l-7-7 7-7m8 14l-7-7 7-7" />
                </svg>  
                <span class="pl-2 font-semibold text-xl tracking-tight">LaRevue</span>
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
        <div class="bg-gray-500 min-h-screen rounded pt-3">
            <div class="m-10 flex justify-center">
                <div class="flex justify-center mr-3 text-center">
                    <a href="listCafe.jsp?userid=<%=user.getUserid()%>" class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2">              
                        Cafe
                    </a>
                </div>
                <div class="flex justify-center mr-3">
                    <a  href="listReview.jsp" class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2">    
                        Review
                    </a>
                </div>
                <div >
                    <a href="feedbackForm.jsp" class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2">
                        Feedback
                    </a>
                </div>
            </div>           
            <div>
                <div class="p-10 grid grid-cols-1 sm:grid-cols-1 md:grid-cols-3 lg:grid-cols-3 xl:grid-cols-3 gap-5">
                    <%
                        ReviewDAO rvDAO = new ReviewDAO();
                        int userid = user.getUserid();
                        CafeDAO cafeDAO = new CafeDAO();
                        List<Cafe> listCafe = cafeDAO.getAllCafe();
                        for (Cafe cafe : listCafe) {
                    %>
                    <!--Card 1-->
                    <div class="bg-gray-100 rounded-3xl overflow-hidden shadow-lg">
                        <div class="px-6 py-4 text-center w-full">
                            <img class="w-full h-auto object-fit object-center" src="/CafeReviewSystem/img/image.jsp?id=<%=cafe.getCafeid()%>" alt="Cafe Image">
                        </div>
                        <div class="px-4 pt-2 text-center">
                            <a href="reviewDetails.jsp?id=<%=cafe.getCafeid()%>" class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2 hover:bg-gray-400">
                                <%=rvDAO.countReview(cafe.getCafeid())%> Review(s)
                            </a>
                        </div>
                        <div class="px-6 py-4">
                            <div class="font-bold text-xl mb-2">
                                <a href="addReview.jsp?id=<%=cafe.getCafeid()%>" class="hover:text-gray-200">
                                    <%=cafe.getCafeName()%>
                                </a>
                            </div>
                            <p class="text-gray-700 text-base">
                                <%=cafe.getCafeLocation()%>
                            </p>
                            <br>
                            <p class="text-gray-700 text-base">
                                <%=cafe.getCafeDescription()%>
                            </p>
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
