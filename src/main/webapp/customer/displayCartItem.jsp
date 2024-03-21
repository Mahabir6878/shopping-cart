<%@page import="com.jsp.shoppingcart.dto.Item"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping Cart</title>
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
        padding: 10px;
        text-align: center;
    }
    .container {
        max-width: 800px;
        margin: 20px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .btn{
    	border: 1px solid blue;
    	padding: 3px;
    	border-radius: 5px;
    	box-shadow: 0px 0px 10px blue;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #007bff;
        color: #fff;
        text-align: left;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #ddd;
    }
    a {
        text-decoration: none;
        color: #007bff;
    }
    a:hover {
        color: #0056b3;
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
	    <div style="display: flex; justify-content: space-between; align-items: center;">
	        <h1>ROY.</h1>
	        <h2 class="btn"><a href="veiwallproduct" style="text-decoration: none; color: #fff; font-size: 17px;">View Product</a></h2>
	    </div>
	</div>
    <div class="container">
        <% List<Item> items=(List<Item>)request.getAttribute("itemlist"); %>
        <h2>All Product List</h2>
        <table>
            <thead>
                <tr>
                    <th>Brand</th>
                    <th>Model</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                <% for(Item item : items) { %>
                <tr>
                    <td><%= item.getBrand() %></td>
                    <td><%= item.getModel() %></td>
                    <td><%= item.getQuantity() %></td>
                    <td><%= item.getPrice() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <h2>Total Price: <%= request.getAttribute("price") %></h2>
        <h3><a href="AddOrderForm.jsp">Buy Now</a></h3>
    </div>
    <div class="footer">
        <p>&copy; 2024 All rights reserved.</p>
    </div>
</body>
</html>
