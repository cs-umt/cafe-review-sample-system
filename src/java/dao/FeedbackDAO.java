/**
 *
 * @author Dennis <S54407@ocean.umt.edu.my>
 */
package dao;

import database.DBConnection;
import static database.DBConnection.getConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Feedback;

public class FeedbackDAO {
    
    private final Connection con;
    
    public FeedbackDAO() throws SQLException, ClassNotFoundException{
        con = DBConnection.getConnection();
    }
    
    public void addFeedback(Feedback feedback) throws SQLException, IOException{
        try {
            String mySQLQuery = "insert into feedbacks(email, subject, message, userid) values(?, ?, ?, ?)";
            
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            myPS.setString(1, feedback.getEmail());
            myPS.setString(2, feedback.getSubject());
            myPS.setString(3, feedback.getMessage());
            myPS.setInt(4, feedback.getUserid());

            myPS.executeUpdate();
        } 
        catch (SQLException e){
            System.out.println(e.getMessage());
        } 
        finally {
            con.close();
        }
    }
    
    public List <Feedback> retrieveFeedback(int userid) throws ClassNotFoundException, SQLException{
        
        List <Feedback> fb = new ArrayList<>();
        
        String mySQLQuery = "select * from feedbacks where userid=" +userid;
        
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement =
                connection.prepareStatement(mySQLQuery);){
            System.out.print(preparedStatement);
            
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                int feedbackid = rs.getInt("feedbackid");
                String email = rs.getString("email");
                String subject = rs.getString("subject");
                String message = rs.getString("message");
                fb.add(new Feedback(feedbackid, email, subject, message));
            }
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        }
        finally {
            con.close();
        }
        return fb;
    }
    
    public Feedback retrieveFeedbackById(int feedbackid) throws ClassNotFoundException, SQLException{
        
        Feedback feedback = new Feedback();
        
        try {
            PreparedStatement myPS = DBConnection.getConnection()
                .prepareStatement("select * from feedbacks where feedbackid=?");

            myPS.setInt(1, feedbackid);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()){
                feedback.setFeedbackid(rs.getInt("feedbackid"));
                feedback.setEmail(rs.getString("email"));
                feedback.setSubject(rs.getString("subject"));
                feedback.setMessage(rs.getString("message"));
            }  
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        }
        finally {
            con.close();
        }
        return feedback;
    }
    
    public List <Feedback> retrieveAllFeedbacks() throws ClassNotFoundException, SQLException{
        
        List <Feedback> fb = new ArrayList<>();
        
        String mySQLQuery = "select * from feedbacks";
        
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement =
                connection.prepareStatement(mySQLQuery);){
            System.out.print(preparedStatement);
            
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                int feedbackid = rs.getInt("feedbackid");
                String email = rs.getString("email");
                String subject = rs.getString("subject");
                String message = rs.getString("message");
                int userid = rs.getInt("userid");
                fb.add(new Feedback(feedbackid, email, subject, message, userid));
            }
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        }
        finally {
            con.close();
        }
        return fb;
    }
    
    public void updateFeedback(Feedback feedback) throws SQLException, IOException, ClassNotFoundException{
        try {
            String myQ = "update feedbacks set email=?, subject=?, message=? where feedbackid=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);

            myPS.setString(1, feedback.getEmail());
            myPS.setString(2, feedback.getSubject());
            myPS.setString(3, feedback.getMessage());
            myPS.setInt(4, feedback.getFeedbackid());
            
            myPS.executeUpdate();

        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        }
        finally {
            con.close();
        }
    }
    
    public void deleteFeedback(Feedback feedback){
        
        String myQ = "delete from feedbacks where feedbackid=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, feedback.getFeedbackid());
        
            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CafeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
