<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Merchant Menu Page</title>
    <style>
    	*{
    		margin:0;
    		padding:0;
    		
    	}
	    .main{
	    	min-height:100vh;
	        display: flex;
   	        flex-direction: column;
	    }
        header {
            background-color: #007bff;
            padding: 15px 15px;
            text-align: center;
            display:flex;
            justify-content: space-between;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        hr {
            border: none;
            border-top: 1px solid #ccc;
        }
        h2 {
            color: #555;
            text-align: center;
        }
        .links {
            text-align: center;
            margin-top: 20px;
        }
        .links a ,.nav-link{
            display: inline-block;
            margin: 0 10px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
        
        .links a:hover {
            background-color: #0056b3;
        }
        footer {
        	margin-top:auto;
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            border-radius: 0 0 5px 5px;
        }
    </style>
</head>
<body>
	<div class="main">
		<header>
		    <div><h1>ROY.</h1></div>
		    <div>
		    	<a href="#" class="nav-link">Home</a>
			    <a href="#" class="nav-link">About</a>
			    <a href="#" class="nav-link">Product</a>
			    <a href="#" class="nav-link">Contact</a>
		    </div>
		</header>
		<div class="container">
		    <h1>Welcome to Merchant Menu Page</h1>
		    <hr>
		    <h2>${msg}</h2>
		    <div class="links">
		        <a href="addMerchant">Register</a>
		        <a href="MerchantLogin.jsp">Login</a>
		    </div>
		</div>
		<footer>
		    <p>&copy; 2024 Merchant Menu. All rights reserved.</p>
		</footer>
	</div>
</body>
</html>
