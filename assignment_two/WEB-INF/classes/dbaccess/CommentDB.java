package dbaccess;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class CommentDB {
    public Comment insertUserDetails(int cid, String op, String timeposted, String comment) throws SQLException{
        
    	Comment uBean = null;
        Connection conn = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/db1?user=root&password=Abcd$63641995&useSSL=false");
            Statement stmt= conn.createStatement();
            String sqlStr = "INSERT INTO `aircraft`.`comment` (`commentid`, `poster`, `timeposted`, `comment`) VALUES ('"+cid+"', '"+op+"', '"+timeposted+"', '"+comment+"');";
            stmt.executeUpdate(sqlStr);
        } catch (Exception e){
        	System.out.print("..............UserDetailsDB:"+e);
        } finally{
            conn.close();
        }
        
        return uBean;
    }
}
