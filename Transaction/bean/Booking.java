/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Transaction.bean;

/**
 *
 * @author User
 */
public class Booking implements java.io.Serializable{
    String PaymentStatus;
    String BookingDate;
    String Pickup;
    String Destination;
    int UserID;
    int DriverID;
    double price;

    public Booking(String PaymentStatus, String BookingDate, String Pickup, String Destination, int UserID, int DriverID, double price) {
        this.PaymentStatus = PaymentStatus;
        this.BookingDate = BookingDate;
        this.Pickup = Pickup;
        this.Destination = Destination;
        this.UserID = UserID;
        this.DriverID = DriverID;
        this.price = price;
    }
    
    public Booking() {
        this.PaymentStatus = "";
        this.BookingDate = "";
        this.Pickup = "";
        this.Destination = "";
        this.UserID = 0;
        this.DriverID = 0;
        this.price = 0;
    }

    public double getPrice() {
        return price;
    }
    
    public String getPaymentStatus() {
        return PaymentStatus;
    }

    public int getUserID() {
        return UserID;
    }

    public int getDriverID() {
        return DriverID;
    }
    

    public String getBookingDate() {
        return BookingDate;
    }

    public String getPickup() {
        return Pickup;
    }

    public String getDestination() {
        return Destination;
    }

    public void setPaymentStatus(String PaymentStatus) {
        this.PaymentStatus = PaymentStatus;
    }

    public void setBookingDate(String BookingDate) {
        this.BookingDate = BookingDate;
    }

    public void setPickup(String Pickup) {
        this.Pickup = Pickup;
    }

    public void setDestination(String Destination) {
        this.Destination = Destination;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public void setDriverID(int DriverID) {
        this.DriverID = DriverID;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
}
