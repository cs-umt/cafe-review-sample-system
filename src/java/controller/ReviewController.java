/**
 *
 * @author Aliesa <S54162@ocean.umt.edu.my>
 */
package controller;

import dao.ReviewDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Review;

public class ReviewController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, IllegalStateException, SQLException, ClassNotFoundException {

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                 case "add":
                    addReview(request, response);
                    break;
                
                case "update":
                    updateReview(request, response);
                    break;
                
                case "delete":
                    deleteReview(request, response);
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
        } catch (IllegalStateException | SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CafeController.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (IllegalStateException | SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CafeController.class.getName()).log(Level.SEVERE, null, ex);
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

     private void addReview(HttpServletRequest req, HttpServletResponse resp) throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {

        String review = req.getParameter("review");
        int userid = Integer.parseInt(req.getParameter("userid"));
        int cafeid = Integer.parseInt(req.getParameter("cafeid"));

        Review newReview = new Review();
        
        newReview.setReview(review);
        newReview.setCafeid(cafeid);
        newReview.setUserid(userid);

        ReviewDAO reviewDAO = new ReviewDAO();
        
        reviewDAO.addReview(newReview);

        List<Review> listReview = reviewDAO.retrieveAllReviewByUserId(userid);

        HttpSession session = req.getSession();
        session.setAttribute("list", listReview);

        resp.sendRedirect("dashboard.jsp");
    }

     
    private void updateReview(HttpServletRequest request, HttpServletResponse response) throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {
        
        String review = request.getParameter("review");
        int rid = Integer.parseInt(request.getParameter("rid"));
        int userid = Integer.parseInt(request.getParameter("userid"));
        int cafeid = Integer.parseInt(request.getParameter("cafeid"));
        
        Review Review = new Review();

        Review.setReview(review);
        Review.setRid(rid);
        Review.setUserid(userid);
        Review.setCafeid(cafeid);
        
        ReviewDAO reviewDAO = new ReviewDAO();
        
        reviewDAO.updateReview(Review);
        
        reviewDAO.retrieveAllReviewByUserId(userid);

        response.sendRedirect("listReview.jsp");
        
    }
    
    private void deleteReview(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {
        
        int rid = Integer.parseInt(request.getParameter("rid"));
        
        Review review = new Review();
        
        review.setRid(rid);
        
        ReviewDAO reviewDAO = new ReviewDAO();
        
        reviewDAO.deleteReview(review);
        
        response.sendRedirect("dashboard.jsp");
        
    }
}
