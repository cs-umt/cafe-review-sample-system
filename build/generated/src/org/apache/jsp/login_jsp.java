package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\" />\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n");
      out.write("        <link rel=\"icon\" type=\"image/png\" sizes=\"32x32\" href=\"/favicon-32x32.png\">\n");
      out.write("        <link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"/favicon-16x16.png\">\n");
      out.write("        <link rel=\"preload\" href=\"/fonts/Inter-roman.var.woff2?v=3.18\" as=\"font\" type=\"font/woff2\" crossorigin=\"\">\n");
      out.write("        <link href=\"https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css\" rel=\"stylesheet\">\n");
      out.write("        <title>Login and Sign Up | LaRevue System</title>\n");
      out.write("        <script>\n");
      out.write("            function validatePassword() {\n");
      out.write("                var password = document.form.password.value;\n");
      out.write("\n");
      out.write("                if (password.length < 8) {\n");
      out.write("                    alert(\"Password must be at least 8 characters long.\");\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script> \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"flex items-center justify-between flex-wrap bg-teal p-6\">\n");
      out.write("            <div class=\"flex items-center flex-no-shrink text-black mr-6\">\n");
      out.write("                <a href=\"index.jsp\" class=\"flex items-center flex-no-shrink text-black mr-6 hover:text-gray-200\">\n");
      out.write("                    <svg xmlns=\"http://www.w3.org/2000/svg\" class=\"h-6 w-6\" fill=\"none\" viewBox=\"0 0 24 24\" stroke=\"currentColor\">\n");
      out.write("                    <path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M11 19l-7-7 7-7m8 14l-7-7 7-7\" />\n");
      out.write("                    </svg>  \n");
      out.write("                    <span class=\"pl-2 font-semibold text-xl tracking-tight\">LaRevue</span>\n");
      out.write("                </a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"bg-gray-500 min-h-screen flex flex-col rounded\">\n");
      out.write("            <div class=\"sm:flex sm:space-x-2 justify-center my-auto mx-20\">\n");
      out.write("                <div class=\"rounded-3xl w-full flex flex-col items-center justify-center px-2\">\n");
      out.write("                    <div class=\"bg-gray-100 px-6 py-8 rounded shadow-md text-black w-full\">\n");
      out.write("                        <div class=\" flex justify-center shadow-lg rounded-3xl bg-white\">\n");
      out.write("                            <button type=\"button\"\n");
      out.write("                                    class=\"group flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-3xl text-gray-900 bg-white focus:outline-none w-full\">Log In</button>\n");
      out.write("                            <button type=\"button\"\n");
      out.write("                                    class=\"group flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-3xl text-white bg-gray-800 focus:outline-none w-full\">Register</button>\n");
      out.write("                        </div>\n");
      out.write("                        <form name=\"form\" class=\"mt-8 space-y-6\" action=\"");
      out.print(request.getContextPath());
      out.write("/UserController\" method=\"POST\" onsubmit=\"return validatePassword()\">\n");
      out.write("                            <input type=\"hidden\" name=\"remember\" value=\"true\">\n");
      out.write("                            <div class=\"rounded-md shadow-sm -space-y-px\">\n");
      out.write("                                <div>\n");
      out.write("                                    <label for=\"fullName\" class=\"sr-only\">Full Name</label>\n");
      out.write("                                    <input id=\"fullName\" name=\"fullName\" type=\"text\" required class=\"appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm\" placeholder=\"Full Name\">\n");
      out.write("                                </div>\n");
      out.write("                                <br>\n");
      out.write("                                <div>\n");
      out.write("                                    <label for=\"email-address\" class=\"sr-only\">Email address</label>\n");
      out.write("                                    <input id=\"email-address\" name=\"email\" type=\"email\" autocomplete=\"email\" required class=\"appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm\" placeholder=\"Email Address\">\n");
      out.write("                                </div>\n");
      out.write("                                <br>\n");
      out.write("                                <div>\n");
      out.write("                                    <label for=\"password\" class=\"sr-only\">Password</label>\n");
      out.write("                                    <input id=\"password\" name=\"password\" type=\"password\" required class=\"appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm\" placeholder=\"Password\">\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div>\n");
      out.write("                                <button type=\"submit\" name=\"action\" value=\"register\"\n");
      out.write("                                        class=\"group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500\">\n");
      out.write("                                    <span class=\"absolute left-0 inset-y-0 flex items-center pl-3\">\n");
      out.write("                                        <!-- Heroicon name: solid/lock-closed -->\n");
      out.write("                                        <svg class=\"h-5 w-5 text-gray-500 group-hover:text-gray-400\"\n");
      out.write("                                             xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\"\n");
      out.write("                                             aria-hidden=\"true\">\n");
      out.write("                                        <path fill-rule=\"evenodd\"\n");
      out.write("                                              d=\"M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z\"\n");
      out.write("                                              clip-rule=\"evenodd\" />\n");
      out.write("                                        </svg>\n");
      out.write("                                    </span>\n");
      out.write("                                    Register\n");
      out.write("                                </button>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"flex w-full flex-col items-center justify-center px-2\">\n");
      out.write("                    <div class=\"bg-gray-100 px-6 py-8 rounded shadow-md text-black w-full\">\n");
      out.write("                        <div class=\" flex justify-center shadow-lg rounded-3xl bg-white\">\n");
      out.write("                            <button type=\"button\"\n");
      out.write("                                    class=\"group flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-3xl text-white bg-gray-800 focus:outline-none w-full\">Log\n");
      out.write("                                In</button>\n");
      out.write("                            <button type=\"button\"\n");
      out.write("                                    class=\"group flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-3xl text-gray-900 bg-white focus:outline-none w-full\">Register</button>\n");
      out.write("                        </div>\n");
      out.write("                        <form class=\"mt-8 space-y-6\" action=\"");
      out.print(request.getContextPath());
      out.write("/UserController\" method=\"POST\">\n");
      out.write("                            <div class=\"text-center text-md\">\n");
      out.write("                                <span style=\"color:red\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${error}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</span>\n");
      out.write("                            </div>\n");
      out.write("                            <input type=\"hidden\" name=\"remember\" value=\"true\">\n");
      out.write("                            <div class=\"rounded-md shadow-sm -space-y-px\">\n");
      out.write("                                <div>\n");
      out.write("                                    <label for=\"email-address\" class=\"sr-only\">Email address</label>\n");
      out.write("                                    <input id=\"email-address\" name=\"email\" type=\"email\" autocomplete=\"email\" required class=\"appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm\" placeholder=\"Email Address\">\n");
      out.write("                                </div>\n");
      out.write("                                <br>\n");
      out.write("                                <div>\n");
      out.write("                                    <label for=\"password\" class=\"sr-only\">Password</label>\n");
      out.write("                                    <input id=\"password\" name=\"password\" type=\"password\" required class=\"appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm\" placeholder=\"Password\">\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div>\n");
      out.write("                                <button type=\"submit\" name=\"action\" value=\"login\"\n");
      out.write("                                        class=\"group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500\">\n");
      out.write("                                    <span class=\"absolute left-0 inset-y-0 flex items-center pl-3\">\n");
      out.write("                                        <!-- Heroicon name: solid/lock-closed -->\n");
      out.write("                                        <svg class=\"h-5 w-5 text-gray-500 group-hover:text-gray-400\"\n");
      out.write("                                             xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\"\n");
      out.write("                                             aria-hidden=\"true\">\n");
      out.write("                                        <path fill-rule=\"evenodd\"\n");
      out.write("                                              d=\"M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z\"\n");
      out.write("                                              clip-rule=\"evenodd\" />\n");
      out.write("                                        </svg>\n");
      out.write("                                    </span>\n");
      out.write("                                    Login\n");
      out.write("                                </button>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
