<%@page import="com.jsp.shoppingcart.dto.Product"%>
<%@page import="java.util.List"%>
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
        padding: 5px;
        text-align: center;
    }
    .declare{
    	text-align: center;
    	margin: 20px;
    }
    .container {
        max-width: 800px;
        margin: 20px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
    .cart {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    .cart th, .cart td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }
    .cart th {
        background-color: #333;
        color: #fff;
        text-align: left;
    }
    .cart tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    .cart tr:hover {
        background-color: #ddd;
    }
    .cart-actions {
        text-align: center;
    }
    .cart-actions a {
        text-decoration: none;
        color: #333;
        padding: 5px 10px;
        background-color: #eee;
        border-radius: 5px;
    }
    .cart-actions a:hover {
        background-color: #ddd;
    }
</style>
</head>
<body>
<div class="header">
    <h1>Merchant Dashboard</h1>
</div>

<h1 class="declare">All Product list</h1>
<div class="container">
    <% Merchant m=(Merchant)session.getAttribute("merchantinfo");
       List<Product> products=m.getProducts();
    %>
    <table class="cart">
        <thead>
            <tr>
                <th>Brand</th>
                <th>Model</th>
                <th>Category</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% for(Product p:products){ %>
            <tr>
                <td><%= p.getBrand() %></td>
                <td><%= p.getModel() %></td>
                <td><%= p.getCategory() %></td>
                <td><%= p.getPrice() %></td>
                <td><%= p.getStock() %></td>
                <td class="cart-actions">
                    <a href="updateproduct?id=<%=p.getId()%>">Update</a>
                    <a href="deleteproduct?id=<%=p.getId()%>">Delete</a>
                </td>
            </tr>
            <%} %>
        </tbody>
    </table>
</div>
<div class="footer">
    <p>&copy; 2024 Merchant Menu. All rights reserved.</p>
</div>
</body>
</html>
