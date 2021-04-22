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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nqh14
 */
public class CheckOutModel {

    int id;
    String name;
    float amount;
    String address;
    String phone;
    private Connection cnn;
    private Statement stm;
    private ResultSet rs;
    PreparedStatement statement;

    public CheckOutModel() {
        try {
            cnn = (new DBContext().getConnection());
            System.out.println("Success");
        } catch (Exception e) {
            System.out.println("connect fail : " + e.getMessage());
        }
    }
    public int getCurID(){
        int bid = 0;
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "select MAX(id) as maxID from tblOder";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                bid = rs.getInt("maxID");  
            }  
        } catch (SQLException ex) {
            Logger.getLogger(CheckOutModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bid;
    }

    public CheckOutModel(String name, float amount, String address, String phone) {
        this.name = name;
        this.amount = amount;
        this.address = address;
        this.phone = phone;
        try {
            cnn = (new DBContext().getConnection());
            System.out.println("Success");
        } catch (Exception e) {
            System.out.println("connect fail : " + e.getMessage());
        }
        this.id = getCurID()+1;
    }

    public void insertDB() {

        try {
            statement = cnn.prepareStatement("INSERT INTO tblOder (id ,name, amount, address, phone) VALUES (?, ?, ?, ?, ?)");
            statement.setInt(1, id);
            statement.setString(2, name);
            statement.setFloat(3, amount);
            statement.setString(4, address);
            statement.setString(5, phone);
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}
