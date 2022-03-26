<%-- 
    Document   : index
    Created on : Jun 18, 2021, 10:00:07 PM
    Author     : Wan Aisyah Amirah, Aliesa, Aminah, Dennis
--%>

<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page import="model.Feedback"%>
<%@page import="java.util.List"%>
<%@page import="dao.FeedbackDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <title>Landing Page | LaRevue</title>
    </head>
    <body>
        <div class="pt-0 pl-24 pr-24">
            <div class="flex items-center justify-between flex-wrap bg-teal p-6">
                <div class="flex items-center flex-no-shrink text-black mr-6">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 19l-7-7 7-7m8 14l-7-7 7-7" />
                    </svg>  
                    <span class="pl-2 font-semibold text-xl tracking-tight">LaRevue</span>
                </div>
                <div>
                    <div class="flex items-center">
                        <a href="login.jsp" class="ml-5 py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2">
                            Login
                        </a>
                    </div>
                </div>
            </div>
            <div class="relative pt-0 pr-5 pl-5 pb-16 flex content-center items-center justify-center">
                <div class="container relative w-full">
                    <div class="items-center flex w-full">
                        <div class="w-full lg:w-6/12 px-4 ml-auto mr-auto text-left">
                            <div class="flex items-center">
                                <div>
                                    <h1 class="text-gray-900 font-semibold text-3xl">
                                        Discover a unique experience.
                                    </h1>
                                    <p class="mt-4 text-lg text-gray-800">
                                        We bring the best café review system where it can be a diary of your food hunting journey. Voice it out!
                                    </p>   
                                </div>
                                <div>
                                    <img class="w-60 h-40 rounded-full" class="lazy" src="https://thesmartlocal.com/malaysia/wp-content/uploads/2021/01/New-cafes-in-KL-and-PJ-23.jpg" alt="LaRevue Landing Image">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="relative pt-16 pb-16 ">
                <div class="">
                    <div>
                        <h1 class="text-gray-900 font-semibold text-3xl text-center">
                            Get To Know Us More!
                        </h1>
                        <p class="mt-4 text-lg text-gray-800 text-justify">
                            La Revue is a web-based application system that allows users to rate cafes that are worth being displayed on their social media feeds, and it also represents one of our common interests, which is food hunting while traveling. Based on our perceptions, this will encourage the concept of eating from the eyes to the stomach.
                            Users can rate and review any cafe that the cafe owner has created using this cafe review system (La Revue). This forum-like platform can help cafe owners indirectly promoting their business and gaining interest from the general public and their customers. Furthermore, any user can survey any cafe or restaurant mentioned on the website before visiting it while traveling or at any other time.
                        </p>   
                    </div>
                </div>
            </div>
            <hr>
            <div class="py-16 px-28">
                <div class="pb-4">
                    <h1 class="text-gray-900 font-semibold text-3xl text-center">
                        What They Said About This System?
                    </h1>
                </div>
                <%
                    FeedbackDAO fbDAO = new FeedbackDAO();
                    List<Feedback> listFeedback = fbDAO.retrieveAllFeedbacks();
                    
                    UserDAO userDAO = new UserDAO();
                    for (Feedback feedback : listFeedback) {
                    User user = userDAO.retrieveUserByUserId(feedback.getUserid());
                %>
                <div class="px-4 my-4">
                    <div class="border rounded-3xl border-gray-300">
                        <div class="w-full p-3">
                            <div class="flex text-gray-900 text-2xl mb-2 items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-3 h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                                </svg>
                                <%=user.getEmail()%>
                            </div>
                            <p class="pt-3 font-bold text-xl text-gray-900 flex">
                                <%=feedback.getSubject()%>
                            </p>
                            <p class="pt-3 text-gray-700 text-md">
                                <%=feedback.getMessage()%>
                            </p>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>            
            </div>
        </div>        
    </body>
</html>        
