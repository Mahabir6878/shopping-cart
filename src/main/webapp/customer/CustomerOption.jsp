<%@page import="com.jsp.shoppingcart.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        .declare{
        	margin: 20px;
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
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .container h1{
        	text-align: center;
        	border-bottom: 2px solid black;
        	margin: 10px 10px 30px 10px;
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
        
        hr {
            margin: 20px 0;
        }
        a {
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>ROY.</h1>
    </div>
    <h1 class="declare">${msg}</h1>
    <div class="container">
        <% Customer c=(Customer)session.getAttribute("customerinfo"); 
           if(c==null){
        %>
        <h2><a href="CustomerLogin.jsp">Please login First</a></h2>
        <% }else{%>
        <h1>Please choose a option</h1>
        <h2><a href="AllProductCus">Display All Products</a></h2>
        <hr>
        <h2><a href="getBrand.jsp">Display All Products by Brand</a></h2>
        <hr>
        <h2><a href="productByCategory">Display All Products by Category</a></h2>
        <hr>
        <h2><a href="productByrange">Display All Products between Range</a></h2>
        <hr>
        <%} %>
    </div>
    <footer>
        <p>&copy; 2024 Customer Menu. All rights reserved.</p>
    </footer>
</body>
</html>
