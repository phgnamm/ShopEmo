<%-- 
    Document   : admin
    Created on : Jul 21, 2023, 10:28:20 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
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
    }

    .store {
        display: block;
        margin-bottom: 10px;
        color: blue;
        text-decoration: none;
    }

    h1 {
        color: #333;
    }

    form {
        margin-bottom: 20px;
    }

    .search {
        display: flex;
        align-items: center;
    }

    .search input[type="text"] {
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }

    .search input[type="submit"] {
        padding: 5px 10px;
        background-color: #333;
        color: #fff;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }

     table {
        border-collapse: collapse;
        width: 100%;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
        background-color: #f2f2f2;
    }

    .error {
        color: red;
    }
    .store {
    display: inline-block;
    padding: 10px 20px;
    background-color: #333;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.store:hover {
    background-color: #555;
}
 body {
        background-image: url("https://marketplace.canva.com/EAD2962NKnQ/2/0/1600w/canva-rainbow-gradient-pink-and-purple-virtual-background-_Tcjok-d9b4.jpg");
    }
     input[type="submit"][name="action"] {
        padding: 10px 20px;
        background-color: #333;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="submit"][name="action"]:hover {
        background-color: #555;
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
    
</style>
    </head>
    <body>
        <% UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <a class="store" href="MainController?action=ShoppingPageAdmin">Store</a><br/>
        <h1>Welcome: <%= loginUser.getFullName()%></h1>
        <form action="MainController">
            <input type="submit" name="action" value="Logout">
        </form>
        <form action="MainController" class="search">
            <div id="inp">
                <input type="text" name="search" placeholder="Type UserName here" value="<%= search%>">
                <input type="submit" name="action" value="Search">
            </div>
        </form>

        <% List<UserDTO> list = (List<UserDTO>) request.getAttribute("LIST_USER");
            if (list != null && list.size() > 0) { %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Role ID</th>
                    <th>Password</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <% int count = 1;
                    for (UserDTO user : list) {%>
                <tr>
                    <td><%= count++%></td>
                    <td><%= user.getUserID()%></td>
                    <td>
                        <input type="text" name="fullName" value="<%= user.getFullName()%>" required="">
                    </td>
                    <td>
                        <input type="text" name="roleID" value="<%= user.getRoleID()%>" required="">
                    </td>
                    <td><%= user.getPassword()%></td>
                    <td>

                    <input type="hidden" name="userID" value="<%= user.getUserID()%>">
                    <input type="hidden" name="search" value="<%= search%>">
                    <input type="submit" name="action" value="Update">

                    </td>
                    <td>
                        <a href="MainController?search=<%= search%>&action=Delete&userID=<%= user.getUserID()%>">Delete</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }%>
        <p class="error"><%= error%></p>
        <% }%>
    </body>
</html>
