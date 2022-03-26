/**
 *
 * @author Aliesa <S54162@ocean.umt.edu.my>
 */
package dao;

import database.DBConnection;
import static database.DBConnection.getConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Review;

public class ReviewDAO {

    private final Connection con;

    public ReviewDAO() throws SQLException, ClassNotFoundException {
        con = DBConnection.getConnection();
    }

    public void addReview(Review review) throws SQLException, IOException {
        try {
            String mySQLQuery = "insert into reviews(review, cafeid, userid) values(?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setString(1, review.getReview());
            myPS.setInt(2, review.getCafeid());
            myPS.setInt(3, review.getUserid());

            myPS.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
    }

    public List<Review> retrieveAllReviewByUserId(int userid) throws ClassNotFoundException, SQLException {

        List<Review> reviews = new ArrayList<>();

        String mySQLQuery = "select * from reviews where userid=" + userid;

        try (Connection connection = getConnection();
                PreparedStatement preparedStatement
                = connection.prepareStatement(mySQLQuery);) {
            System.out.print(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int rid = rs.getInt("rid");
                String reviewDesc = rs.getString("review");
                int cafeid = rs.getInt("cafeid");
                int userId = rs.getInt("userid");

                Review review = new Review();

                review.setRid(rid);
                review.setReview(reviewDesc);
                review.setCafeid(cafeid);
                review.setUserid(userId);

                reviews.add(review);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return reviews;
    }
    
    public List<Review> retrieveAllReviewByCafeId(int cafeid) throws ClassNotFoundException, SQLException {

        List<Review> reviews = new ArrayList<>();

        String mySQLQuery = "select * from reviews where cafeid=" + cafeid;

        try (Connection connection = getConnection();
                PreparedStatement preparedStatement
                = connection.prepareStatement(mySQLQuery);) {
            System.out.print(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int rid = rs.getInt("rid");
                String reviewDesc = rs.getString("review");
                int cafeId = rs.getInt("cafeid");
                int userId = rs.getInt("userid");

                Review review = new Review();

                review.setRid(rid);
                review.setReview(reviewDesc);
                review.setCafeid(cafeId);
                review.setUserid(userId);

                reviews.add(review);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return reviews;
    }

    public Review retrieveReviewById(int rid) throws ClassNotFoundException, SQLException {

        Review review = new Review();

        try {
            PreparedStatement myPS = DBConnection.getConnection()
                    .prepareStatement("select * from reviews where rid=?");

            myPS.setInt(1, rid);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()) {
                review.setCafeid(rs.getInt("cafeid"));
                review.setRid(rs.getInt("rid"));
                review.setReview(rs.getString("review"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return review;
    }

    public List<Review> retrieveReviewByCafeUserId(int userid, int cafeid) throws ClassNotFoundException, SQLException {

        List<Review> listRV = new ArrayList<>();

        try {
            PreparedStatement myPS = DBConnection.getConnection()
                    .prepareStatement("select * from reviews where cafeid=? AND userid=?");

            myPS.setInt(1, cafeid);
            myPS.setInt(2, userid);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()) {
                int rid = rs.getInt("rid");
                String reviewDesc = rs.getString("review");
                int cafeId = rs.getInt("cafeid");
                int userId = rs.getInt("userid");

                Review review = new Review();

                review.setRid(rid);
                review.setReview(reviewDesc);
                review.setCafeid(cafeId);
                review.setUserid(userId);

                listRV.add(review);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return listRV;
    }
    

    public int countReview(int cafeid) {

        String myQ = "select count(1) from reviews where cafeid=" + cafeid;
        int record = 0;
        
        try {
            Statement stmt = con.createStatement();
            ResultSet rsExist = stmt.executeQuery(myQ);
            
            if (rsExist.next()) {
                record = rsExist.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CafeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return record;
        
    }

    public void updateReview(Review review) throws SQLException, IOException, ClassNotFoundException {
        try {
            String myQ = "update reviews set review=?, userid=?, cafeid=? where rid=?";

            PreparedStatement myPS = con.prepareStatement(myQ);

            myPS.setString(1, review.getReview());
            myPS.setInt(2, review.getUserid());
            myPS.setInt(3, review.getCafeid());
            myPS.setInt(4, review.getRid());

            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
    }

    public void deleteReview(Review review) {

        String myQ = "delete from reviews where rid=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, review.getRid());

            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CafeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
