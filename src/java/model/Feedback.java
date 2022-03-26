/**
 *
 * @author Dennis <S54407@ocean.umt.edu.my>
 */
package model;

public class Feedback implements java.io.Serializable {
    
    private int feedbackid;
    private String email;
    private String subject;
    private String message;
    private int userid;

    public Feedback() {
    }

    public Feedback(int feedbackid, String email, String subject, String message, int userid) {
        this.feedbackid = feedbackid;
        this.email = email;
        this.subject = subject;
        this.message = message;
        this.userid = userid;
    }
    
    public Feedback(int feedbackid, String email, String subject, String message) {
        this.feedbackid = feedbackid;
        this.email = email;
        this.subject = subject;
        this.message = message;
    }

    public int getFeedbackid() {
        return feedbackid;
    }

    public void setFeedbackid(int feedbackid) {
        this.feedbackid = feedbackid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }
    
}
