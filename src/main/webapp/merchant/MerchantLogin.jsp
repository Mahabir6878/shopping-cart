<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Merchant Login Page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .main {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            background-color: #007bff;
            color: #fff;
            padding: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            min-width: 450px;
            margin: 50px auto;
            background-color: #fff;
            padding: 40px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            border-bottom: 1px solid black;
        }

        form {
            display: flex;
            flex-direction: column;
            margin: 10px;
            padding: 10px;
        }

        input[type="text"],
        input[type="password"] {
        	width:100%;
            padding: 10px 20px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            border-radius: 0 0 5px 5px;
            margin-top: auto;
        }
    </style>
</head>
<body>
    <div class="main">
        <header>
            <h1>ROY.</h1>
        </header>
        <div class="container">
            <h1>Merchant Login</h1>
            <form action="loginValidation" method="post">
                <input type="text" name="email" placeholder="Enter email">
                <input type="password" name="password" placeholder="Enter password">
                <input type="submit" value="Login">
            </form>
        </div>
        <footer>
            <p>&copy; 2024 Merchant Menu. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>
