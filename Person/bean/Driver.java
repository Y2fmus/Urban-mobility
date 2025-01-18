/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Person.bean;

/**
 *
 * @author User
 */
public class Driver implements java.io.Serializable{
    String Drivername;
    String License;
    int Driverphone;
    String DriverPassword;
    String DriverEmail;
    
    public Driver(){
        this.Drivername = "";
        this.License = "";
        this.Driverphone = 0;
        this.DriverPassword="";
        this.DriverEmail="";
    }
    public Driver(String Drivername, String License, int Driverphone,String P,String E) {
        this.Drivername = Drivername;
        this.License = License;
        this.Driverphone = Driverphone;
        this.DriverPassword=P;
        this.DriverEmail=E;
    }

    public String getDrivername() {
        return Drivername;
    }

    public String getLicense() {
        return License;
    }

    public int getDriverphone() {
        return Driverphone;
    }

    public String getDriverPassword() {
        return DriverPassword;
    }

    public String getDriverEmail() {
        return DriverEmail;
    }
    
    

    public void setDrivername(String Drivername) {
        this.Drivername = Drivername;
    }

    public void setLicense(String License) {
        this.License = License;
    }

    public void setDriverphone(int Driverphone) {
        this.Driverphone = Driverphone;
    }

    public void setDriverPassword(String DriverPassword) {
        this.DriverPassword = DriverPassword;
    }

    public void setDriverEmail(String DriverEmail) {
        this.DriverEmail = DriverEmail;
    }
    
}
