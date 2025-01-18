/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Transportation;

/**
 *
 * @author User
 */
public class Vehicle implements java.io.Serializable{
    String PlateNumber;
    String Type;
    int Capacity;
    String Status;

    public Vehicle(String PlateNumber, String Type, int Capacity, String Status) {
        this.PlateNumber = PlateNumber;
        this.Type = Type;
        this.Capacity = Capacity;
        this.Status = Status;
    }

    public String getPlateNumber() {
        return PlateNumber;
    }

    public String getType() {
        return Type;
    }

    public int getCapacity() {
        return Capacity;
    }

    public String getStatus() {
        return Status;
    }

    public void setPlateNumber(String PlateNumber) {
        this.PlateNumber = PlateNumber;
    }

    public void setType(String Type) {
        this.Type = Type;
    }

    public void setCapacity(int Capacity) {
        this.Capacity = Capacity;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }
    
    
}
