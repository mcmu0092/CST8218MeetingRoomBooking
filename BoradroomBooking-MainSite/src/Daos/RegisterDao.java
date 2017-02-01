package Daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RegisterDao 
{
	public static int register(String username, String pass, String firstName, String lastName,
									String email, String company, String city, String province)
	{
		/* registered is used for three return conditions. User is already in database = 1, 
		user was just added to database = 0, some error occurred = -1 */
		int registered = 0;			
		
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "boardroom";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "BoradRoom";
        String password = "password";					/* Change for your database */
        
        try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url + dbName, userName, password);

            /* Rewrite to make sure all entries are unique */
            pst = conn.prepareStatement("insert into usertable (password, firstName, lastName, "
            							+ "email, company, city, province, username) values (?, ?, ?, ?, ?, ?, ?, ?)");
            pst.setString(1, pass);
            pst.setString(2, firstName);
            pst.setString(3, lastName);
            pst.setString(4, email);
            pst.setString(5, company);
            pst.setString(6, city);
            pst.setString(7, province);
            pst.setString(8, username);
            
            int update = pst.executeUpdate();
            if(update > 0) {
            	registered = 0;
            }

        } catch (Exception e) {
        	registered = -1;
            System.out.println(e);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }		
		return registered;
	}//End of register

}//End of RegisterDao
