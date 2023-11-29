<%-- 
    Document   : login
    Created on : Jul 21, 2023, 10:28:20 PM
    Author     : PC
--%>

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
            }

            h2 {
                color: #333333;
                margin-left: auto;
                margin-right: auto;
                text-align: center;
                margin-bottom: 10px;
            }

            form {
                background-color: #ffffff;
                padding: 50px;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                max-width: 300px;
                margin: 0 auto;
            }

            form input[type="text"],
            form input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
                margin-left: -10px;
            }

            form input[type="submit"],
            form input[type="reset"] {
                width: 100%;
                padding: 10px;
                margin-top: 10px;
                background-color: #4CAF50;
                color: #ffffff;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }

            .link-container {
                text-align: center;
                margin-top: 10px;
            }

            .link-container a {
                color: #0066cc;
                text-decoration: none;
                display: inline-block;
            }
        </style>
    </head>
    <body>
         <h2>LOGIN</h2>
        <form action="MainController" method="POST">
            User ID<input type="text" name="userID" required=""/><br/>
            Password<input type="password" name="password" required=""/><br/>
            <p style="color: red">${ERROR} </p><br>
            <input type="submit" name="action" value="Login"/>
            <input type="reset" value="Reset"/>
        </form>
        <div class="link-container">
            <a href="MainController?action=CreatePage">Create a new account</a>
        </div>
    </body>
</html>
