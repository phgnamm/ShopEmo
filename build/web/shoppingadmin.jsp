<%-- 
    Document   : shoppingadmin.jsp
    Created on : Jul 21, 2023, 10:28:20 PM
    Author     : PC
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="shopping.Comestic"%>
<%@page import="Users.UserDTO"%>
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
            }

            form.logout-form {
                display: inline-block;
            }

            form.logout-form input[type="submit"] {
                padding: 10px 20px;
                background-color: #333;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            form.logout-form input[type="submit"]:hover {
                background-color: #555;
            }

            table {
                border-collapse: collapse;
                width: 100%;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }

            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ccc;
            }

            th {
                background-color: #333;
                color: #fff;
            }

            tr:nth-child(even) {
                background-color: white;
            }

            .error {
                color: red;
            }

            h2 {
                color: #333;
                text-align: center;
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
            h1 {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h1>ADMIN SHOPPING PAGE </h1> 
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }
        %>
        <form action="MainController">
            <input type="submit" name="action" value="Logout"/>
        </form>
        <% int count = 1; %>
        <%
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <form id="search" action="MainController">
            <input type="text" name="search" placeholder="Type ProductID here" value="<%= search%>"/>
            <input type="hidden" name="action" value="SearchProduct"/>
            <input type="submit" value="Search"/>
        </form>
        <%
            List<Comestic> list = (List<Comestic>) request.getAttribute("LIST_PRODUCT");
            if (list != null) {
                if (list.size() > 0) {
        %>   
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Product Price</th>
                    <th>Product Quantity</th>
                    <th>Product Images</th>
                    <th>Product Update</th>
                    <th>Product Delete</th>

                </tr>
            </thead>
            <tbody>

                <%
                    for (Comestic product : list) {
                %>
            <form action="MainController">

                <tr>
                    <td><%= count++%></td>
                    <td><%= product.getId()%></td>
                    <td>
                        <input type="text" name="productName" value="<%=product.getName()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="productPrice" value="<%=product.getPrice()%>" required=""/>
                    </td>
                    <td> 
                        <input type="text" name="productQuantity" value="<%= product.getQuantity()%>"/>
                    </td>
                      <td data-title="Images" ><img name="images" src="<%= product.getImages()%>" width="120px" height="120px"></td> 


                    <!--update here-->
                    <td>
                        <input type="hidden" name="productID" value="<%=product.getId()%>"/>
                        <input type="hidden" name="search" value="<%=search%>"/>
                        <input type="hidden" name="action" value="UpdateProduct"/>
                        <input type="submit" value="Update"/>     


                    </td>

                    <!-- delete here-->
                    <td>
                        <a href="MainController?search=<%=search%>&action=DeleteProduct&productID=<%= product.getId()%>">Delete</a>
                    </td>

                </tr>
            </form>
            <%
                }
            %>
            <tbody/>
            <table/>
            <%
                    }
                }
            %>
            <%
                String ERRORSEARCH = (String) request.getAttribute("ERROR_SEARCH");
                if (ERRORSEARCH == null) {
                    ERRORSEARCH = "";
                }
            %>
            <%=ERRORSEARCH%>
            <br/>
            <br/>
            <br/>
            <h2>ADD PRODUCT</h2>
            <br/>
            <br/>
            <form action="MainController">
                <table border="1">
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th>Product Price</th>
                            <th>Product Quantity</th>
                            <th>Product Images</th>
                            <th>Product Add</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <input type="text" name="productID" required=""/>
                            </td>    

                            <td>
                                <input type="text" name="productName" required=""/>
                            </td>
                            <td>
                                <input type="text" name="productPrice" pattern="[0-9]+" title="please enter number here" required=""/>
                            </td>
                            <td> 
                                <input type="text" name="productQuantity" pattern="[0-9]+" title="please enter number here" required="" />
                            </td>
                            <td> 
                                <input type="text" name="images"  required="" />
                            </td>
                            <td>
                                <input type="submit" name="action" value="AddProduct"/>
                                <input type="hidden" name="search" value="<%=search%>"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
            <br/>
            <%
                String ERRORADD = (String) request.getAttribute("ERROR_ADD");
                if (ERRORADD == null) {
                    ERRORADD = "";
                }
            %>
            <%=ERRORADD%>
    </body>
</html>
