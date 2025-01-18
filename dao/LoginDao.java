/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Person.bean.Driver;
import Person.bean.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import util.DBConnection;

/**
 *
 * @author User
 */
public class LoginDao {
    public String authenticateUser(User loginBean){
        
    String userName = loginBean.getUsername(); //Assign user entered values to temporars
    String password = loginBean.getPassword();
    
    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;
    String userNameDB = "";
    String passwordDB ="";
    
    try {
        con = DBConnection.createConnection();//Fetch database connection object
        statement = con.createStatement (); //Statement is used to write queries. Read more
        resultSet = statement.executeQuery ("SELECT USERNAME,PASSWORD from Customer"); //the ta
    while (resultSet.next ())
    {// Until next row is present otherwise it return false
    userNameDB = resultSet.getString("Username"); //fetch the values present in databa
    passwordDB = resultSet.getString("password") ;
    if (userName.equals (userNameDB) && password. equals (passwordDB)) {
        return "SUCCESS"; ////if the user entered values are already present in the datal
    }
   }
  } 
    catch (SQLException e){
        e. printStackTrace() ;
    }

return "Invalid user credentials";
}
    public int getid(User loginBean){
        
    String userName = loginBean.getUsername(); //Assign user entered values to temporars
    String password = loginBean.getPassword();
    
    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;
    String userNameDB = "";
    String passwordDB ="";
    int id=0;
    
    try {
        con = DBConnection.createConnection();//Fetch database connection object
        statement = con.createStatement (); //Statement is used to write queries. Read more
        resultSet = statement.executeQuery ("SELECT USERNAME,PASSWORD,UserID from customer"); //the ta
    while (resultSet.next ())
    {// Until next row is present otherwise it return false
    userNameDB = resultSet.getString("username"); //fetch the values present in databa
    passwordDB = resultSet.getString("password") ;
    id = resultSet.getInt("userid") ;
    if (userName.equals (userNameDB) && password. equals (passwordDB)) {
        return id; ////if the user entered values are already present in the datal
    }
   }
  } 
    catch (SQLException e){
        e. printStackTrace() ;
    }

    return 0;
}
    public String authenticateDriver(Driver loginBean){
        
    String userName = loginBean.getDrivername(); //Assign user entered values to temporars
    String password = loginBean.getDriverPassword();
    
    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;
    String userNameDB = "";
    String passwordDB ="";
    
    try {
        con = DBConnection.createConnection();//Fetch database connection object
        statement = con.createStatement (); //Statement is used to write queries. Read more
        resultSet = statement.executeQuery ("SELECT Drivername,DriverPassword from Driver"); //the ta
    while (resultSet.next ())
    {// Until next row is present otherwise it return false
    userNameDB = resultSet.getString("Drivername"); //fetch the values present in databa
    passwordDB = resultSet.getString("DriverPassword") ;
    if (userName.equals (userNameDB) && password. equals (passwordDB)) {
        return "SUCCESS"; ////if the user entered values are already present in the datal
    }
   }
  } 
    catch (SQLException e){
        e. printStackTrace() ;
    }

return "Invalid user credentials";
}
     public int getDriverID(Driver loginBean){
        
    String DriverName = loginBean.getDrivername(); //Assign user entered values to temporars
    String password = loginBean.getDriverPassword();
    
    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;
    String userNameDB = "";
    String passwordDB ="";
    int id=0;
    
    try {
        con = DBConnection.createConnection();//Fetch database connection object
        statement = con.createStatement (); //Statement is used to write queries. Read more
        resultSet = statement.executeQuery ("SELECT Drivername,DriverPassword,DriverID from Driver"); //the ta
    while (resultSet.next ())
    {// Until next row is present otherwise it return false
    userNameDB = resultSet.getString("Drivername"); //fetch the values present in databa
    passwordDB = resultSet.getString("DriverPassword") ;
    id = resultSet.getInt("DriverID") ;
    if (DriverName.equals (userNameDB) && password. equals (passwordDB)) {
        return id; ////if the user entered values are already present in the datal
    }
   }
  } 
    catch (SQLException e){
        e. printStackTrace() ;
    }

    return 0;
}
}
