/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
public class MainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String LOGIN_PAGE = "login.jsp";
    
    private static final String CREATE_PAGE = "CreatePage";
    private static final String CREATE_PAGE_VIEW = "registration.jsp";
    
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    
    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLLER = "SearchController";
    
    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLLER = "DeleteController";
    
    private static final String UPDATE = "Update";
    private static final String UPDATE_CONTROLLER = "UpdateController";
    
    private static final String SHOPPING_PAGE_ADMIN = "ShoppingPageAdmin";
    private static final String SHOPPING_PAGE_ADMIN_VIEW = "shoppingadmin.jsp";
    
    private static final String SEARCHPRODUCT = "SearchProduct";
    private static final String SEARCH_PRODUCT_CONTROLLER = "SearchProductController";
    
    private static final String ADDPRODUCT = "AddProduct";
    private static final String ADD_PRODUCT_CONTROLLER = "AddProductController";
    
    private static final String UPDATEPRODUCT = "UpdateProduct";
    private static final String UPDATE_PRODUCT_CONTROLLER = "UpdateProductController";
    
    private static final String DELETEPRODUCT = "DeleteProduct";
    private static final String DELETE_PRODUCT_CONTROLLER = "DeleteProductController";
    
    private static final String SHOPPING_PAGE = "ShoppingPage";
    private static final String SHOPPING_PAGE_VIEW = "GetListProductController";
    
    private static final String ADD = "Add";
    private static final String ADD_CONTROLLER = "AddController";
    
    private static final String VIEW = "View";
    private static final String VIEW_PAGE = "viewCart.jsp";
    
    private static final String EDIT = "Edit";
    private static final String EDIT_CONTROLLER = "EditController";

    private static final String REMOVE = "Remove";
    private static final String REMOVE_CONTROLLER = "RemoveController";
    
    private static final String CHECKOUT = "Checkout";
    private static final String CHECKOUT_CONTROLLER = "CheckoutController";
    
     private static final String CREATE = "Create";
    private static final String CREATE_CONTROLLER = "RegistrationController";


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = LOGIN_PAGE;
            }else if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (CREATE_PAGE.equals(action)) {
                url = CREATE_PAGE_VIEW;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            }else if (SEARCH.equals(action)) {
                url = SEARCH_CONTROLLER;
            }else if (DELETE.equals(action)) {
                url = DELETE_CONTROLLER;
            } else if (UPDATE.equals(action)) {
                url = UPDATE_CONTROLLER;
            } else if (SHOPPING_PAGE_ADMIN.equals(action)) {
                url = SHOPPING_PAGE_ADMIN_VIEW;
            } else if (SEARCHPRODUCT.equals(action)) {
                url = SEARCH_PRODUCT_CONTROLLER;
            }else if (ADDPRODUCT.equals(action)) {
                url = ADD_PRODUCT_CONTROLLER;
            }else if (UPDATEPRODUCT.equals(action)) {
                url = UPDATE_PRODUCT_CONTROLLER;
            }else if (DELETEPRODUCT.equals(action)) {
                url = DELETE_PRODUCT_CONTROLLER;
            }else if (SHOPPING_PAGE.equals(action)) {
                url = SHOPPING_PAGE_VIEW;
            }else if (ADD.equals(action)) {
                url = ADD_CONTROLLER;
            }else if (VIEW.equals(action)) {
                url = VIEW_PAGE;
            }else if (EDIT.equals(action)) {
                url = EDIT_CONTROLLER;
            }else if (REMOVE.equals(action)) {
                url = REMOVE_CONTROLLER;
            }else if (CHECKOUT.equals(action)) {
                url = CHECKOUT_CONTROLLER;
            } else if (CREATE.equals(action)) {
                url = CREATE_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
