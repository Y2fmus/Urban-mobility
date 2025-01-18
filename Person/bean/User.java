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
public class User implements java.io.Serializable{
    String Username;
    String email;
    int phone;
    String password;
    
    public User(){
        this.Username = "";
        this.email = "";
        this.phone = 0;
        this.password ="";
        
    }
    
    public User(String Username, String email, int phone, String password) {
        this.Username = Username;
        this.email = email;
        this.phone = phone;
        this.password = password;
    }

    public String getUsername() {
        return Username;
    }

    public String getEmail() {
        return email;
    }

    public int getPhone() {
        return phone;
    }

    public String getPassword() {
        return password;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
