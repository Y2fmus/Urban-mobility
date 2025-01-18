/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import Person.bean.Driver;
import Person.bean.User;
import java.sql.*;
import util.DBConnection;

/**
 *
 * @author User
 */
public class RegisterDao {
    
    public int id=0;
    
    public String RegisterUser(User U){
        String username=U.getUsername();
        String email=U.getEmail();
        int phone=U.getPhone();
        String password=U.getPassword();
        
        Connection con = null;
        Statement statement = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs=null;
        
        try{
            con = DBConnection.createConnection();//Fetch database connection object
            statement = con.createStatement (); //Statement is used to write queries. Read more
            rs = statement.executeQuery ("SELECT * FROM customer"); //
            
            while(rs.next()){
                id=rs.getInt("UserID");
            }
            
            id++;
            
            preparedStatement=con.prepareStatement("INSERT INTO customer (UserID,Username,Email,password,UserPhone) VALUES (?,?,?,?,?)");
            preparedStatement.setInt(1,id);
            preparedStatement.setString(2,username);
            preparedStatement.setString(3,email);
            preparedStatement.setString(4,password);
            preparedStatement.setInt(5,phone);
            
            preparedStatement.executeUpdate();
            con.close();
            
            return "SUCCESS";
        }
        catch(SQLException e){
            e. printStackTrace() ;
            return "FAILED";
        }
    }
    public String RegisterDriver(Driver D){
        String Drivername=D.getDrivername();
        String email=D.getDriverEmail();
        int phone=D.getDriverphone();
        String password=D.getDriverPassword();
        
        Connection con = null;
        Statement statement = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs=null;
        
        try{
            con = DBConnection.createConnection();//Fetch database connection object
            statement = con.createStatement (); //Statement is used to write queries. Read more
            rs = statement.executeQuery ("SELECT * FROM Driver"); //
            
            while(rs.next()){
                id=rs.getInt("DriverID");
            }
            
            id++;
            
            preparedStatement=con.prepareStatement("INSERT INTO Driver (DriverID,Drivername,DriverEmail,DriverPassword,DriverPhone) VALUES (?,?,?,?,?)");
            preparedStatement.setInt(1,id);
            preparedStatement.setString(2,Drivername);
            preparedStatement.setString(3,email);
            preparedStatement.setString(4,password);
            preparedStatement.setInt(5,phone);
            
            preparedStatement.executeUpdate();
            con.close();
            
            return "SUCCESS";
        }
        catch(SQLException e){
            e. printStackTrace() ;
            return "FAILED";
        }
    }
    
}
