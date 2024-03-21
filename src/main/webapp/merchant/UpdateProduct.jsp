<%@page import="com.jsp.shoppingcart.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.shoppingcart.dto.Merchant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head> 
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% Product p=(Product)request.getAttribute("productinfo");
	
%>
<h1>Update product form</h1>

<form action="updateProductDetail">
	<input type="text" name="brand" value="<%= p.getBrand()%>">
	<input type="text" name="category" value="<%= p.getCategory()%>">
	<input type="text" name="model" value="<%= p.getModel()%>">
	<input type="text" name="price" value="<%= p.getPrice()%>">
	<input type="text" name="stock" value="<%= p.getStock()%>">
	<input type="submit" >
</form>





<hr>

</body>
</html>