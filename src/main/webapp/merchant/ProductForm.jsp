<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Product Form</title>
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
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .container h1{
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
        form {
            margin-top: 20px;
        }
        form label {
            display: block;
            margin-bottom: 10px;
        }
        form input[type="text"]{
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
    	<h1>Product Form</h1>
        <form:form modelAttribute="productobj" action="saveproduct" method="post">
            <label for="brand">Enter Brand:</label>
            <form:input path="brand" id="brand"/>
            <label for="model">Enter Model:</label>
            <form:input path="model" id="model"/>
            <label for="category">Enter Category:</label>
            <form:input path="category" id="category"/>
            <label for="price">Enter Price:</label>
            <form:input path="price" id="price"/>
            <label for="stock">Enter Stock:</label>
            <form:input path="stock" id="stock"/>
            <input type="submit" value="Submit">
        </form:form>
    </div>
    <div class="footer">
        <p>&copy; 2024 Merchant Menu. All rights reserved.</p>
    </div>
</body>
</html>
