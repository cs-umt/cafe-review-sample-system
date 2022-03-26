/**
 *
 * @author Dennis <S54407@ocean.umt.edu.my>
 */
package controller;

import dao.FeedbackDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Feedback;

public class FeedbackController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "addFeedback":
                    addFeedback(request, response);
                    break;      
                    
                case "update":
                    updateFeedback(request, response);
                    break;
                   
                case "delete":
                    deleteFeedback(request, response);
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "index.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FeedbackController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FeedbackController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void addFeedback(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        
        //get all data from form
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        int userid = Integer.parseInt(request.getParameter("userid"));

        //keep data into javabeans
        Feedback newFeedback = new Feedback();

        newFeedback.setEmail(email);
        newFeedback.setSubject(subject);
        newFeedback.setMessage(message);
        newFeedback.setUserid(userid);

        //pass the bean to DAO
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        feedbackDAO.addFeedback(newFeedback);

        //save the bean as attribute and pass to view
        request.setAttribute("feedback", newFeedback);
        response.sendRedirect("dashboard.jsp");
        
    }

    private void updateFeedback(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        int fbid = Integer.parseInt(request.getParameter("feedbackid"));
        int userid = Integer.parseInt(request.getParameter("userid"));
        
        Feedback fb = new Feedback();

        fb.setEmail(email);
        fb.setSubject(subject);
        fb.setMessage(message);
        fb.setUserid(userid);
        fb.setFeedbackid(fbid);
        fb.setUserid(userid);
        
        FeedbackDAO fbDAO = new FeedbackDAO();
        
        fbDAO.updateFeedback(fb);
        
        fbDAO.retrieveFeedback(userid);

        response.sendRedirect("feedbackDetails.jsp");
        
    }
    
    private void deleteFeedback(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {
        
        int feedbackid = Integer.parseInt(request.getParameter("feedbackid"));
        
        Feedback fb = new Feedback();
        
        fb.setFeedbackid(feedbackid);
        
        FeedbackDAO fbDAO = new FeedbackDAO();
        
        fbDAO.deleteFeedback(fb);
        
        response.sendRedirect("dashboard.jsp");
        
    }
    

}
