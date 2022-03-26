<%-- 
    Document   : addReview
    Created on : Jun 24, 2021, 12:39:19 AM
    Author     : Aliesa <S54162@ocean.umt.edu.my>
--%>

<%@page import="dao.ReviewDAO"%>
<%@page import="model.Review"%>
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
        <title>Add Review | LaRevue</title>
    </head>
    <body>
        <div class="flex items-center justify-between flex-wrap bg-teal p-6">
            <a href="dashboard.jsp" class="flex items-center flex-no-shrink text-black mr-6 hover:text-gray-200">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 19l-7-7 7-7m8 14l-7-7 7-7" />
                </svg>  
                <span class="pl-2 font-semibold text-xl tracking-tight">LaRevue</span>
            </a>
        </div>
        <div class="bg-gray-500 min-h-screen flex flex-col rounded">
            <div class="sm:flex sm:space-x-2 justify-center my-auto rounded-3xl w-full flex flex-col items-center justify-center px-60">
                <div class="flex items-center flex-no-shrink text-white mb-14">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z" clip-rule="evenodd" />
                    </svg>
                    <span class="pl-2 font-semibold text-xl tracking-tight">Add Review</span>
                </div>
                <div class="p-10">
                    <%
                        User user = (User) request.getSession().getAttribute("user");
                        int userid = user.getUserid();
                        Cafe cafe = new Cafe();

                        int cafeid = Integer.parseInt(request.getParameter("id"));
                        CafeDAO cafeDAO = new CafeDAO();
                        cafe = cafeDAO.retrieveCafeById(cafeid);

                        ReviewDAO rvDAO = new ReviewDAO();

                        List<Review> rvList = rvDAO.retrieveReviewByCafeUserId(userid, cafeid);
                        if (!rvList.isEmpty()) {
                            response.sendRedirect("listReview.jsp?");
                        }

                    %>
                    <!--Card 1-->
                    <div class="max-w-7xl mx-auto">
                        <div class="border-r border-b border-l border-gray-400 lg:border-l-0 lg:border-t lg:border-gray-400 bg-white rounded-3xl p-4 flex justify-between leading-normal">
                            <img class="w-auto h-56 mr-4" class="lazy" src="/CafeReviewSystem/img/image.jsp?id=<%=cafe.getCafeid()%>" alt="Avatar of Writer">
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
                        </div>
                    </div>
                </div>
                <br>
                <div class="bg-gray-100 px-6 py-8 rounded-t-3xl shadow-md text-black w-full">
                    <form class="mt-8 space-y-6" action="<%=request.getContextPath()%>/ReviewController?" method="POST" >
                        <div class="rounded-md shadow-sm -space-y-px">
                            <div>
                                <label class="sr-only">Review</label>
                                <input type="text" name="review" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Review">
                            </div>
                            <br>
                            <div>
                                <input type="hidden" name="userid" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" value="<%=user.getUserid()%>">
                            </div>
                            <div>
                                <input type="hidden" name="cafeid" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" value="<%=cafe.getCafeid()%>">
                            </div>
                            <div class="flex items-center">
                                <button type="submit" name="action" value="add" class="mr-3 group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
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