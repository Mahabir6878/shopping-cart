<%@page import="com.jsp.shoppingcart.dto.Merchant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Merchant Dashboard</title>
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
        padding: 20px;
        text-align: center;
    }
    .container {
        max-width: 800px;
        min-height:300px;
        margin: 100px auto;
        padding: 20px;
        background-color: #5F9EA0;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .hh{
    	border-bottom: 1px solid black;
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
    .link-container {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
    }
    .link-container a {
        background-color: #333;
        color: #fff;
        padding: 10px 20px;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s;
    }
    .link-container a:hover {
        background-color: #555;
    }
</style>
</head>
<body>
<div class="header">
    <h1>Merchant Dashboard</h1>
</div>
<div class="container">
    <% Merchant m=(Merchant)session.getAttribute("merchantinfo"); %>
    <% if(m!=null){ %>
    <h1>${msg}</h1>
    <h1 class="hh">Please Choose A Option</h1>
    <div class="link-container">
        <a href="addproduct">Add Product</a>
        <a href="VeiwAllProduct.jsp">View All Product</a>
    </div>
    <%}else{ %>
    <h1><a href="MerchantLogin.jsp">Please login first</a></h1>
    <%} %>
</div>
<div class="footer">
    <p>&copy; 2024 Merchant Menu. All rights reserved.</p>
</div>
</body>
</html>
