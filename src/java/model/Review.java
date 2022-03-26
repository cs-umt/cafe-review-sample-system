/**
 *
 * @author Aliesa <S54162@ocean.umt.edu.my>
 */
package model;

public class Review implements java.io.Serializable  {
    protected int rid;
    protected String review;
    private int userid;
    private int cafeid;
    
    public Review() {}
    
    public Review(String review){
        super();
        this.review = review;
    }
    
    public Review(int rid, String review){
        super();
        this.rid = rid;
        this.review = review;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getCafeid() {
        return cafeid;
    }

    public void setCafeid(int cafeid) {
        this.cafeid = cafeid;
    }
    
    
}
