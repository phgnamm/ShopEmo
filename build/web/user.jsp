<%-- 
    Document   : user.jsp
    Created on : Jul 21, 2023, 10:28:20 PM
    Author     : PC
--%>

<%@page import="Users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .container {
                max-width: 600px;
                margin: 0 auto;
                padding: 20px;
                background-color: #ffffff;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            h2 {
                text-align: center;
                color: #333333;
                margin-bottom: 20px;
            }

            .user-info {
                margin-bottom: 20px;
            }

            h3 {
                color: #333333;
                margin-bottom: 5px;
            }

            p {
                margin: 0;
            }

            .store-link {
                display: block;
                text-align: center;
                padding: 10px;
                background-color: #333;
                color: #ffffff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .store-link:hover {
                background-color: #555;
            }

            .logout-btn {
                display: block;
                margin: 0 auto;
                padding: 10px;
                background-color: #ff3333;
                color: #ffffff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .logout-btn:hover {
                background-color: #ff5555;
            }
            .user-info {
                text-align: center;
                margin-bottom: 20px;
            }

            .user-info h3 {
                color: #333333;
                font-size: 18px;
                margin-bottom: 5px;
            }

            .user-info p {
                color: #555555;
                font-size: 16px;
                margin-bottom: 10px;
            }
            .store-link {
                margin-bottom: 10px;
            }

            .logout-btn {
                margin-top: 10px;
            }
            body {
                font-family: Arial, sans-serif;
                padding: 20px;
                background-image: url("https://marketplace.canva.com/EAD2962NKnQ/2/0/1600w/canva-rainbow-gradient-pink-and-purple-virtual-background-_Tcjok-d9b4.jpg");
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
                height: 100vh;
                margin: 0;
                
            }
        </style>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
        %>
        <div class="container">
            <h2>User Information</h2>
            <div class="user-info">
                <h3>User ID:</h3>
                <p><%= loginUser.getUserID()%></p>
                <h3>Full Name:</h3>
                <p><%= loginUser.getFullName()%></p>
                <h3>Role ID:</h3>
                <p><%= loginUser.getRoleID()%></p>
                <h3>Password:</h3>
                <p><%= loginUser.getPassword()%> ******</p>
            </div>
            <a href="MainController?action=ShoppingPage" class="store-link">Visit Store</a>
            <form action="MainController">
                <input type="submit" name="action" value="Logout" class="logout-btn"/>
            </form>
        </div>
    </body>
</html>
