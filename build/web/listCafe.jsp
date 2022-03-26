<%-- 
    Document   : listCafe
    Created on : Jun 18, 2021, 11:54:43 PM
    Author     : Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
--%>

<%@page import="dao.CafeDAO"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="model.Cafe"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <title>My Cafe | LaRevue</title>
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
                        <a href="editProfile.jsp" class="hover:text-gray-500">
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
            <div class="flex text-white bg-gray-900 p-12 justify-center">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 14v3m4-3v3m4-3v3M3 21h18M3 10h18M3 7l9-4 9 4M4 10h16v11H4V10z" />
                </svg> 
                <span class="pl-2 font-semibold text-xl tracking-tight">My Cafe</span>
            </div>
            <div class="">
                <div class="p-10">
                    <%
                        User user = (User) request.getSession().getAttribute("user");

                        int userid = user.getUserid();
                        CafeDAO cafeDAO = new CafeDAO();
                        List<Cafe> listCafe = cafeDAO.retrieveAllCafeById(userid);
                        for (Cafe cafe : listCafe) {

                    %>
                    <!--Card 1-->
                    <div class="max-w-7xl mx-auto my-2">
                        <div class="border-r border-b border-l border-gray-400 lg:border-l-0 lg:border-t lg:border-gray-400 bg-white rounded-3xl p-4 flex justify-between leading-normal">
                            <img class="w-auto h-56 mr-4"  src="/CafeReviewSystem/img/image.jsp?id=<%=cafe.getCafeid()%>" alt="Avatar of Writer">
                            <div class="mb-8">
                                <div class="text-gray-900 font-bold text-xl mb-2">
                                    <%=cafe.getCafeName()%>
                                </div>
                                <p class="text-sm text-gray-600 flex items-center">
                                    <%=cafe.getCafeLocation()%>
                                </p>
                                <br>
                                <p class="text-gray-700 text-base">
                                    <%=cafe.getCafeDescription()%>
                                </p>
                            </div>
                            <div class="flex flex-col items-center">
                                <div class="flex text-sm">
                                    <a href="editCafe.jsp?id=<%=cafe.getCafeid()%>">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                        </svg>
                                    </a>
                                    <form action="<%=request.getContextPath()%>/CafeController">
                                        <button type="submit" name="action" value="delete">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-7 w-7" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                                            </svg>
                                        </button>
                                        <input name="cafeid" type="hidden" value="<%=cafe.getCafeid()%>">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
