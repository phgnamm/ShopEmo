<%-- 
    Document   : shopping.jsp
    Created on : Jul 21, 2023, 10:28:20 PM
    Author     : PC
--%>

<%@page import="java.util.List"%>
<%@page import="shopping.Comestic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                padding: 20px;
                background-image: url("https://marketplace.canva.com/EAD2962NKnQ/2/0/1600w/canva-rainbow-gradient-pink-and-purple-virtual-background-_Tcjok-d9b4.jpg");
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
            }

            .container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }

            .product-table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            .product-table th,
            .product-table td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ccc;
            }

            .product-table th {
                background-color: #333;
                color: #fff;
            }

            .message {
                color: green;
                margin-bottom: 10px;
                text-align: center;
            }

            form {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
            }

            select,
            input[type="submit"] {
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 3px;
                margin-right: 10px;
            }

            .logout-btn {
                background-color: #4CAF50;
                color: #fff;
                border: none;
                cursor: pointer;
            }            
        </style>
    </head>
    <body>
        <div class="container">
            <h1>FOOD STORE</h1>
            <% List<Comestic> ListProduct = (List<Comestic>) session.getAttribute("LIST_PRODUCT"); %>
            <table class="product-table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Product Price</th>
                        <th>Product Quantity</th>
                        <th>Product Images</th>
                    </tr>
                </thead>
                <tbody>
                    <% int count = 1;
                        for (Comestic co : ListProduct) {
                    %>
                    <tr>
                        <td><%= count++%></td>
                        <td><%= co.getId()%></td>
                        <td><%= co.getName()%></td>
                        <td><%= co.getPrice()%></td>
                        <td><%= co.getQuantity()%></td>
                        <td data-title="Images"><img src="<%= co.getImages()%>" width="120px" height="120px"></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <br/>
            <h1>ADD PRODUCT TO YOUR CART</h1>
            <form action="MainController" method="POST">
                <select name="cmbComestics">
                    <% for (Comestic co : ListProduct) { %>
                    <% String tmp = co.getId() + "-" + co.getName().replaceAll("\\s", "") + "-" + co.getPrice()+ "-" + co.getImages();
                        String tmp1 = co.getName() + "-" + co.getPrice() + "$";%>
                    <option value=<%= tmp%>><%= tmp1%></option>
                    <% } %>
                </select>
                <select name="cmbQuantity">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="10">10</option>
                </select>
                <input type="submit" name="action" value="Add"/>
                <input type="submit" name="action" value="View"/>
            </form>
            <% String message = (String) request.getAttribute("MESSAGE");
                if (message == null) {
                    message = "";
                }%>
            <p class="message"><%= message%></p>
            <form action="MainController">
                <input type="submit" name="action" value="Logout" class="logout-btn"/>
            </form>
        </div>
    </body>
</html>
