/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
package dao;

import database.DBConnection;
import static database.DBConnection.getConnection;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;
import model.Cafe;

public class CafeDAO {
    
    private final Connection con;
    
    public CafeDAO() throws SQLException, ClassNotFoundException{
        con = DBConnection.getConnection();
    }
    
    public void register(Cafe cafe) throws SQLException, IOException{
        try {
            String mySQLQuery = "insert into cafes(cafeName, cafeLocation, cafeDescription, cafeImage, userid) values(?, ?, ?, ?, ?)";
            
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            myPS.setString(1, cafe.getCafeName());
            myPS.setString(2, cafe.getCafeLocation());
            myPS.setString(3, cafe.getCafeDescription());
                       
            Part filePart = cafe.getCafeImage();
            InputStream inputStream = null;
            
            if (filePart != null){
                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();
            } 
            
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                myPS.setBlob(4, inputStream);
            }
            
            myPS.setInt(5, cafe.getUserid());
            
            myPS.executeUpdate();
        } 
        catch (SQLException e){
            System.out.println(e.getMessage());
        } 
        finally {
            con.close();
        }
    }
    
    public List <Cafe> retrieveAllCafeById(int userid) throws ClassNotFoundException, SQLException{
        
        List <Cafe> cafes = new ArrayList<>();
        
        String mySQLQuery = "select * from cafes where userid=" +userid;
        
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement =
                connection.prepareStatement(mySQLQuery);){
            System.out.print(preparedStatement);
            
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                int cafeid = rs.getInt("cafeid");
                String cafename = rs.getString("cafeName");
                String cafelocation = rs.getString("cafeLocation");
                String cafedesc = rs.getString("cafeDescription");
                cafes.add(new Cafe(cafeid, cafename, cafelocation, cafedesc));
            }
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        }
        finally {
            con.close();
        }
        return cafes;
    }
    
    public List <Cafe> getAllCafe() throws ClassNotFoundException, SQLException{
        
        List <Cafe> cafes = new ArrayList<>();
        
        String mySQLQuery = "select * from cafes";
        
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement =
                connection.prepareStatement(mySQLQuery);){
            System.out.print(preparedStatement);
            
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                int cafeid = rs.getInt("cafeid");
                String cafename = rs.getString("cafeName");
                String cafelocation = rs.getString("cafeLocation");
                String cafedesc = rs.getString("cafeDescription");
                cafes.add(new Cafe(cafeid, cafename, cafelocation, cafedesc));
            }
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        }
        finally {
            con.close();
        }
        return cafes;
    }
    
    public Cafe retrieveCafeById(int cafeid) throws ClassNotFoundException, SQLException{
        
        Cafe cafe = new Cafe();
        
        try {
            PreparedStatement myPS = DBConnection.getConnection()
                .prepareStatement("select * from cafes where cafeid=?");

            myPS.setInt(1, cafeid);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()){
                cafe.setCafeid(rs.getInt("cafeid"));
                cafe.setCafeName(rs.getString("cafeName"));
                cafe.setCafeLocation(rs.getString("cafeLocation"));
                cafe.setCafeDescription(rs.getString("cafeDescription"));
            }  
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        }
        finally {
            con.close();
        }
        return cafe;
    }
    
    public void updateCafe(Cafe cafe) throws SQLException, IOException, ClassNotFoundException{
        try {
            String myQ = "update cafes set cafeImage=?, cafeName=?, cafeLocation=?, cafeDescription=? where cafeid=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            Part filePart = cafe.getCafeImage();
            InputStream inputStream = null;
            
            inputStream = filePart.getInputStream();
            
            // fetches input stream of the upload file for the blob column
            myPS.setBlob(1, inputStream);

            myPS.setString(2, cafe.getCafeName());
            myPS.setString(3, cafe.getCafeLocation());
            myPS.setString(4, cafe.getCafeDescription());
            myPS.setInt(5, cafe.getCafeid());
            
            myPS.executeUpdate();

        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        }
        finally {
            con.close();
        }
    }
    
    public void deleteCafe(Cafe cafe){
        
        String myQ = "delete from cafes where cafeid=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, cafe.getCafeid());
        
            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CafeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
