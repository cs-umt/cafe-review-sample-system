/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
package controller;
import dao.CafeDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.Cafe;

@MultipartConfig(maxFileSize = 16177215)
public class CafeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, IllegalStateException, SQLException, ClassNotFoundException {

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "register":
                    register(request, response);
                    break;
                    
                case "update":
                    updateCafe(request, response);
                    break;
                
                case "delete":
                    deleteCafe(request, response);
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

    private void register(HttpServletRequest req, HttpServletResponse resp) throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {

        //get all data from form
        String cafename = req.getParameter("cafeName");
        String cafelocation = req.getParameter("cafeLocation");
        String cafedescription = req.getParameter("cafeDescription");
        Part cafeimage = req.getPart("cafeImage");
        int userid = Integer.parseInt(req.getParameter("userid"));

        //keep data into javabeans
        Cafe newCafe = new Cafe();

        newCafe.setCafeName(cafename);
        newCafe.setCafeLocation(cafelocation);
        newCafe.setCafeDescription(cafedescription);
        newCafe.setCafeImage(cafeimage);
        newCafe.setUserid(userid);

        //pass the bean to DAO
        CafeDAO cafeDAO = new CafeDAO();
        cafeDAO.register(newCafe);

        List<Cafe> listCafe = cafeDAO.retrieveAllCafeById(userid);

        HttpSession session = req.getSession();
        session.setAttribute("list", listCafe);

        //save the bean as attribute and pass to view
        resp.sendRedirect("listCafe.jsp");
    }

    private void updateCafe(HttpServletRequest req, HttpServletResponse resp) throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {
        
        CafeDAO cafeDAO = new CafeDAO();
        
        String cafename = req.getParameter("cafeName");
        String cafelocation = req.getParameter("cafeLocation");
        String cafedescription = req.getParameter("cafeDescription");
        Part cafeimage = req.getPart("cafeImage");
        int cafeid = Integer.parseInt(req.getParameter("cafeid"));
        int userid = Integer.parseInt(req.getParameter("userid"));
        
        if (cafeimage.getName().isEmpty()){
            Cafe cafe = cafeDAO.retrieveCafeById(cafeid);
            cafeimage = cafe.getCafeImage();
        }
        Cafe cafe = new Cafe();

        cafe.setCafeName(cafename);
        cafe.setCafeLocation(cafelocation);
        cafe.setCafeDescription(cafedescription);
        cafe.setCafeImage(cafeimage);
        cafe.setCafeid(cafeid);
        cafe.setUserid(userid);

        cafeDAO.updateCafe(cafe);
        
        cafeDAO.retrieveAllCafeById(userid);

        resp.sendRedirect("listCafe.jsp");
        
    }
    
    private void deleteCafe(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException, ClassNotFoundException {
        
        int cafeid = Integer.parseInt(req.getParameter("cafeid"));
        
        Cafe cafe = new Cafe();
        
        cafe.setCafeid(cafeid);
        
        CafeDAO cafeDAO = new CafeDAO();
        
        cafeDAO.deleteCafe(cafe);
        
        resp.sendRedirect("dashboard.jsp");
        
    }

}
