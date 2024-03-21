<%@page import="com.jsp.shoppingcart.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Details</title>
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
        padding: 2px;
        text-align: center;
    }
    .container {
        max-width: 600px;
        margin: 20px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    form {
        margin-top: 20px;
    }
    input[type="text"], input[type="password"] {
        width: calc(100% - 22px); /* Adjusted for input padding */
        padding: 10px;
        margin: 5px 0;
        border-radius: 5px;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }
    input[type="submit"] {
        width: 100%;
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
    .footer {
        background-color: #333;
        color: #fff;
        text-align: center;
        padding: 10px 0;
        position: fixed;
        bottom: 0;
        width: 100%;
    }
</style>
</head>
<body>

<div class="header">
    <h1>ROY.</h1>
</div>

<% Product p=(Product)request.getAttribute("product"); %>

<div class="container">
    <h1> Set the quantity </h1>
    <form action="addToCart" method="post">
        <input type="hidden" value=<%=p.getId() %> name="id">
        Brand:<input type="text" name="brand" value="<%= p.getBrand()%>" readonly="readonly"><br>
        Category:<input type="text" name="category" value="<%= p.getCategory()%>" readonly="readonly"><br>
        Model:<input type="text" name="model" value="<%= p.getModel()%>" readonly="readonly"><br>
        Price:<input type="text" name="price" value="<%= p.getPrice()%>" readonly="readonly"><br>
        Set Quantity:<input type="text" name="stock" placeholder="Enter the quantity"><br>
        <input type="submit" value="Add to Cart">
    </form>
</div>

<div class="footer">
    <p>&copy; 2024 All rights reserved.</p>
</div>

</body>
</html>
