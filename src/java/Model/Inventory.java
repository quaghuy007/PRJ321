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
public class Inventory {

    int id;
    String name;
    int quantity;
    float price;
    String urlImg;
    String des;
    Connection cnn;
    private Statement stm;
    private ResultSet rs;
    PreparedStatement statement;

    public Inventory() {
        try {
            cnn = new DBContext().getConnection();
            System.out.println("Success");
        } catch (Exception e) {
            System.out.println("connect fail : " + e.getMessage());
        }
    }

    public Inventory(int id, String name, int quantity, float price, String urlImg, String des) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.urlImg = urlImg;
        this.des = des;
        try {
            cnn = (new DBContext().getConnection());
            System.out.println("Success");
        } catch (Exception e) {
            System.out.println("connect fail : " + e.getMessage());
        }
    }

    public int getId() {
        return id;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getUrlImg() {
        return urlImg;
    }

    public void setUrlImg(String urlImg) {
        this.urlImg = urlImg;
    }


    public ArrayList<Inventory> searchByPr(String priceLow, String priceHigh) {
        ArrayList<Inventory> products = new ArrayList<>();
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "SELECT * FROM tblMatHang WHERE price BETWEEN "+priceLow+" AND "+priceHigh+";";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                Inventory i = new Inventory(rs.getInt("id"), rs.getString("name"), rs.getInt("quantity"), rs.getFloat("price"), rs.getString("url_img"), rs.getString("describe"));
                products.add(i);
            }
        } catch (SQLException e) {
            System.out.println("fail : " + e.getMessage());
        }
        return products;
    }
    public ArrayList<Inventory> getAllProduct() {
        ArrayList<Inventory> products = new ArrayList<>();
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "Select * from tblMatHang";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                Inventory i = new Inventory(rs.getInt("id"), rs.getString("name"), rs.getInt("quantity"), rs.getFloat("price"), rs.getString("url_img"), rs.getString("describe"));
                products.add(i);
            }
        } catch (SQLException e) {
            System.out.println("fail : " + e.getMessage());
        }
        return products;
    }

    public ArrayList<Inventory> getAllProductByName(String name) {
        ArrayList<Inventory> products = new ArrayList<>();
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "Select * from tblMatHang where name=" + name + "";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                Inventory i = new Inventory(rs.getInt("id"), rs.getString("name"), rs.getInt("quantity"), rs.getFloat("price"), rs.getString("url_img"), rs.getString("describe"));
                products.add(i);
            }
        } catch (SQLException e) {
            System.out.println("fail : " + e.getMessage());
        }
        return products;
    }

    public ArrayList<Inventory> getAllProductByCat(int catID) {
        ArrayList<Inventory> products = new ArrayList<>();
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "Select * from tblMatHang where catalongId=" + catID + "";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                Inventory i = new Inventory(rs.getInt("id"), rs.getString("name"), rs.getInt("quantity"), rs.getFloat("price"), rs.getString("url_img"), rs.getString("describe"));
                products.add(i);
            }
        } catch (SQLException e) {
            System.out.println("fail : " + e.getMessage());
        }
        return products;
    }
    public Inventory getProductByID(int ID) {
        
        Inventory i = null;
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "Select * from tblMatHang where id=" + ID + "";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                i = new Inventory(rs.getInt("id"), rs.getString("name"), rs.getInt("quantity"), rs.getFloat("price"), rs.getString("url_img"), rs.getString("describe"));
                
            }
        } catch (SQLException e) {
            System.out.println("fail : " + e.getMessage());
        }
        return i;
    }
    public void quantitySub(int inId,int quantity){
        Inventory i = getProductByID(inId);
        i.setQuantity(i.getQuantity()-quantity);
        insertDBSub(inId, i.getQuantity()-quantity);
        
    }
    public void insertDBSub(int id, int quantity){   
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "UPDATE tblMatHang set(quantity="+quantity+" where id = "+id+"";
            rs = stm.executeQuery(strSelect);
        }catch (SQLException e) {
            System.out.println("fail : " + e.getMessage());
        }
    }
}
