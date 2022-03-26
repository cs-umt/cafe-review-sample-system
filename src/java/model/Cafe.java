/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
package model;

import javax.servlet.http.Part;

public class Cafe implements java.io.Serializable{
    
    private int cafeid;
    private String cafeName;
    private String cafeLocation;
    private String cafeDescription;
    private Part cafeImage;
    private int userid;

    public Cafe() {
    }

    public Cafe(int cafeid, String cafeName, String cafeLocation, String cafeDescription) {
        this.cafeid = cafeid;
        this.cafeName = cafeName;
        this.cafeLocation = cafeLocation;
        this.cafeDescription = cafeDescription;
    }

    public Cafe(int cafeid, String cafeName, String cafeLocation) {
        this.cafeid = cafeid;
        this.cafeName = cafeName;
        this.cafeLocation = cafeLocation;
    }
    
    public int getCafeid() {
        return cafeid;
    }

    public void setCafeid(int cafeid) {
        this.cafeid = cafeid;
    }

    public String getCafeName() {
        return cafeName;
    }

    public void setCafeName(String cafeName) {
        this.cafeName = cafeName;
    }

    public String getCafeLocation() {
        return cafeLocation;
    }

    public void setCafeLocation(String cafeLocation) {
        this.cafeLocation = cafeLocation;
    }

    public String getCafeDescription() {
        return cafeDescription;
    }

    public void setCafeDescription(String cafeDescription) {
        this.cafeDescription = cafeDescription;
    }

    public Part getCafeImage() {
        return cafeImage;
    }

    public void setCafeImage(Part cafeImage) {
        this.cafeImage = cafeImage;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }
    
    
}
