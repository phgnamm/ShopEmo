<%-- 
    Document   : registration
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
               h2 {
                color: #333333;
                margin-left: auto;
                margin-right: auto;
                text-align: center;
                margin-bottom: 10px;
            }
            body {
                font-family: Arial, sans-serif;
                background-image: url("https://marketplace.canva.com/EAD2962NKnQ/2/0/1600w/canva-rainbow-gradient-pink-and-purple-virtual-background-_Tcjok-d9b4.jpg");
                padding: 20px;
            }

            form {
                max-width: 400px;
                margin: 0 auto;
                padding: 20px 80px 20px 50px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            input[type="submit"],
            input[type="reset"] {
                padding: 10px 20px;
                background-color: #0066cc;
                color: #fff;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }

            input[type="submit"]:hover,
            input[type="reset"]:hover {
                background-color: #0056b3;
            }

            .error-message {
                color: red;
                font-style: italic;
                margin-bottom: 10px;
            }
            
        </style>
    </head>
     <body>
          <h2>REGISTRATION</h2>
        <form action="MainController" method="POST">
            User ID <input type="text" name="userID" required=""/>
            </br>Full Name<input type="text" name="fullName" required=""/>
            </br>Role ID<input type="text" name="roleID" value="US" readonly=""/>
            </br>Password<input type="password" name="password" required=""/>
            </br>Confirm<input type="password" name="confirm" required="" />
            <p style="color: #32CD32">${success} </p><br>
            <p style="color: red">${error} </p><br>
            </br><input type="submit" name="action" value="Create"/>
            <input type="reset" value="Reset"/>

        </form>
    </body>
</html>
