/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nqh14
 */
public class User {
    int id;
    String account;
    String password;
    String email;
    String phone;
    String address;
    String name;
    private Connection cnn;
    private Statement stm;
    private ResultSet rs;
    PreparedStatement statement;
    
    public User() {
        try {
            cnn = (new DBContext().getConnection());
            System.out.println("Success");
        } catch (Exception e) {
            System.out.println("connect fail : " + e.getMessage());
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User(String account, String password) {
        this.account = account;
        this.password = password;
        
        try {
            cnn = (new DBContext().getConnection());
            System.out.println("Success");
        } catch (Exception e) {
            System.out.println("connect fail : " + e.getMessage());
        }
    }

    public User(String account, String password, String name, String email, String phone, String address) {
        this.account = account;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.name = name;
        
        try {
            cnn = (new DBContext().getConnection());
            System.out.println("Success");
        } catch (Exception e) {
            System.out.println("connect fail : " + e.getMessage());
        }
        this.id = getCurID()+1;
    }
    public User(String account, String name, String email, String phone, String address) {
        this.account = account;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.name = name;
        
        try {
            cnn = (new DBContext().getConnection());
            System.out.println("Success");
        } catch (Exception e) {
            System.out.println("connect fail : " + e.getMessage());
        }
    }
    public boolean isExist(String username){
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "Select * from tblUser where account ='"+username+"'";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public boolean checkLogin(int type) {
//        return "admin".equals(account) && "123".equals(password);

        //CHECK XEM ACCOUNT CO TON TAI TRONG TBL USER HAY KHONG?
        //TON TAI RETURN TRUE
        // KHOONG TON TAI RETURN FALSE
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "";
            if (type == 1) {
                strSelect = "Select * from tblUser where account ='"+account+"' and password = '"+password+"'";
            }
            if (type == 2) {
                strSelect = "Select * from tblUser where account ='"+account+"'";
            }
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("fail : " + e.getMessage());
        }
        return false;
    }
    public int getCurID(){
        int bid = 0;
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "select MAX(id) as maxID from tblUser";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                bid = rs.getInt("maxID");  
            }  
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bid;
    }
    public void insertDB() {
        try {
            statement = cnn.prepareStatement("INSERT INTO tblUser (id ,account, password, email, phone, address, name) VALUES (?, ?, ?, ?, ?, ?, ?)");
            statement.setInt(1, id);
            statement.setString(2, account);
            statement.setString(3, password);
            statement.setString(4, email);
            statement.setString(5, phone);
            statement.setString(6, address);
            statement.setString(7, name);
           
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("fail : " + e.getMessage());
        }
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public User getInfoByName(String account) {
        User u = null;
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect;
            strSelect = "Select * from tblUser where account ='"+account+"'";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                u  = new User(rs.getString("account"), rs.getString("name"),rs.getString("email"),rs.getString("phone"),rs.getString("address"));
            }
        } catch (SQLException e) {
            System.out.println("fail : " + e.getMessage());
        }
        return u;
    }

    
    
}
