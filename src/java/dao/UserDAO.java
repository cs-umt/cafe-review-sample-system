/**
 *
 * @author Nik Aminah Thaherah <S54170@ocean.umt.edu.my>
 */
package dao;

import database.DBConnection;
import model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAO {
    
    private final Connection con;
    
    public UserDAO() throws SQLException, ClassNotFoundException{
        con = DBConnection.getConnection();
    }
    
    public void save(User user) throws SQLException{
        try {
            String mySQLQuery = "insert into users(fullName, email, password) values(?, ?, ?)";
            
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            myPS.setString(1, user.getFullName());
            myPS.setString(2, user.getEmail());
            myPS.setString(3, user.getPassword());
            
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        } finally {
            con.close();
        }
    }
    
    public User authentication (String email, String password) throws SQLException{
        ResultSet rs = null;
        User user = null;
        
        try {
            String mySQLQuery = "select * from users where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);
            
            ps.setString(1, email);
            ps.setString(2, password);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                user = new User();
                
                user.setEmail(email);
                user.setPassword(password);
                user.setUserid(rs.getInt(1));
                user.setFullName(rs.getString(2));

            }
            con.close();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        } finally {
            if(rs != null){
                rs.close();
            }
            con.close();
        }
        
        return user;
    }
    
    public List<User> retrieveAll() throws SQLException {
        List<User> userList = new ArrayList<>();
        
        User user;
        ResultSet rs = null;
        
        try {
            String sqlQuery = "select * from users";
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){
                user = new User();
                
                user.setFullName(rs.getString(1));
                user.setEmail(rs.getString(2));
                user.setPassword(rs.getString(3));
                
                userList.add(user);
            }
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
            
        } finally {
            if(rs != null){
                rs.close();
            }
            
            con.close();
        }
        
        return userList;
    }
    
    public User retrieveUserByUserId(int userid) throws ClassNotFoundException, SQLException {

        User user = new User();

        try {
            PreparedStatement myPS = DBConnection.getConnection()
                    .prepareStatement("select * from users where userid=?");

            myPS.setInt(1, userid);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()) {
                user.setUserid(rs.getInt("userid"));
                user.setFullName(rs.getString("fullName"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return user;
    }
    
    public void update(User user){
        
        try {
            String myQ = "update users set fullName=?, email=?, password=? WHERE userid=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, user.getFullName());
            myPS.setString(2, user.getEmail());
            myPS.setString(3, user.getPassword());
            myPS.setInt(4, user.getUserid());
            
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
    
    public void delete(User user){
        
        String myQ = "DELETE FROM users WHERE userid=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, user.getUserid());
        
            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    
}
