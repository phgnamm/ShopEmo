<%-- 
    Document   : viewCart.jsp
    Created on : Jul 21, 2023, 10:28:20 PM
    Author     : PC
--%>

<%@page import="java.util.List"%>
<%@page import="shopping.Cart"%>
<%@page import="shopping.Comestic"%>
<%@page import="Users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                background-image: url("https://marketplace.canva.com/EAD2962NKnQ/2/0/1600w/canva-rainbow-gradient-pink-and-purple-virtual-background-_Tcjok-d9b4.jpg");
                background-repeat: no-repeat;
                background-size: cover;
            }

            h1 {
                color: #333;
                text-align: center;
            }

            input[value="Logout"]{
                display: inline-block;
                background-color: #f44336;
                color: #ffffff;
                border: none;
                border-radius: 5px;
                padding: 12px 200px;
                font-size: 16px;
                font-weight: bold;
                text-transform: uppercase;
                cursor: pointer;
                transition: background-color 0.3s ease-in-out;
            }

            input[value="Logout"]:hover {
                background-color: #d32f2f;
            }

            table {
                border-collapse: collapse;
                width: 100%;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }

            th,
            td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ccc;
            }

            th {
                background-color: #333;
                color: #fff;
            }

            tr:nth-child(even) {
                background-color: while;
            }

            .error {
                color: red;
            }

            h2 {
                color: #333;
            }

            input[type="submit"] {
                padding: 10px 20px;
                background-color: #333;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            input[type="submit"]:hover {
                background-color: #555;
            }

            td a {
                display: inline-block;
                padding: 5px 10px;
                background-color: #f44336;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            td a:hover {
                background-color: #d32f2f;
            }

            input[name="search"] {
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 3px;
                font-size: 14px;
                width: 200px;
                transition: border-color 0.3s ease;
            }

            input[name="search"]:focus {
                border-color: #555;
            }
            h2.total-amount {
                padding: 10px;
                background-color: #f9f9f9;
                border: 2px solid #333;
                border-radius: 5px;
                color: #333;
                text-align: center;
            }
            input[name="action"] {
                display: block;
                margin: 0 auto;
                padding: 15px 30px;
                font-size: 10px;
                background-color: #333;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            input[name="action"]:hover {
                background-color: #555;
            }
            a {
                display: block;
                text-align: center;
                color: #0066cc;
                text-decoration: none;
                font-weight: bold;
                margin-top: 30px;

            }
            input[value="Checkout"]{
                display: inline-block;
                background-color: #4CAF50;
                color: #ffffff;
                border: none;
                border-radius: 5px;
                padding: 12px 190px;
                font-size: 16px;
                font-weight: bold;
                text-transform: uppercase;
                cursor: pointer;
                transition: background-color 0.3s ease-in-out;
            }

            input[value="Checkout"]:hover {
                background-color: #055605;
            }
            form {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 20px;
            }
            td.image-cell {
                text-align: center;
            }

            td.image-cell img {
                max-width: 120px;
                max-height: 120px;
                width: auto;
                height: auto;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <% List<Comestic> ListProduct = (List<Comestic>) session.getAttribute("LIST_PRODUCT");
                double total = 0;
            %>
            <h1>Your selected product</h1>
            <% Cart cart = (Cart) session.getAttribute("CART");
                if (cart != null && cart.getCart().size() > 0) { %>
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Images</th>                     
                        <th>Edit</th>
                        <th>Remove</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <% int count = 1;
                        for (Comestic elem : cart.getCart().values()) {
                            total += elem.getQuantity() * elem.getPrice();
                            int maxQuantity = 0;
                            for (Comestic co : ListProduct) {
                                if (elem.getId().equals(co.getId())) {
                                    maxQuantity = co.getQuantity();
                                    break;
                                }
                            }
                    %>
                <form action="MainController" method="POST">
                    <tr>
                        <td><%= count++%></td>
                        <td><input type="text" name="id" value="<%= elem.getId()%>" readonly=""></td>
                        <td><%= elem.getName()%></td>
                        <td><%= elem.getPrice()%></td>
                        <td><input type="number" name="quantity" min="1" max="<%= maxQuantity%>" value="<%= elem.getQuantity()%>" required=""></td>
                        <td class="image-cell"><img src="<%= elem.getImages()%>" alt="Product Image"></td>
                        <td><input type="submit" name="action" value="Edit"></td>
                        <td><input type="submit" name="action" value="Remove"></td>
                        <td><%= elem.getPrice() * elem.getQuantity()%>$</td>
                    </tr>
                </form>
                <% } %>
                </tbody>
            </table>
            <% }%>
            <h2 class="total-amount">Total: <%= total%>$</h2>
            <a href="shopping.jsp" class="add-more-link">Add more</a>
            <br/>
            <br/>
            <% UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
                String UserID = user.getUserID();
            %>
            <form action="MainController">
                <input type="submit" name="action" value="Checkout">
                <input type="hidden" name="total" value="<%= total%>">
                <input type="hidden" name="userID" value="<%= UserID%>">
                <% String MESSAGE = (String) request.getAttribute("MESSAGE");
                    if (MESSAGE == null) {
                        MESSAGE = "";
                    }
                %>
                <p class="message"><%= MESSAGE%></p>
            </form>
            <form action="MainController">
                <input type="submit" name="action" value="Logout"/>
            </form>
        </div>
    </body>
</html>
