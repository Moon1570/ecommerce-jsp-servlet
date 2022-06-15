<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="javascript/jquery.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
<link rel="stylesheet" href="./css/admin.css">
<link rel="stylesheet" href="./css/menubar.css">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet">
<title>Admin</title>
</head>
<body>

<%
		session = request.getSession();
		if (session.getAttribute("adminlogin") == "false" || session.getAttribute("adminlogin") == null) {
			//	request.getRequestDispatcher("admin-login.jsp");
			System.out.println(session.getAttribute("adminlogin"));
			response.sendRedirect("admin-login.jsp");

		} else {
	%>



<div id="navbar">

		<div class="logo">
			KachaBazar.com <a href="./Homepage.jsp">View Page</a>
		</div>
		<div class="search">
			<input class="search-box" placeholder="Type to search"> <input
				type="submit" class="search-button" value="Search">
		</div>
		<div class="menu-items">
			<a class="active" href="index.jsp">Home</a> <a
				href="./admin?action=viewprofile">Profile</a> <a
				href="./admin?action=adminlogout">Logout</a>
		</div>
	</div>
	

	<%
		}
	%>


</body>
</html>