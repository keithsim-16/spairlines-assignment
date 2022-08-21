package dbaccess;

public class Comment {
	private int commentid;
	private String poster;
	private String timeposted;
	private String comment;
	
	public Comment(int COMMENTID, String POSTER, String TIMEPOSTED, String COMMENT) {
		commentid = COMMENTID;
		poster = POSTER;
		timeposted = TIMEPOSTED;
		comment = COMMENT;
	}
	
	public int getcommentid(){
        return commentid;
    }
    
    public void setcommentid(int commentid){
        this.commentid = commentid;
    }
    public String getposter(){
        return poster;
    }
    
    public void setposter(String poster){
        this.poster = poster;
    }
    public String gettimeposted(){
        return timeposted;
    }
    
    public void settimeposted(String timeposted){
        this.timeposted = timeposted;
    }
    public String getcomment(){
        return comment;
    }
    
    public void setcomment(String comment){
        this.comment = comment;
    }
}
