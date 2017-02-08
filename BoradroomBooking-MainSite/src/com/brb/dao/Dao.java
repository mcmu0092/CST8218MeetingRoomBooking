package com.brb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Dao {
    public static Connection getConnection() {    
    	Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "boardroom";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "beme123";
        try {
            Class.forName(driver).newInstance();
            conn = DriverManager
                    .getConnection(url + dbName, userName, password);
        } catch (Exception e) {
            System.out.println(e);
        } 
        
        return conn;
    }
}