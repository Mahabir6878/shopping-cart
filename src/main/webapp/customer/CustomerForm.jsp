<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Registration Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        .header {
            background-color: #007bff;
            color: #fff;
            padding: 5px;
            text-align: center;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            background-color: #E0FFFF;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        form {
            margin-top: 20px;
        }
        form input[type="text"], form input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        form input[type="submit"] {
            width: 100%;
            background-color: #333;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        form input[type="submit"]:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>ROY.</h1>
    </div>
    <div class="container">
    	<h1>Merchant Registration form</h1>
        <form:form action="saveCustomer" modelAttribute="customerObj" method="post">
            <label for="name">Enter Name:</label><br>
            <form:input path="name" id="name"/><br>
            <label for="mobilenumber">Enter Mobile Number:</label><br>
            <form:input path="mobilenumber" id="mobilenumber"/><br>
            <label for="email">Enter Email:</label><br>
            <form:input path="email" id="email"/><br>
            <label for="password">Enter Password:</label><br>
            <form:input path="password" type="password" id="password"/><br>
            <label for="address">Enter Address:</label><br>
            <form:input path="address" id="address"/><br>
            <input type="submit" value="Register">
        </form:form>
    </div>
    <footer>
        <p>&copy; 2024 Customer Menu. All rights reserved.</p>
    </footer>
</body>
</html>
