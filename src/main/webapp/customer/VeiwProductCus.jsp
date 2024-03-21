<%@page import="com.jsp.shoppingcart.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.shoppingcart.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>
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
        padding: 1px 20px;
        text-align: center;
    }
    .btn{
    	border: 1px solid blue;
    	padding: 3px;
    	border-radius: 5px;
    	box-shadow: 0px 0px 10px blue;
    }
    .container {
        max-width: 800px;
        margin: 20px auto;
        background-color: #fff;
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
    h1, h2, h3 {
        text-align: center;
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
    button {
        padding: 5px 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <div class="header">
	    <div style="display: flex; justify-content: space-between; align-items: center;">
	        <h1>ROY.</h1>
	        <h2 class="btn"><a href="fetchallitemfromcart" style="text-decoration: none; color: #fff; font-size: 17px;">View Cart</a></h2>
	    </div>
	</div>
    <div class="container">
        <%  
            List<Product> products=(List<Product>)request.getAttribute("products");
        %>
        <h2>All product list</h2>
        <table>
            <thead>
                <tr>
                    <th>Brand</th>
                    <th>Model</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Add to Cart</th>
                </tr>
            </thead>
            <tbody>
                <% for(Product p:products){ %>
                <tr>
                    <td><%= p.getBrand() %></td>
                    <td><%= p.getModel() %></td>
                    <td><%= p.getCategory() %></td>
                    <td><%= p.getPrice() %></td>
                    <td><a href="addcart?id=<%= p.getId()%>"><button>Add to Cart</button></a></td>
                </tr>
                <%} %>
            </tbody>
        </table>
    </div>
    <footer>
        <p>&copy; 2024 All rights reserved.</p>
    </footer>
</body>
</html>
