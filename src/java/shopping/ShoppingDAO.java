/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import utils.DBUtils;

/**
 *
 * @author PC
 */
public class ShoppingDAO {
     private static final String GETLISTPRODUCT = "SELECT productID, productName, productPrice, productQuantity,images FROM tblProduct WHERE productName like ? ";
     private static final String SEARCH = "SELECT productID, productName, productPrice, productQuantity,images FROM tblProduct WHERE productName like ? ";
     private static final String CHECKPRODUCTID = "SELECT productID FROM tblProduct WHERE productID = ? ";
     private static final String INSERT = "INSERT INTO tblProduct (productID, productName, productPrice, productQuantity,images) VALUES (?,?,?,?,?) ";
     private static final String UPDATE = "UPDATE tblProduct SET  productName = ?, productPrice = ?, productQuantity = ? WHERE productID = ? ";
     private static final String INSERTORDER = "INSERT INTO tblOrder (orderID, userID, date, total) VALUES (?,?,?,?) ";
     private static final String INSERTORDERDETAILS = "INSERT INTO tblOrderDetail (orderDetailID, orderID, productID, producPrice, productQuantity) VALUES (?,?,?,?,?) ";
    private static final String UPDATEPRODUCT = "UPDATE tblProduct SET productQuantity = ? WHERE productID = ? ";

     private static final String DELETE = "DELETE tblProduct WHERE productID = ? ";
       public List<Comestic> ListProduct() throws SQLException {
        List<Comestic> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETLISTPRODUCT);
                ptm.setString(1, "%" + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double productPrice = rs.getDouble("productPrice");
                    int productQuantity = rs.getInt("productQuantity");
                    String images = rs.getString("images");
                    listProduct.add(new Comestic(productID, productName, productPrice, productQuantity, images));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return listProduct;

    }
       public List<Comestic> SearchListProduct(String search) throws SQLException {
        List<Comestic> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double productPrice = rs.getDouble("productPrice");
                    int productQuantity = rs.getInt("productQuantity");
                    String images = rs.getString("images");
                    listProduct.add(new Comestic(productID, productName, productPrice, productQuantity, images));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return listProduct;
    }
       
       public boolean CheckProductID(String productID) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECKPRODUCTID);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
        public boolean insertProduct(Comestic comestic) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, comestic.getId());
                ptm.setString(2, comestic.getName());
                ptm.setDouble(3, comestic.getPrice());
                ptm.setInt(4, comestic.getQuantity());
                ptm.setString(5, comestic.getImages());
                check = ptm.executeUpdate() > 0 ? true : false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }
        public boolean updateProduct(Comestic comestic) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, comestic.getName());
                ptm.setDouble(2, comestic.getPrice());
                ptm.setInt(3, comestic.getQuantity());               
                ptm.setString(4, comestic.getId());
                
                check = ptm.executeUpdate() > 0 ? true : false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }
        public boolean deleteProduct(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, productID);
                check = ptm.executeUpdate() > 0 ? true : false;

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }
           public String insertCheckout(String userID, Cart cart, double total) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        String orderID = null;
        String orderDertailsID = null;
        List<Comestic> ListProduct = ListProduct();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {

                //insert into table Order
                ptm = conn.prepareStatement(INSERTORDER);
                java.util.Date utilDate = new java.util.Date();
                java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
                orderID = UUID.randomUUID().toString().substring(0, 4).toUpperCase();
                ptm.setString(1, orderID);
                ptm.setString(2, userID);
                ptm.setDate(3, sqlDate);
                ptm.setDouble(4, total);
                check = ptm.executeUpdate() > 0 ? true : false;
                if (check == false) {
                    return null;
                } else {
                    if (ptm != null) {
                        ptm.close();
                    }
                }

                //insert into table orderDetails
                
                //check Quantity
                for (Comestic ca : cart.getCart().values()) {
                    for (Comestic pro : ListProduct) {
                        if (ca.getId().equals(pro.getId())) {
                            if (ca.getQuantity() > pro.getQuantity()) {
                                return null;
                            }
                        }
                    }
                }

                //insert
                for (Comestic co : cart.getCart().values()) {
                    orderDertailsID = UUID.randomUUID().toString().substring(0, 4).toUpperCase();
                    ptm = conn.prepareStatement(INSERTORDERDETAILS);
                    ptm.setString(1, orderDertailsID);
                    ptm.setString(2, orderID);
                    ptm.setString(3, co.getId());
                    ptm.setDouble(4, co.getPrice());
                    ptm.setInt(5, co.getQuantity());
                    check = ptm.executeUpdate() > 0 ? true : false;
                    if (check == false) {
                        return null;
                    }
                    if (ptm != null) {
                        ptm.close();
                    }

                    //update new quantity for product
                    
                    ptm = conn.prepareStatement(UPDATEPRODUCT);
                    for (Comestic cos : ListProduct) {
                        if (cos.getId().equals(co.getId())) {
                            ptm.setInt(1, cos.getQuantity() - co.getQuantity());
                            ptm.setString(2, cos.getId());
                            check = ptm.executeUpdate() > 0 ? true : false;
                            if (check == false) {
                                return null;
                            } else {
                                if (ptm != null) {
                                    ptm.close();
                                }
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return orderID;
    }
}
        
        
