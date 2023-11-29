/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package shopping;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author PC
 */
public class Cart {
      private Map< String, Comestic> cart;

    public Cart() {
    }

    public Cart(Map<String, Comestic> cart) {
        this.cart = cart;
    }

    public Map<String, Comestic> getCart() {
        return cart;
    }

    public void setCart(Map<String, Comestic> cart) {
        this.cart = cart;
    }

    public boolean add(String id, Comestic comestics) throws SQLException {
        boolean check = false;
        ShoppingDAO shopdao = new ShoppingDAO();
        List<Comestic> ListProduct = shopdao.ListProduct();
        try {
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
            if (this.cart.containsKey(id)) {
                int currentQuantity = this.cart.get(id).getQuantity();
                int newQuantity = currentQuantity + comestics.getQuantity();
                for(Comestic co : ListProduct){
                    if(co.getId().equals(id)){
                        if(newQuantity > co.getQuantity()){
                            return false;
                        }
                    }
                }
                comestics.setQuantity(newQuantity);
            }
            this.cart.put(id, comestics);
            check = true;
        } catch (Exception e) {
        }
        return check;
    }

    public boolean remove(String id) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.remove(id);
                    check = true;
                }
            }

        } catch (Exception e) {
        }
        return check;
    }

    public boolean edit(String id, Comestic comestic) {

        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.replace(id, comestic);
                    check = true;
                }
            }

        } catch (Exception e) {
        }
        return check;

    }
}
