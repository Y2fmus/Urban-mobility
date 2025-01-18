/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author User
 */
public class DBConnection {
    
    public static Connection createConnection(){
        
        Connection conn = null;
        String url ="jdbc:derby://localhost:1527/Transport2;create=true";
        String username="app";
        String password="app";
        
        try{
            try{
                Class.forName("org.apache.derby.jdbc.ClientDriver");
            }catch (ClassNotFoundException e){
                e.printStackTrace();
            }
            conn=DriverManager.getConnection(url,username,password);
            System.out.println("Printing connection object"+conn);
        }catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }
}
