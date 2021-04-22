/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author nqh14
 */
public class Item {
    Inventory inventory;
    int quantity;

    public Item() {
    }

    public Item(Inventory inventory, int quantity) {
        this.inventory = inventory;
        this.quantity = quantity;
    }

    public Inventory getInventory() {
        return inventory;
    }

    public void setInventory(Inventory i) {
        this.inventory = i;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
